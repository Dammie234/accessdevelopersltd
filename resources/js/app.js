

require('./bootstrap');

import Vue from 'vue'
import VueRouter from 'vue-router'
// Routes Imported
import {routes} from './routes'
// Import User Class
import User from './helpers/user'
// Sweet alert start
import Swal from 'sweetalert2'
// import notification
import Notification from './helpers/notification'
import VueMoment from "vue-moment";

import PageHeader from './components/components/header.vue'
import PageSidebar from './components/components/sidebar.vue'
import PageHeaderDesktop from  './components/components/header-desktop.vue'
import PageLoader from './components/components/loader.vue'

const Toast = Swal.mixin({
  toast: true,
  position: 'top-end',
  showConfirmButton: false,
  timer: 3000,
  timerProgressBar: true,
  onOpen: (toast) => {
    toast.addEventListener('mouseenter', Swal.stopTimer)
    toast.addEventListener('mouseleave', Swal.resumeTimer)
  }
});

window.Toast = Toast;
window.Swal = Swal
window.User = User
window.Notification = Notification
Vue.use(VueRouter)
Vue.use(VueMoment);

Vue.component('page-header', PageHeader)
Vue.component('page-sidebar', PageSidebar)
Vue.component('page-header-desktop', PageHeaderDesktop)
Vue.component('page-loader', PageLoader)

const router = new VueRouter({
    routes,
    mode: 'history'
  })



const app = new Vue({
    el: '#app',
    router
});
