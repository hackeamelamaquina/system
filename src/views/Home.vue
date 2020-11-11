<template>
  <div>
    <v-main>
      <PxLateral />
      <v-img
        lazy-src="@/assets/LogoG.jpg"
        max-height="950"
        src="@/assets/LogoG.jpg"
      ></v-img>

      <!-- <line-chart
        :data="{ '2017-01-01': 11, '2017-01-02': 10, '2017-01-03': 1 }"
        width="800px"
        height="500px"
        :colors="['#b00', '#666']"
      ></line-chart>
      <pie-chart
        :data="[
          ['Blueberry', 44],
          ['Strawberry', 23]
        ]"
      ></pie-chart>
      <v-container class="py-8 px-6" fluid>
        <v-row>
          <v-col v-for="card in cards" :key="card" cols="12">
            <v-card>
              <v-subheader>{{ card }}</v-subheader>

              <v-list two-line>
                <template v-for="n in 6">
                  <v-list-item :key="n">
                    <v-list-item-avatar color="grey darken-1">
                    </v-list-item-avatar>

                    <v-list-item-content>
                      <v-list-item-title>Message {{ n }}</v-list-item-title>

                      <v-list-item-subtitle>
                        Lorem ipsum dolor sit amet, consectetur adipisicing
                        elit. Nihil repellendus distinctio similique
                      </v-list-item-subtitle>
                    </v-list-item-content>
                  </v-list-item>

                  <v-divider
                    v-if="n !== 6"
                    :key="`divider-${n}`"
                    inset
                  ></v-divider>
                </template>
              </v-list>
            </v-card>
          </v-col>
        </v-row>
      </v-container>-->
    </v-main>
  </div>
</template>

<script>
import PxLateral from "@/components/PxLateral";
export default {
  name: "home",
  components: {
    PxLateral
  },
  // eslint-disable-next-line vue/no-unused-components
  //components: { PxMenu },
  data: () => ({
    cards: ["Today", "Yesterday"],
    drawer: null,
    links: [
      ["mdi-message-text", "Cotizacion", "green darken-2"],
      ["mdi-domain", "Inventario", "blue darken-2"],
      [
        "mdi-newspaper-variant-multiple-outline",
        "Facturacion",
        "teal darken-2"
      ],
      ["mdi-numeric", "Contabilidad", "blue-grey darken-2"],
      ["mdi-security", "Seguridad", "orange darken-2"],
      ["mdi-account", "Perfil", "blue lighten-5"],
      ["mdi-account-settings", "Configuracion", "blue-grey darken-2"]
    ]
  })
};
</script>
