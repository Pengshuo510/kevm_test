import Vue from "vue"
import App from "./App.vue"
import router from './router'
import { BootstrapVue, IconsPlugin } from 'bootstrap-vue'
import 'bootstrap/dist/css/boostrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'
import { MdButton, MdList } from 'vue-material/dist/components'
import 'vue-material/dist/vue-material.min.css'
import 'vue-material/dist/theme/default.css'

Vue.use(BootstrapVue)
Vue.use(IconsPlugin)

Vue.use(MdButton)
Vue.use(MdList)

Vue.config.productionTip = false;

new Vue({
    router,
    render: (h) => h(App),
}).$mount("#app");