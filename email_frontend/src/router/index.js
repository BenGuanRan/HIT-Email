import { createRouter, createWebHashHistory } from 'vue-router'
import Main from '../views/Main.vue'
const routes = [
  {
    path: "/",
    redirect: "/Inbox",
  },
  {
    path: '/',
    name: 'Main',
    component: Main,
    children: [
      {
        path: 'Inbox',
        component: () => import('../views/Inbox.vue')
      },
      {
        path: 'Outbox',
        component: () => import('../views/Outbox.vue')
      },
      {
        path: 'Draftbox',
        component: () => import('../views/Draftbox.vue')
      },
      {
        path: 'WriteMessages',
        component: () => import('../views/WriteMessages.vue')
      },
    ]
  },
  {
    path: '/login',
    name: 'Login',
    component: () => import('../views/LoginOrRegister.vue')
  },
]

const router = createRouter({
  history: createWebHashHistory(process.env.BASE_URL),
  routes
})

// 设置路由守卫函数
router.beforeEach((to, from, next) => {
  if (to.path === '/login') {
    sessionStorage.clear()
    return next()
  } else {
    if (!sessionStorage.getItem('token')) {
      return next('/login')
    } else {
      return next()
    }
  }
})



export default router
