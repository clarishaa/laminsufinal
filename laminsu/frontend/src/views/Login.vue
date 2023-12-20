<template>
  <div class="container">
    <div class="row">
      <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
        <div class="card border-0 shadow rounded-3 my-5">
          <div class="card-body p-4 p-sm-5">
            <h5 class="card-title text-center mb-5 fw-light fs-5">Sign In</h5>
            <form @submit.prevent="login">
              <div class="form-floating mb-3">
                <input type="email" class="form-control" id="floatingInput" placeholder="name@example.com"
                  @input="clearError" v-model="username" required>
                <label for="floatingInput">Email address</label>
              </div>
              <div class="form-floating mb-3">
                <input type="password" class="form-control" @input="clearError" id="floatingPassword"
                  placeholder="Password" v-model="password" required>
                <label for="floatingPassword">Password</label>
              </div>
              <div v-if="errorMessage" class="text-white text-center mb-3 p-2 bg-danger rounded small">
                {{ errorMessage }}
              </div>
              <div class="form-check mb-3">
                <input class="form-check-input" type="checkbox" value="" id="rememberPasswordCheck">
                <label class="form-check-label" for="rememberPasswordCheck">
                  Remember password
                </label>
              </div>
              <div class="d-grid">
                <button class="btn btn-primary btn-login text-uppercase fw-bold" type="submit">Sign
                  in</button>
                <a class="text-center" href="">Forgot Password?</a>
              </div>
              <hr class="my-4">
              <div class="d-grid mb-2">
                <a class="btn btn-success btn-login text-uppercase fw-bold" href="/signup">Create New Account</a>
              </div>
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
import router from '@/router';
export default {
  data() {
    return {
      username: '',
      password: '',
      errorMessage: '',
      message: [],

    };
  },
  methods: {

    login() {

      const data = {
        username: this.username,
        password: this.password,
      };

      axios
        .post('/login', JSON.stringify(data), {
          headers: {
            'Content-Type': 'application/json',
          },
        })
        .then((response) => {
          if (response.data.message === 'Login successful') {
            sessionStorage.setItem("token", response.data.token);
            sessionStorage.setItem("user_id", response.data.user_id);

            if (response.data.user_type === 'admin') {
              router.push('/admin');
            }
            else if (response.data.user_type === 'staff') {
              router.push('/admin/pos');
            } else {
              router.push('/');

            }
          }
        })

        .catch((error) => {
          console.error(error);
          this.errorMessage = 'Invalid email or password, try again!';
        });
    },
    clearError() {
      this.errorMessage = '';
    },
  },
};
</script>