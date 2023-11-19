<template>
  <div class="container">
    <div class="row">
      <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
        <div class="card border-0 shadow rounded-3 my-5">
          <div class="card-body p-4 p-sm-5">
            <h5 class="card-title text-center mb-5 fw-light fs-5">Signup</h5>
            <form @submit.prevent="register">
              <div class="form-floating mb-3">
                <input type="email" class="form-control" id="floatingInput" placeholder="name@example.com"
                  v-model="username" required>
                <label for="floatingInput">Email address</label>
              </div>
              <div class="form-floating mb-3">
                <input type="text" class="form-control" id="floatingInput" placeholder="Last Name" v-model="lastname" required>
                <label for="floatingInput">Last Name</label>
              </div>
              <div class="form-floating mb-3">
                <input type="text" class="form-control" id="floatingInput" placeholder="First Name" v-model="firstname" required>
                <label for="floatingInput">First Name</label>
              </div>
              <div class="form-floating mb-3">
                <input type="number" class="form-control" id="floatingInput" placeholder="First Name" v-model="mobile" required>
                <label for="floatingInput">Mobile Number</label>
              </div>
              <div class="form-floating mb-3">
                <input type="password" class="form-control" id="floatingPassword" placeholder="Password"
                  v-model="password" required>
                <label for="floatingPassword">Password</label>
              </div>
              <div>
                <div class="form-floating mb-3">
                  <input type="password" class="form-control" placeholder="Password" v-model="confirmpassword"
                    @input="checkPasswordMatch" required/>
                  <span v-if="confirmpassword.length > 0" id="password-status"
                    style="font-size: 16px; position: absolute; top: 50%; transform: translateY(-50%); right: 5px;">
                    <i :class="passwordStatusIcon"></i>
                  </span>
                  <label for="floatingPassword">Confirm Password</label>
                </div>
              </div>
              <div class="form-check mb-3">
                <input class="form-check-input" type="checkbox" value="" id="rememberPasswordCheck" >
                <label class="form-check-label" for="rememberPasswordCheck">
                  Remember password
                </label>
              </div>
              <div class="d-grid">
                <button class="btn btn-primary btn-login text-uppercase fw-bold" type="submit">Sign
                  in</button>
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
      lastname: "",
      firstname: "",
      mobile: "",
      password: '',
      confirmpassword: '',
    };
  },
  computed: {
    passwordStatusIcon() {
      return this.confirmpassword === this.password ? 'fas fa-check text-success' : 'fas fa-times text-danger';
    },
  },
  methods: {
    async register() {
      try {
        const insert = await axios.post("register", {
          username: this.username,
          lastname: this.lastname,
          firstname: this.firstname,
          mobile: this.mobile,
          password: this.password,
        })
        this.showMessage = false;
        this.$router.push('/signin');
      } catch (error) {
      }
    }
  },
};
</script>
  
  