import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '../views/HomeView.vue'
import HostDashboard from '../views/HostDashboard.vue'
import PlayerView from '../views/PlayerView.vue'
import SoloGame from '../views/SoloGame.vue'
import VideoView from '../views/VideoView.vue'
import VideoDashboard from '../views/VideoDashboard.vue'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'home',
      component: HomeView
    },
    {
      path: '/solo',
      name: 'solo',
      component: SoloGame
    },
    {
      path: '/host',
      name: 'host',
      component: HostDashboard
    },
    {
      path: '/play',
      name: 'play',
      component: PlayerView
    },
    {
      path: '/video',
      name: 'video',
      component: VideoView
    },
    {
      path: '/video-dashboard',
      name: 'video-dashboard',
      component: VideoDashboard
    }
  ],
})

export default router
