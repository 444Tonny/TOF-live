<template>
  <div class="login-view">
    <div class="login-card">
      <h1>🎮 True or False</h1>
      <p>Entrez le mot de passe pour accéder au jeu</p>
      
      <form @submit.prevent="handleLogin">
        <input 
          v-model="password"
          type="password"
          placeholder="Mot de passe"
          class="password-input"
          autofocus
        />
        <button type="submit" :disabled="loading">
          {{ loading ? 'Vérification...' : 'Entrer' }}
        </button>
      </form>
      
      <div v-if="error" class="error">{{ error }}</div>
    </div>
  </div>
</template>

<script setup>
import { ref } from 'vue'
import { useRouter } from 'vue-router'

const router = useRouter()
const password = ref('')
const loading = ref(false)
const error = ref(null)

const handleLogin = async () => {
    if (!password.value) {
        error.value = 'Entrez un mot de passe'
        return
    }
    
    loading.value = true
    error.value = null
    
    // Stocker le mot de passe
    localStorage.setItem('gamePassword', password.value)
    
    // Tester avec une requête API
    try {
        const response = await fetch('/api/sessions/active', {
            headers: {
                'x-game-password': password.value
            }
        })
        
        if (response.ok || response.status === 404) {
            // Mot de passe correct (404 = pas de session, mais auth OK)
            router.push('/')
        } else {
            error.value = 'Mot de passe incorrect'
            localStorage.removeItem('gamePassword')
        }
    } catch (err) {
        error.value = 'Erreur de connexion'
    } finally {
        loading.value = false
    }
}
</script>

<style scoped>
.login-view {
    min-height: 100vh;
    display: flex;
    align-items: center;
    justify-content: center;
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
}

.login-card {
    background: white;
    padding: 40px;
    border-radius: 20px;
    box-shadow: 0 20px 60px rgba(0,0,0,0.3);
    max-width: 400px;
    width: 90%;
    text-align: center;
}

h1 {
    margin: 0 0 10px;
    color: #333;
}

p {
    color: #666;
    margin-bottom: 30px;
}

.password-input {
    width: 100%;
    padding: 15px;
    font-size: 16px;
    border: 2px solid #ddd;
    border-radius: 10px;
    margin-bottom: 15px;
}

.password-input:focus {
    outline: none;
    border-color: #667eea;
}

button {
    width: 100%;
    padding: 15px;
    font-size: 16px;
    font-weight: bold;
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    color: white;
    border: none;
    border-radius: 10px;
    cursor: pointer;
}

button:disabled {
    opacity: 0.5;
    cursor: not-allowed;
}

.error {
    color: #f44336;
    margin-top: 15px;
    padding: 10px;
    background: #ffebee;
    border-radius: 5px;
}
</style>