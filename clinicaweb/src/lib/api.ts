import axios from 'axios'

export const getDefaultBaseUrl = () => {
  if (import.meta.env.VITE_API_BASE_URL) {
    return import.meta.env.VITE_API_BASE_URL
  }

  if (typeof window !== 'undefined') {
    const protocol = window.location.protocol
    const hostname = window.location.hostname
    const port = protocol === 'https:' ? '7149' : '5075'

    return `${protocol}//${hostname}:${port}`
  }

  return 'https://localhost:7149'
}

export const apiClient = axios.create({
  baseURL: getDefaultBaseUrl(),
})

export type ApiClient = typeof apiClient
