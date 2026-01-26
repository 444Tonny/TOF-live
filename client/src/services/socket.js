import { io } from 'socket.io-client'

/**
 * Service de gestion des WebSockets
 */
class SocketService {
  constructor() {
    this.socket = null
  }

  connect() {
    if (this.socket?.connected) return

    this.socket = io(import.meta.env.VITE_BACKEND_BASE_URL, {
      autoConnect: true
    })

    this.socket.on('connect', () => {
      console.log('WebSocket connecté')
    })

    this.socket.on('disconnect', () => {
      console.log('WebSocket déconnecté')
    })
  }

  disconnect() {
    if (this.socket) {
      this.socket.disconnect()
    }
  }

  emit(event, data) {
    if (this.socket) {
      this.socket.emit(event, data)
    }
  }

  on(event, callback) {
    if (this.socket) {
      this.socket.on(event, callback)
    }
  }

  off(event, callback) {
    if (this.socket) {
      this.socket.off(event, callback)
    }
  }
}

export default new SocketService()