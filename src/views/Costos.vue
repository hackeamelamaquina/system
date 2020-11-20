<template>
  <v-main>
    <PxLateral />
    <v-data-table
      :headers="headers"
      :items="costos"
      sort-by="calories"
      class="elevation-1"
    >
      <template v-slot:top>
        <v-toolbar flat>
          <v-toolbar-title>Costos</v-toolbar-title>
          <v-divider class="mx-4" inset vertical></v-divider>
          <v-spacer></v-spacer>
          <v-dialog v-model="dialog" max-width="500px">
            <template v-slot:activator="{ on, attrs }">
              <v-btn color="primary" dark class="mb-2" v-bind="attrs" v-on="on">
                Agregar
              </v-btn>
            </template>
            <v-card>
              <v-card-title>
                <span class="headline">{{ formTitle }}</span>
              </v-card-title>

              <v-card-text>
                <v-container>
                  <v-row>
                    <v-col cols="12" sm="6" md="4">
                      <v-text-field
                        v-model="editedItem.nombre"
                        label="Nombre"
                      ></v-text-field>
                    </v-col>
                    <v-col cols="12" sm="6" md="4">
                      <v-text-field
                        v-model="editedItem.precio"
                        label="Precio"
                      ></v-text-field>
                    </v-col>
                  </v-row>
                </v-container>
              </v-card-text>

              <v-card-actions>
                <v-spacer></v-spacer>
                <v-btn color="blue darken-1" text @click="close">
                  Cancel
                </v-btn>
                <v-btn color="blue darken-1" text @click="save">
                  Save
                </v-btn>
              </v-card-actions>
            </v-card>
          </v-dialog>
          <v-dialog v-model="dialogDelete" max-width="500px">
            <v-card>
              <v-card-title class="headline"
                >Esta seguro de eliminar este costo?</v-card-title
              >
              <v-card-actions>
                <v-spacer></v-spacer>
                <v-btn color="blue darken-1" text @click="closeDelete"
                  >Cancel</v-btn
                >
                <v-btn color="blue darken-1" text @click="deleteItemConfirm"
                  >OK</v-btn
                >
                <v-spacer></v-spacer>
              </v-card-actions>
            </v-card>
          </v-dialog>
        </v-toolbar>
      </template>
      <template v-slot:item.actions="{ item }">
        <v-icon small class="mr-2" @click="editItem(item)">
          mdi-pencil
        </v-icon>
        <v-icon small @click="deleteItem(item)">
          mdi-delete
        </v-icon>
      </template>
      <template v-slot:no-data>
        <v-btn color="primary" @click="initialize">
          Reset
        </v-btn>
      </template>
    </v-data-table>
  </v-main>
</template>

<script>
import PxLateral from "@/components/PxLateral";
import api from "@/apis/apiCostos";
export default {
  components: {
    PxLateral
  },
  data: () => ({
    dialog: false,
    dialogDelete: false,
    headers: [
      {
        text: "Nombre",
        align: "start",
        sortable: true,
        value: "nombre"
      },
      { text: "Precio", value: "precio" },
      { text: "Accion", value: "actions", sortable: false }
    ],
    costos: [],
    msg: "",
    formdata: [],
    editedIndex: -1,
    editedItem: {
      nombre: "",
      precio: 0,
      id: 0,
      accion: 0
    },
    defaultItem: {
      name: "",
      precio: 0
    }
  }),

  computed: {
    formTitle() {
      return this.editedIndex === -1 ? "Nuevo Costo" : "Editar Costo";
    }
  },

  watch: {
    dialog(val) {
      val || this.close();
    },
    dialogDelete(val) {
      val || this.closeDelete();
    }
  },

  created() {
    this.initialize();
    this.GetCostos();
  },
  updated() {
   // this.GetCostos();
  },

  methods: {
    initialize() {},
    GetCostos() {
      api.getCostos().then(costos => (this.costos = costos));

      //console.log(this.costos[0].nombre)
    },

    editItem(item) {
      this.editedIndex = this.costos.indexOf(item);
      this.editedItem = Object.assign({}, item);
      //console.log("edit " + this.editedItem.id);
      this.dialog = true;
    },

    deleteItem(item) {
      this.editedIndex = this.costos.indexOf(item);
      this.editedItem = Object.assign({}, item);
      this.dialogDelete = true;
    },

    deleteItemConfirm() {
      //this.costos.splice(this.editedIndex, 1);
      this.editedItem.accion = 3;
      api
        .UpdateCostos(JSON.stringify(this.editedItem))
        .then(msg => (this.msg = msg));
      this.closeDelete();
    },

    close() {
      this.dialog = false;
      this.$nextTick(() => {
        this.editedItem = Object.assign({}, this.defaultItem);
        this.editedIndex = -1;
      });
    },

    closeDelete() {
      this.dialogDelete = false;
      this.$nextTick(() => {
        this.editedItem = Object.assign({}, this.defaultItem);
        this.editedIndex = -1;
      });
    },

    save() {
      if (this.editedIndex > -1) {
        this.editedItem.accion = 2;
        api
          .UpdateCostos(JSON.stringify(this.editedItem))
          .then(msg => (this.msg = msg))
          .finally(() => this.GetCostos());
      } else {
        this.editedItem.accion = 1;
        api
          .UpdateCostos(JSON.stringify(this.editedItem))
          .then(msg => (this.msg = msg))
          .finally(() => this.GetCostos());
        //this.costos.push(this.editedItem);
      }
      this.close();
      //this.GetCostos();
    }
  }
};
</script>
