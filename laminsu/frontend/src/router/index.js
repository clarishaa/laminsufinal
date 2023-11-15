import { createRouter, createWebHistory } from 'vue-router'
import Login from '../views/Login.vue'
import Register from '../views/Register.vue'
import Main from '../views/Main.vue'
import Index from '../views/Index.vue'
import About from '../components/User/About.vue'
import Services from '../components/User/Services.vue'
import Menus from '../components/User/Menus.vue'
import Feature from '../views/Feature.vue'
import Booking from '../components/User/Booking.vue'
import Team from '../components/User/Team.vue'
import Testimonials from '../components/User/Testimonials.vue'
import Contact from '../components/User/Contact.vue'
import Admin from '../views/Admin.vue'

const routes = [ 
  
  {
    path: '/signup',
    name: 'signup',
    component: Register
  },
  
  {
    path: '/signin',
    name: 'login',
    component: Login
  },
  {
    path: '/',
    component: Main,
    children: [
      { path: '', component: Index },
      { path: 'about', component: About },
      { path: 'services', component: Services },
      { path: 'menu', component: Menus },
      { path: 'features', component: Feature },
      { path: 'booking', component: Booking },
      { path: 'reservation', component: Booking },
      { path: 'team', component: Team },
      { path: 'testimonials', component: Testimonials },
      { path: 'contact', component: Contact },

    ],
  },
  {
    path: '/admin/',
    component: Admin,
    children: [
      { path: '', component: Admin },

    ],
  },
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router
