import { defineStore } from 'pinia'

interface AuthState {
  isAuthenticated: boolean
  userEmail: string | null
}

export const useAuthStore = defineStore('auth', {
  state: (): AuthState => ({
    isAuthenticated: false,
    userEmail: null,
  }),
  actions: {
    login(email: string) {
      this.isAuthenticated = true
      this.userEmail = email
    },
    logout() {
      this.isAuthenticated = false
      this.userEmail = null
    },
  },
})
