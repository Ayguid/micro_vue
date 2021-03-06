
/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */

require('./bootstrap');

window.Vue = require('vue');

/**
 * The following block of code may be used to automatically register your
 * Vue components. It will recursively scan this directory for the Vue
 * components and automatically register them with their "basename".
 *
 * Eg. ./components/ExampleComponent.vue -> <example-component></example-component>
 */

// const files = require.context('./', true, /\.vue$/i);
// files.keys().map(key => Vue.component(key.split('/').pop().split('.')[0], files(key).default));

Vue.component('example-component', require('./components/ExampleComponent.vue').default);
Vue.component('drop-zone', require('./components/DropZone.vue').default);
Vue.component('contact-mail-form', require('./components/ContactMailForm.vue').default);


Vue.component('products-portfolio', require('./components/views/ProductsPortfolio.vue').default);
Vue.component('product-view', require('./components/views/ProductView.vue').default);
Vue.component('filter-menu', require('./components/FilterMenu.vue').default);
Vue.component('search-component', require('./components/forms/SearchComponent.vue').default);
Vue.component('product-component', require('./components/ProductComponent.vue').default);
//polemicos
Vue.component('delete-alert', require('./components/DeleteAlert.vue').default);
// Vue.component('filter-helper', require('./components/FilterHelper.vue').default);

/**
 * Next, we will create a fresh Vue application instance and attach it to
 * the page. Then, you may begin adding components to this application
 * or customize the JavaScript scaffolding to fit your unique needs.
 */
 // main.js
import Vue from 'vue';


//
import fileTypeReader from './myFuncs/fileManager';
Vue.mixin(fileTypeReader);
//


//
var translations;
// import translations from './lang/translations_en.json';
// import translations from './lang/translations_pt.json';
// import { translations } from './lang/translations.js';
// import translations from './lang/messages.json';
const lang = (document.documentElement.lang=='pt-BR')?'pt':document.documentElement.lang;
import VueInternationalization from 'vue-i18n';
switch (lang) {
  case 'en':
  translations = require('./lang/translations_en.json')
    break;
  case 'pt':
  translations = require('./lang/translations_pt.json')
    break;
  default:
}
Vue.use(VueInternationalization);
const i18n = new VueInternationalization({
    locale: lang,
    messages: translations,
    objectNotation: true,
    keySeparator:true
});
// console.log(translations[`${lang}`+'.values']);
//


import VueSweetalert2 from 'vue-sweetalert2';
const options = {
  confirmButtonColor: '#41b882',
  cancelButtonColor: '#ff7674'
};
Vue.use(VueSweetalert2, options);

import BootstrapVue from 'bootstrap-vue';
Vue.use(BootstrapVue);
import 'bootstrap-vue/dist/bootstrap-vue.css';
// import 'bootstrap/dist/css/bootstrap.css';

const app = new Vue({
    el: '#app',
    i18n,
    data(){
      return  {
        local:lang,
        baseUrl:window.axios.defaults.baseURL,
        authuser:window.Laravel.user,
        authadmin:window.Laravel.admin
      }
    },
    mounted(){

    }
});
