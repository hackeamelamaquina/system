<template>
  <v-card class="mx-auto" width="300">
    <v-list>
      <v-list-item>
        <v-list-item-icon>
          <v-icon>mdi-home</v-icon>
        </v-list-item-icon>

        <v-list-item-title>DashBoard</v-list-item-title>
      </v-list-item>

      <v-list-group
        v-for="item in items"
        :key="item.title"
        :value="true"
        :prepend-icon="item.action"
        color="light-blue lighten-3"
        v-model="item.active"
      >
        <template v-slot:activator>
          <v-list-item-title v-text="item.title"></v-list-item-title>
        </template>

        <v-list-group
          v-for="child in item.items"
          :key="child.title"
          :value="true"
          no-action
          sub-group
          color="light-blue lighten-3"
        >
          <template v-slot:activator>
            <v-list-item-content>
              <v-list-item-title v-text="child.title"></v-list-item-title>
            </v-list-item-content>
          </template>

          <v-list-item
            v-for="grandchild in child.options"
            :key="grandchild.title"
            link
          >
            <v-list-item-content>
              <v-list-item-title v-text="grandchild.title"></v-list-item-title>
            </v-list-item-content>
            <v-list-item-icon>
              <router-link :to="{ name: 'Costos' }">
                <v-icon :color="grandchild.color">
                  {{ grandchild.icon }}</v-icon
                ></router-link
              >
            </v-list-item-icon>
          </v-list-item>
        </v-list-group>
      </v-list-group>
    </v-list>
  </v-card>
</template>

<script>
export default {
  name: "PxMenup",
  data() {
    return {
      items: [
        {
          action: "mdi-message-text",
          items: [
            {
              title: "Mantenimientos",
              options: [
                /* {
                  title: "Productos",
                  icon: "mdi-view-list-outline",
                  color: "yellow",
                  link: "costos"
                },*/
                {
                  title: "Costos",
                  icon: "mdi-view-list-outline",
                  color: "yellow",
                  link: "home"
                }
              ]
            },
            { title: "Procesos", options: [{ title: "Calculo" }] },
            { title: "Reportes", options: [{ title: "Historial" }] }
          ],
          title: "Cotizacion",
          tema: "green darken-2",
          active: true
        },
        {
          action: "mdi-domain",
          items: [
            { title: "Mantenimientos" },
            { title: "Procesos" },
            { title: "Reportes" }
          ],
          title: "Inventario",
          tema: "blue darken-2"
        },
        {
          action: "mdi-newspaper-variant-multiple-outline",
          items: [
            { title: "Mantenimientos" },
            { title: "Procesos" },
            { title: "Reportes" }
          ],
          title: "Facturacion",
          tema: "blue darken-2"
        },
        {
          action: "mdi-security",
          items: [
            { title: "Mantenimientos" },
            { title: "Procesos" },
            { title: "Reportes" }
          ],
          title: "Seguridad",
          tema: "blue darken-2"
        }
      ]
    };
  }
};
</script>
