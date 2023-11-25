<template>
  <div class="container">
    <div class="row">
      <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
        <div class="card border-0 shadow rounded-3 my-5">
          <div class="card-body p-4 p-sm-5">
            <h5 class="card-title text-center mb-5 fw-light fs-5">Signup</h5>
            <form @submit.prevent="register">
              <!-- Email -->
              <div class="form-floating mb-3">
                <input type="email"  @input="clearError" class="form-control" id="floatingInput" placeholder="name@example.com"
                  v-model="username" required pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$">
                <label for="floatingInput">Email address</label>
              </div>
              <div v-if="emailError" class="text-white text-center mb-3 p-2 bg-danger rounded small">
                {{ emailError }}
              </div>
              <!-- Last Name -->
              <div class="form-floating mb-3">
                <input type="text" class="form-control" id="floatingInput" placeholder="Last Name" v-model="last_name"
                  required>
                <label for="floatingInput">Last Name</label>
              </div>

              <!-- First Name -->
              <div class="form-floating mb-3">
                <input type="text" class="form-control" id="floatingInput" placeholder="First Name" v-model="first_name"
                  required>
                <label for="floatingInput">First Name</label>
              </div>

              <!-- Mobile Number -->
              <div class="form-floating mb-3">
                <input type="tel" class="form-control" id="floatingInput" placeholder="Mobile Number" v-model="mobile"
                  required pattern="[0-9]{11}" maxlength="11">
                <label for="floatingInput">Mobile Number</label>
              </div>


              <!-- Password -->
              <div class="form-floating mb-3">
                <input type="password"  @input="clearError"  class="form-control" id="floatingPassword" placeholder="Password"
                  v-model="password" required minlength="8">
                <label for="floatingPassword">Password</label>
              </div>
              <div v-if="passError" class="text-white text-center mb-3 p-2 bg-danger rounded small">
                {{ passError }}
              </div>

              <!-- Confirm Password -->
              <div class="form-floating mb-3">
                <input type="password" class="form-control" placeholder="Confirm Password" v-model="confirmpassword"
                  @input="checkPasswordMatch" required minlength="8" />
                <span v-if="confirmpassword.length > 0" id="password-status"
                  style="font-size: 16px; position: absolute; top: 50%; transform: translateY(-50%); right: 5px;">
                  <i :class="passwordStatusIcon"></i>
                </span>
                <label for="floatingPassword">Confirm Password</label>
              </div>

              <!-- Remember Password -->
              <div class="form-check mb-3">
                <input class="form-check-input" type="checkbox" value="" id="rememberPasswordCheck">
                <label class="form-check-label" for="rememberPasswordCheck">
                  Remember password
                </label>
              </div>

              <!-- Submit Button -->
              <div class="d-grid">
                <button class="btn btn-primary btn-login text-uppercase fw-bold" type="submit">Sign in</button>
              </div>

              <hr class="my-4">
            </form>

          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<style></style>
<script>
import axios from 'axios';

export default {
  name: 'Register',
  data() {
    return {
      username: '',
      last_name: '',
      first_name: '',
      mobile: '',
      password: '',
      confirmpassword: '',
      showMessage: false,
      emailError: '',
      passError: '',
    };
  },
  computed: {
    passwordStatusIcon() {
      return this.confirmpassword === this.password
        ? 'fas fa-check text-success'
        : 'fas fa-times text-danger';
    },
  },
  methods: {
    async register() {
      try {
        const response = await axios.post('register', {
          username: this.username,
          last_name: this.last_name,
          first_name: this.first_name,
          mobile: this.mobile,
          password: this.password,
        });

        console.log(response.data);
        this.showMessage = false;
        this.$router.push('/signin');
      } catch (error) {
        console.error(error);
        if (error.response && error.response.status === 400) {
          const errorData = error.response.data;
          if (errorData.error === 'Email already exists') {
            this.emailError = errorData.error;
          } else if (errorData.error === 'Password must contain at least one letter, one number and one special character') {
            this.passError = errorData.error;
          }
          else {
            this.emailError = '';
          }
        }
      }
    },
    clearError() {
      this.emailError = '';
      this.passErrorError = '';
    },
  },
};
</script>