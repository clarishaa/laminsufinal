import { createApp } from 'vue'
import App from './App.vue'
import './registerServiceWorker'
import router from './router'
import axios from 'axios'
import VueToast from "vue-toast-notification";
import 'vue-toast-notification/dist/theme-sugar.css';


axios.defaults.baseURL = 'http://localhost:8080/';

createApp(App)
  .use(router)
  .use(VueToast)
  .mount('#app');
