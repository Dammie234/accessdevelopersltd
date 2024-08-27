<template>
  <div>
    <page-header></page-header>

    <page-sidebar :page="'dashboard'"></page-sidebar>

    <div class="page-container">
      <page-header-desktop :user="user"></page-header-desktop>

      <div class="main-content">
        <div class="section__content section__content--p30">
          <div class="container-fluid">
            <div class="row">
              <div class="col-md-12">
                <div class="overview-wrap">
                  <h2 class="title-1">overview</h2>
                  <routerLink
                    :to="{ name: 'create-invoice' }"
                    class="au-btn au-btn-icon au-btn--blue"
                  >
                    <i class="zmdi zmdi-plus"></i>create invoice
                  </routerLink>
                </div>
              </div>
            </div>

            <div class="row mt-5">
              <div class="col-md-12">
                <page-loader v-if="loading" title="Loading Invoice"></page-loader>
                <div class="table-responsive table-responsive-data2" v-else>
                  <table class="table table-data2">
                    <thead>
                      <tr>
                        <th>#</th>
                        <th>company</th>
                        <th>title</th>

                        <th>date</th>
                        <th>invoice no</th>
                        <th>to</th>
                        <th></th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr
                        class="tr-shadow"
                        v-for="(invoice, index) in invoices"
                        :key="index"
                      >
                        <td>
                          {{ index + 1 }}
                        </td>
                        <td>{{ invoice.name }}</td>
                        <td>
                          {{ invoice.title }}
                        </td>

                        <td>{{ invoice.date | moment("dddd, MMMM Do YYYY") }}</td>
                        <td>
                          {{ invoice.invoice_number }}
                        </td>
                        <td>{{ invoice.to }}</td>
                        <td>
                          <div class="table-data-feature">
                            <routerLink
                              :to="{
                                name: 'invoice',
                                params: { id: invoice.id },
                              }"
                              class="item"
                              data-toggle="tooltip"
                              data-placement="top"
                              title=""
                              data-original-title="More"
                            >
                              <i class="zmdi zmdi-more"></i>
                            </routerLink>
                          </div>
                        </td>
                      </tr>
                      <!-- <tr class="spacer"></tr> -->
                    </tbody>
                  </table>
                </div>
              </div>
            </div>

            <div class="row">
              <div class="col-md-12">
                <div class="copyright">
                  <p>Copyright © 2024 Access Developers Ltd. All rights reserved.</p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "home",
  data() {
    return {
      id: "",
      token: "",
      user: "",
      invoices: [],
      loading: true,
    };
  },
  created() {
    this.login();
    this.getUser();
    this.getInvoices();
  },
  methods: {
    login() {
      if (!User.loggedIn()) {
        this.$router.push({
          name: "/",
        });
      } else {
        this.id = User.id();
        this.token = User.token();
      }
    },
    getUser() {
      axios
        .get("/api/access/user/" + this.id, {
          headers: {
            Authorization: "Bearer " + this.token,
            Accept: "application/json",
          },
        })
        .then((response) => (this.user = response.data))
        .catch((error) => {
          console.log(error);
          if (error.response.status == 401) {
            this.$router.push({
              name: "logout",
            });
          }
        });
    },
    getInvoices() {
      axios
        .get("/api/access/few-invoices", {
          headers: {
            Authorization: "Bearer " + this.token,
            Accept: "application/json",
          },
        })
        .then((res) => {
          this.invoices = res.data;
          this.loading = false;
        })
        .catch();
    },
  },
};
</script>

<style scoped></style>
