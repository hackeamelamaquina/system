<template>
  <v-main>
    <v-container fill-height fluid>
      <v-layout align-center justify-center>
        <v-flex xs12 sm8 md4>
          <v-card class="elevation-12" dark>
            <v-toolbar color="light-green darken-4">
              <v-avatar class="mb-4" color="grey darken-1" size="74">
          <img src="@/assets/logo.jpg" alt="John"
        /></v-avatar>
              <v-toolbar-title>Multicreativa</v-toolbar-title>
              <v-spacer />
            </v-toolbar>
            <v-card-text>
              <v-form>
                <v-text-field
                  ref="username"
                  v-model="username"
                  :rules="[() => !!username || 'Campo requerido']"
                  prepend-icon="mdi-account"
                  label="Usuario"
                  placeholder="Ingrese Usuario"
                  required
                />
                <v-text-field
                  ref="password"
                  v-model="password"
                  :rules="[() => !!password || 'This field is required']"
                  :append-icon="showPassword ? 'mdi-eye-off' : 'mdi-eye'"
                  :type="showPassword ? 'text' : 'password'"
                  prepend-icon="mdi-lock"
                  label="Clave"
                  placeholder="*********"
                  counter
                  required
                  @keydown.enter="login"
                  @click:append="showPassword = !showPassword"
                />
              </v-form>
            </v-card-text>
            <v-divider class="mt-5" />
            <v-card-actions>
              <v-spacer />
              <v-btn
                align-center
                justify-center
                color="light-green darken-4"
                @click="login"
                >Ingresar
              </v-btn>
            </v-card-actions>
            <v-snackbar v-model="snackbar" :color="color" :top="true">
              {{ errorMessages }}
              <v-btn dark @click="snackbar = false">
                Close
              </v-btn>
            </v-snackbar>
          </v-card>
        </v-flex>
      </v-layout>
    </v-container>
  </v-main>
</template>
<script>
export default {
  data: () => ({
    valid: true,
    name: "",
    nameRules: [
      v => !!v || "Name is required",
      v => (v && v.length <= 10) || "Name must be less than 10 characters"
    ],
    email: "",
    emailRules: [
      v => !!v || "E-mail is required",
      v => /.+@.+\..+/.test(v) || "E-mail must be valid"
    ],
    select: null,
    items: ["Item 1", "Item 2", "Item 3", "Item 4"],
    checkbox: false,
    username: "",
    password: "",
    errorMessages: "Incorrect login info",
    snackbar: false,
    color: "general",
    showPassword: false
  }),

  methods: {
    login: function() {
      let username = this.username;
      let password = this.password;
      console.log(username);
      console.log(password);
      /*this.$store
        .dispatch("login", { username, password })
        .then(() => this.$router.push("/dashboard"))
        .catch(err => {
          console.log(err);
          this.snackbar = true;
        });*/
    },
    validate() {
      this.$refs.form.validate();
    },
    reset() {
      this.$refs.form.reset();
    },
    resetValidation() {
      this.$refs.form.resetValidation();
    }
  }
};
</script>
