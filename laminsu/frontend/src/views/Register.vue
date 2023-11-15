<template>
  <!-- Section: Design Block -->
  <section class="background-radial-gradient overflow-hidden d-flex justify-content-center align-items-center min-vh-100">
    <div class="card bg-glass col-6">
      <div class="card-body px-3 py-4 px-md-3"> <!-- Reduced padding -->
        <form @submit.prevent="signup" ref="signupForm">
          <div>
            <!-- Username input -->
            <div class="row">
              <div class="col-md-6 mb-2">
                <div class="form-floating">
                  <input type="text" name="username" id="username" class="form-control small mb-2" placeholder="Username"
                    required v-model="username" />
                  <label for="username">Username</label>
                </div>
              </div>
              <div class="col-md-6 mb-2">

                <div class="form-outline">
                  <label class="mx-2">Gender</label>
                  <div class="form-check form-check-inline my-2">
                    <input class="form-check-input" type="radio" name="gender" id="male" value="male"
                      v-model="selectedGender" />
                    <label class="form-check-label large mx-2" for="male">Male</label>
                  </div>
                  <div class="form-check form-check-inline my-2">
                    <input class="form-check-input" type="radio" name="gender" id="female" value="female"
                      v-model="selectedGender" />
                    <label class="form-check-label large mx-2" for="female">Female</label>
                  </div>
                </div>
              </div>
            </div>

            <!-- 2 column grid layout with text inputs for the first and last names -->
            <div class="row">
              <div class="col-md-6 mb-2">
                <div class="form-floating">
                  <input type="text" name="firstname" id="firstname" class="form-control small" placeholder="First name"
                    required v-model="firstname" />
                  <label for="firstname">First Name</label>
                </div>
              </div>
              <div class="col-md-6 mb-2">
                <div class="form-floating">
                  <input type="text" name="lastname" id="lastname" class="form-control small" placeholder="Last name"
                    required v-model="lastname" />
                  <label for="lastname">Last Name</label>
                </div>
              </div>
            </div>
            <!-- Birthday input -->
            <div class="form-floating mb-2">
              <input type="date" name="bdate" id="bdate" class="form-control small" required v-model="bdate" />
              <label for="bdate">Birthdate</label>
            </div>
            <!-- Phone input -->
            <div class="form-floating mb-2">
              <input type="number" name="phone" id="phone" class="form-control small" required placeholder="Phone Number"
                v-model="phone" />
              <label for="phone">Phone Number</label>
            </div>
            <!-- Email input -->
            <div class="form-floating mb-2">
              <input type="email" name="email" id="email" class="form-control small" required placeholder="Email address"
                v-model="email" />
              <label for="email">Email Address</label>
            </div>

            <!-- Password input -->
            <div class="form-floating mb-2">
              <input type="password" name="password" id="password" class="form-control small" required
                placeholder="Password" v-model="password" />
              <label for="password">Password</label>
            </div>
            <div class="form-floating mb-2">
              <input type="password" name="confirmpassword" id="confirmpassword" class="form-control small"
                placeholder="Confirm Password" required v-model="confirmpassword" @input="checkMsg" />
              <label for="confirmpassword">Confirm Password</label>
            </div>
            <!-- Validation message -->
            <div class="alert" :class="{ 'alert-danger': !isValid || !passwordsMatch, 'alert-success': passwordsMatch }"
              v-if="showMessage">{{
                message }}</div>
          </div>

          <!-- Submit button -->
          <button type="submit" class="btn btn-primary mx-auto w-100 mb-3">Sign up</button>
          <!-- Signin -->
          <div class="row">
            <div class="col-md-6 mb-2">
              <a href="/signin">Already have an account?</a>
            </div>
            <div class="col-md-6 mb-2">
              <a href="/forgot-password">Forgot Password</a>
            </div>
          </div>
          <div>
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
    FontAwesomeIcon,
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
      confirmpassword: '',
      showMessage: false,
    }
  },
  computed: {
    passwordsMatch() {
      return this.password === this.confirmpassword;
    },
    isValid() {
      return this.password !== '' && this.confirmpassword !== '';
    },
    message() {
      if (this.passwordsMatch) {
        return 'Passwords match!';
      } else {
        return 'Passwords do not match.';
      }
    },
  },
  methods: {
    checkMsg() {
      this.dirty = this.confirmpassword !== '';
      this.showMessage = this.dirty;

      if (!this.dirty) {
        this.showMessage = false;
      }
    },
    async signup() {
      if (!this.passwordsMatch) {
        window.alert('Passwords do not match. Please try again.');
      }
      else {
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
          this.showMessage = false;
          this.$refs.signupForm.reset();

        } catch (error) {
        }
        this.$router.push('/signin');
      }
    },
  }
};

</script>
  
  