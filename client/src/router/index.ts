import AccountView from '@/views/AccountView.vue'
import HomeView from '@/views/HomeView.vue'
import { authGuard } from '@auth0/auth0-vue'
import { createRouter, createWebHistory } from 'vue-router'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'Home',
      component: HomeView
    },
    {
      path: '/account',
      name: 'Account',
      component: AccountView,
      beforeEnter: authGuard
    }
  ],
})

export default router
