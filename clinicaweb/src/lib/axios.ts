export interface AxiosRequestConfig {
  baseURL?: string
  headers?: Record<string, string>
}

export interface AxiosResponse<T = unknown> {
  data: T
  status: number
  statusText: string
  headers: Record<string, string>
  config: AxiosRequestConfig
}

export class AxiosError<T = unknown> extends Error {
  response?: AxiosResponse<T>
  config: AxiosRequestConfig

  constructor(message: string, config: AxiosRequestConfig, response?: AxiosResponse<T>) {
    super(message)
    this.name = 'AxiosError'
    this.config = config
    this.response = response
  }
}

class AxiosInstance {
  private defaults: AxiosRequestConfig

  constructor(defaults?: AxiosRequestConfig) {
    this.defaults = defaults ?? {}
  }

  private buildUrl(url: string, baseURL?: string) {
    if (!baseURL) {
      return url
    }

    try {
      return new URL(url, baseURL).toString()
    } catch {
      const separator = baseURL.endsWith('/') || url.startsWith('/') ? '' : '/'
      return `${baseURL}${separator}${url}`
    }
  }

  async post<T = unknown>(url: string, data?: unknown, config?: AxiosRequestConfig): Promise<AxiosResponse<T>> {
    const finalConfig: AxiosRequestConfig = {
      ...this.defaults,
      ...config,
      headers: {
        'Content-Type': 'application/json',
        ...this.defaults.headers,
        ...config?.headers,
      },
    }

    const requestUrl = this.buildUrl(url, finalConfig.baseURL)

    const response = await fetch(requestUrl, {
      method: 'POST',
      headers: finalConfig.headers,
      body: data !== undefined ? JSON.stringify(data) : undefined,
    })

    const text = await response.text()
    let parsedData: T | string | null = null

    if (text) {
      try {
        parsedData = JSON.parse(text) as T
      } catch {
        parsedData = text
      }
    }

    const axiosResponse: AxiosResponse<T> = {
      data: parsedData as T,
      status: response.status,
      statusText: response.statusText,
      headers: Object.fromEntries(response.headers.entries()),
      config: finalConfig,
    }

    if (!response.ok) {
      throw new AxiosError('Request failed with status code ' + response.status, finalConfig, axiosResponse)
    }

    return axiosResponse
  }
}

function create(defaults?: AxiosRequestConfig) {
  return new AxiosInstance(defaults)
}

const defaultInstance = new AxiosInstance()

const axios = Object.assign(defaultInstance, {
  create,
  AxiosError,
  isAxiosError(value: unknown): value is AxiosError {
    return value instanceof AxiosError
  },
})

export default axios
