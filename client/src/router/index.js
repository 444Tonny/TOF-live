import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '../views/HomeView.vue'
import HostDashboard from '../views/HostDashboard.vue'
import PlayerView from '../views/PlayerView.vue'
import SoloGame from '../views/SoloGame.vue'
import VideoView from '../views/VideoView.vue'
import VideoDashboard from '../views/VideoDashboard.vue'
import LoginView from '../views/LoginView.vue'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/login',
      name: 'login',
      component: LoginView
    },
    {
      path: '/',
      name: 'home',
      component: HomeView,
      meta: { requiresAuth: true }
    },
    {
      path: '/solo',
      name: 'solo',
      component: SoloGame,
      meta: { requiresAuth: true }
    },
    {
      path: '/host',
      name: 'host',
      component: HostDashboard,
      meta: { requiresAuth: true }
    },
    {
      path: '/play',
      name: 'play',
      component: PlayerView,
      meta: { requiresAuth: true }
    },
    {
      path: '/video',
      name: 'video',
      component: VideoView,
      meta: { requiresAuth: true }
    },
    {
      path: '/video-dashboard',
      name: 'video-dashboard',
      component: VideoDashboard,
      meta: { requiresAuth: true }
    }
  ],
})

// Guard de navigation
router.beforeEach((to, from, next) => {
    const password = localStorage.getItem('gamePassword')
    
    if (to.meta.requiresAuth && !password) {
        next('/login')
    } else {
        next()
    }
})

export default router
