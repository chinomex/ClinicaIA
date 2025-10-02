import axios from 'axios'
import { defineStore } from 'pinia'

interface AuthState {
  isAuthenticated: boolean
  userEmail: string | null
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
    return `${window.location.protocol}//${window.location.hostname}:5000`
  }

  return 'http://localhost:5000'
}

const apiClient = axios.create({
  baseURL: getDefaultBaseUrl(),
})

export const useAuthStore = defineStore('auth', {
  state: (): AuthState => ({
    isAuthenticated: false,
    userEmail: null,
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

        return {
          success: true,
          data: response.data,
        }
      } catch (error) {
        this.isAuthenticated = false
        this.userEmail = null

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
    },
  },
})
