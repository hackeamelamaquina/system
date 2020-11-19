<template>
  <v-app id="inspire">
    <router-view />
  </v-app>
</template>

<script>
//import HelloWorld from "./components/HelloWorld";
//import PxLateral from "@/components/PxLateral";
//import api from "@/apis/apiLogin";
export default {
  name: "App",

  components: {
    //PxLateral
  },

  data: () => ({
    tokenValido: false
    //
  }),
  created() {
    //this.getToken();
  },
  mounted() {
   // this.getToken();
  },
  methods:{}
};
</script>
