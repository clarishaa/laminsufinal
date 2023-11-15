<template>
  <!-- Section: Design Block -->
  <section class="background-radial-gradient overflow-hidden d-flex justify-content-center align-items-center"
    style="min-height: 100vh;">
    <div class="card bg-glass col-3">
      <div class="card-body px-3 py-4 px-md-3">
        <form @submit.prevent="signup">
          <div>
            <!-- Email input -->
            <div class="form-outline mb-4">
              <input type="email" name="email" id="email" class="form-control small" placeholder="Email address"
                v-model="email" />
            </div>

            <!-- Password input -->
            <div class="form-outline mb-4">
              <input type="password" name="password" id="password" class="form-control small" placeholder="Password"
                v-model="password" />
            </div>
          </div>
          <!-- Submit button -->
          <button type="submit" class="btn btn-primary mx-auto w-100 mb-3">Signin</button>
          <!-- Register buttons -->
          <div class="text-center">
            <p>or sign up with:</p>
            <button type="button" class="btn btn-link btn-floating mx-1">
              <i class="fab fa-facebook-f"></i>
            </button>

            <button type="button" class="btn btn-link btn-floating mx-1">
              <i class="fab fa-google"></i>
            </button>

            <button type="button" class="btn btn-link btn-floating mx-1">
              <i class="fab fa-twitter"></i>
            </button>

            <button type="button" class="btn btn-link btn-floating mx-1">
              <i class="fab fa-github"></i>
            </button>
          </div>
        </form>
      </div>
    </div>
  </section>

  <!-- Section: Design Block -->
</template>
<style></style>
<script>
// @ is an alias to /src
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome';
import axios from 'axios';
export default {
  name: 'Register',
  components: {
    FontAwesomeIcon
  },
  data() {
    return {
      username: "",
      lastname: "",
      firstname: "",
      selectedGender: '',
      bdate: "",
      phone: "",
      email: "",
      password: "",

    }
  },
  methods: {
    async signup() {
      try {
        const insert = await axios.post("signup", {
          username: this.username,
          lastname: this.lastname,
          firstname: this.firstname,
          selectedGender: this.selectedGender,
          bdate: this.bdate,
          phone: this.phone,
          email: this.email,
          password: this.password,
        })
      } catch (error) {
      }
    },


  }
};



</script>
  
  