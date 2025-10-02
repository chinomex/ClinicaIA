import axios from 'axios'
import { defineStore } from 'pinia'

interface AuthState {
  isAuthenticated: boolean
  userEmail: string | null
  userFullName: string | null
}

interface LoginResponse {
  id: number
  email: string
  fullName: string
}

interface LoginResult {
  success: boolean
  message?: string
  data?: LoginResponse
}

const getDefaultBaseUrl = () => {
  if (import.meta.env.VITE_API_BASE_URL) {
    return import.meta.env.VITE_API_BASE_URL
  }

  if (typeof window !== 'undefined') {
    const protocol = window.location.protocol
    const hostname = window.location.hostname
    const port = protocol === 'https:' ? '7149' : '5075'

    return `${protocol}//${hostname}:${port}`
  }

  return 'http://localhost:5075'
}

const apiClient = axios.create({
  baseURL: getDefaultBaseUrl(),
})

export const useAuthStore = defineStore('auth', {
  state: (): AuthState => ({
    isAuthenticated: false,
    userEmail: null,
    userFullName: null,
  }),
  actions: {
    async login(email: string, password: string): Promise<LoginResult> {
      try {
        const response = await apiClient.post<LoginResponse>('/api/auth/login', {
          email,
          password,
        })

        this.isAuthenticated = true
        this.userEmail = response.data.email
        this.userFullName = response.data.fullName

        return {
          success: true,
          data: response.data,
        }
      } catch (error) {
        this.isAuthenticated = false
        this.userEmail = null
        this.userFullName = null

        if (axios.isAxiosError(error)) {
          const message =
            (error.response?.data as { message?: string } | undefined)?.message ?? 'Credenciales incorrectas.'

          return {
            success: false,
            message,
          }
        }

        return {
          success: false,
          message: 'No fue posible iniciar sesión. Inténtalo nuevamente.',
        }
      }
    },
    logout() {
      this.isAuthenticated = false
      this.userEmail = null
      this.userFullName = null
    },
  },
})
