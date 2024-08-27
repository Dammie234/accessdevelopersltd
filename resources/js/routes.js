


let login = require('./components/auth/login.vue').default;


let logout = require('./components/auth/logout.vue').default;

let home = require('./components/home.vue').default;

let invoices = require('./components/invoice/index.vue').default;
let create_invoice = require('./components/invoice/create.vue').default;
let invoice = require('./components/invoice/show.vue').default;

let organizations = require('./components/organizations/index.vue').default;
let edit_organization = require('./components/organizations/edit.vue').default


export const routes = [
    { path: '/', component: login, name: '/' },

    { path: '/logout', component: logout, name: 'logout' },
    { path: '/account/dashboard', component: home, name: 'home' },
    {path: '/account/invoices', component: invoices, name: 'invoices'},
    {path: '/account/invoices/create', component: create_invoice, name: 'create-invoice'},
    {path: '/account/invoices/:id', component: invoice, name: 'invoice'},
    {path: '/account/organizations', component: organizations, name: 'organizations'},
    {path: '/account/organizations/:id', component: edit_organization, name: 'edit-organization'}
  ]
