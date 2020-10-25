<template>
  <div>
    <v-system-bar app dark>
      <v-spacer></v-spacer>

      <v-icon>mdi-square</v-icon>

      <v-icon>mdi-circle</v-icon>

      <v-icon>mdi-triangle</v-icon>
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
import PxMenu from "@/components/PxMenuP";
export default {
  name: "PxLateral",
  components: { PxMenu }
};
</script>
