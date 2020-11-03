<template>
  <v-main>
    <v-card>
      <v-card-title>
        <v-text-field
          v-model="search"
          append-icon="mdi-magnify"
          label="Buscar"
          single-line
          hide-details
        ></v-text-field>
      </v-card-title>
      <v-data-table :headers="headers" :items="desserts" :search="search">
        <template v-slot:item.estado="{ item }">
          <v-simple-checkbox
            v-model="item.estado"
            disabled
          ></v-simple-checkbox>
        </template>
      </v-data-table>
    </v-card>
  </v-main>
</template>
<script>
export default {
  data() {
    return {
      search: "",
      headers: [
        {
          text: "Producto",
          align: "start",
          value: "name"
        },
        { text: "Costo ($)", value: "valor" },
        { text: "Activo", value: "estado" }
      ],
      desserts: [
        {
          name: "VINIL LAMINADO MATE",
          valor: 3.05,
          estado: true
        },
        {
          name: "VINIL LAMINADO BRILLANTE",
          valor: 2.95,
          estado: true
        },
        {
          name: "VINIL",
          valor: 1.6,
          estado: true
        },
        {
          name: "BANNER 13 OZ",
          valor: 1.5,
          estado: true
        },
        {
          name: "MICROPERFORADO",
          valor: 3.1,
          estado: true
        },
        {
          name: "BANNER UV",
          valor: 2.3,
          estado: true
        }
      ]
    };
  }
};
</script>
