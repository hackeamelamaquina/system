<template>
  <div>
    <v-system-bar app dark>
      <v-spacer></v-spacer>

      <v-icon v-on:click="logOut()">mdi-logout</v-icon>
    </v-system-bar>

    <v-navigation-drawer app dark>
      <v-sheet color="light-green darken-4" class="pa-4">
        <v-avatar class="mb-4" color="grey darken-1" size="74">
          <img src="@/assets/logo.jpg" alt="John"
        /></v-avatar>
        <div>Jonathan Cañada</div>
      </v-sheet>
      <v-divider></v-divider>
      <PxMenu />
    </v-navigation-drawer>
  </div>
</template>
<script>
import api from "@/apis/apiLogin";
import PxMenu from "@/components/PxMenuP";
export default {
  name: "PxLateral",
  components: { PxMenu },
  created() {
    this.getToken();
  },
  methods: {    
    logOut() {
      api.deleteUserLogged();
      this.$router.push("/login");
    },
    getToken(){
      var token = api.getUserLogged();
      console.log(token + " asdas")
      if (token === undefined) {
        this.$router.push("/login");
      }
    }
  }
};
</script>
