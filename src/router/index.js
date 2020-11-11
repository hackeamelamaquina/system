import Vue from "vue";
import VueRouter from "vue-router";
import Home from "@/views/Home.vue";
import Error from "@/views/Error";
import Mantenimiento from "@/views/Mantenimiento";
import Costos from "@/views/Costos";
import Login from "@/views/login";

//import VeeValidate from "vee-validate";
//Vue.use(VeeValidate);
Vue.use(VueRouter);

const routes = [
  {
    path: "/",
    name: "Home",
    component: Home
  },
  {
    path: "/Mantenimiento",
    name: "Mantenimiento",
    component: Mantenimiento
  },
  {
    path: "/costos",
    name: "Costos",
    component: Costos
  },
  {
    path: "/about",
    name: "About",
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () =>
      import(/* webpackChunkName: "about" */ "../views/About.vue")
  },
  {
    path: "*",
    name: "error",
    component: Error
  },
  {
    path: "/login",
    name: "login",
    component: Login
  }
];

const router = new VueRouter({
  routes
});

export default router;
