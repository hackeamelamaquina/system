<template>
  <v-app id="inspire">
    <PxLateral />
    <router-view />
  </v-app>
</template>

<script>
//import HelloWorld from "./components/HelloWorld";
import PxLateral from "@/components/PxLateral";

export default {
  name: "App",

  components: {
    PxLateral
  },

  data: () => ({
    //
  })
};
</script>
