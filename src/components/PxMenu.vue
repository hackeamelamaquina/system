<template>
  <v-list>
    <v-list-group
      v-for="item in items"
      :key="item.title"
      :prepend-icon="item.action"
      v-model="item.active"
      no-action
      color ="light-blue lighten-3"
    >
    
      <template v-slot:activator>
        <v-list-item-content>
          <v-list-item-title v-text="item.title"></v-list-item-title>
        </v-list-item-content>
      </template>

      <v-list-item v-for="child in item.items" :key="child.title">
        <v-list-item-content>
          <v-list-item-title v-text="child.title"></v-list-item-title>
        </v-list-item-content>
      </v-list-item>
    </v-list-group>
  </v-list>
</template>

<script>
export default {
  name: "PxMenu",
  data() {
    return {
      items: [
        {
          action: "mdi-message-text",
          items: [{ title: "Mantenimientos" }, { title: "Procesos" }],
          title: "Cotizacion",
          tema: "green darken-2"
        },
        {
          action: "mdi-domain",
          active: true,
          items: [
            { title: "Mantenimientos" },
            { title: "Procesos" },
            { title: "Sushi" }
          ],
          title: "Inventario",
          tema: "blue darken-2"
        },
        {
          action: "mdi-school",
          items: [{ title: "List Item" }],
          title: "Education",
          tema: "blue darken-2"
        },
        {
          action: "mdi-run",
          items: [{ title: "List Item" }],
          title: "Family",
          tema: "blue darken-2"
        },
        {
          action: "mdi-bottle-tonic-plus",
          items: [{ title: "List Item" }],
          title: "Health",
          tema: "blue darken-2"
        },
        {
          action: "mdi-content-cut",
          items: [{ title: "List Item" }],
          title: "Office",
          tema: "blue darken-2"
        },
        {
          action: "mdi-tag",
          items: [{ title: "List Item" }],
          title: "Promotions",
          tema: "blue darken-2"
        }
      ]
    };
  }
};
</script>
