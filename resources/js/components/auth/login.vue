<template>
  <div>
    <div
      class="page-content--bge5 login-bg"
      style="background-image: url('assets/images/login-bg.jpg')"
    >
      <div class="container">
        <div class="login-wrap">
          <div class="login-content">
            <div class="login-logo">
              <a href="#">
                <img src="assets/images/access-developers.png" alt="CoolAdmin" />
              </a>
            </div>
            <div class="login-form">
              <div v-if="error == true" class="">
                <div
                  class="alert alert-danger alert-dismissible fade show"
                  role="alert"
                  v-for="(error, index) in errors"
                  :key="index"
                >
                  <strong>Whoops!</strong> {{ error }}
                  <button
                    type="button"
                    class="btn-close"
                    data-bs-dismiss="alert"
                    aria-label="Close"
                  ></button>
                </div>
              </div>
              <page-loader v-if="loading" title="Signing In"></page-loader>

              <form @submit.prevent="login" v-else>
                <div class="form-group">
                  <label>Email Address</label>
                  <input
                    class="au-input au-input--full"
                    type="email"
                    name="email"
                    v-model="form.email"
                    placeholder="Email"
                    required
                  />
                </div>
                <div class="form-group">
                  <label>Password</label>
                  <input
                    class="au-input au-input--full"
                    type="password"
                    name="password"
                    v-model="form.password"
                    required
                    placeholder="Password"
                  />
                </div>

                <button class="au-btn au-btn--block au-btn--green m-b-20" type="submit">
                  sign in
                </button>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "login",
  created() {
    if (User.loggedIn()) {
      this.$router.push({
        name: "home",
      });
    }
  },

  data() {
    return {
      form: {
        email: "",
        password: "",
      },
      errors: [],
      error: false,
      loading: false,
    };
  },
  created() {
    if (User.loggedIn()) {
      this.$router.push({
        name: "home",
      });
    }
  },
  methods: {
    login() {
      this.loading = true;
      axios
        .post("/api/auth/login", this.form)
        .then((res) => {
          User.responseAfterLogin(res);
          Toast.fire({
            icon: "success",
            title: "Signed in successfully",
          });
          this.$router.push({
            name: "home",
          });
        })

        .catch((error) => {
          this.error = true;
          this.loading = false;
          if (error.response.status == 401) {
            this.errors.push(error.response.data.error);
          }
        });
    },
  },
};
</script>

<style css>
.login-bg {
  background-position: center center;
  background-size: cover;
}
</style>
