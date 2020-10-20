<template>
  <v-app id="inspire">
   <!-- <v-system-bar app>
      <v-spacer></v-spacer>

      <v-icon>mdi-square</v-icon>

      <v-icon>mdi-circle</v-icon>

      <v-icon>mdi-triangle</v-icon>
    </v-system-bar>-->

    <v-navigation-drawer v-model="drawer" app dark>
      <v-sheet color="light-green darken-4" class="pa-4">
        <v-avatar class="mb-4" color="grey darken-1" size="74">
          <img src="@/assets/logo.jpg" alt="John"
        /></v-avatar>

        <div>Jonathan Cañada</div>
      </v-sheet>

      <v-divider></v-divider>

      <!-- <v-list>
        <v-list-item v-for="[icon, text, tema] in links" :key="icon" link>
          <v-list-item-icon>
            <v-icon :color="tema">{{ icon }}</v-icon>
          </v-list-item-icon>

          <v-list-item-content>
            <v-list-item-title>{{ text }}</v-list-item-title>
          </v-list-item-content>
        </v-list-item>
      </v-list> -->
      <PxMenu />
    </v-navigation-drawer>

    <v-main>
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
      </v-container>
    </v-main>
  </v-app>
</template>

<script>
import PxMenu from "@/components/PxMenu";
export default {
  name: "home",
  // eslint-disable-next-line vue/no-unused-components
  components: { PxMenu },
  data: () => ({
    cards: ["Today", "Yesterday"],
    drawer: null,
    links: [
      ["mdi-message-text", "Cotizacion","green darken-2"],
      ["mdi-domain", "Inventario","blue darken-2"],
      [
        "mdi-newspaper-variant-multiple-outline",
        "Facturacion",
        "teal darken-2"
      ],
      ["mdi-numeric", "Contabilidad","blue-grey darken-2"],
      ["mdi-security", "Seguridad","orange darken-2"],
      ["mdi-account", "Perfil","blue lighten-5"],
      ["mdi-account-settings", "Configuracion", "blue-grey darken-2"]
    ]
  })
};
</script>
