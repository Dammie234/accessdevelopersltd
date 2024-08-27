<template>
  <div>
    <page-header></page-header>

    <page-sidebar :page="'invoices'"></page-sidebar>

    <div class="page-container">
      <page-header-desktop :user="user"></page-header-desktop>

      <div class="main-content">
        <div class="section__content section__content--p30">
          <div class="container-fluid">
            <div class="row">
              <div class="col-md-12">
                <div class="overview-wrap">
                  <h2 class="title-1">create invoice</h2>
                  <routerLink
                    :to="{ name: 'invoices' }"
                    class="au-btn au-btn-icon au-btn--blue"
                  >
                    <i class="fa fa-chevron-left"></i>go back
                  </routerLink>
                </div>
              </div>
            </div>

            <div class="row mt-3">
              <div class="col-md-12">
                <div class="card">
                  <div class="card-body">
                    <div class="card-title">
                      <h3 class="text-center title-2">Create Invoice</h3>
                    </div>
                    <hr />
                    <page-loader v-if="loading" title="Creating Invoice"></page-loader>
                    <form @submit.prevent="store" v-else>
                      <div class="row">
                        <div class="col-md-4">
                          <div class="form-group">
                            <label for="company" class="control-label mb-1"
                              >Company</label
                            >
                            <select
                              id="company"
                              name="company"
                              v-model="form.company"
                              class="form-control"
                            >
                              <option value=""></option>
                              <option
                                v-for="(company, index) in companies"
                                :key="index"
                                :value="company.id"
                              >
                                {{ company.name }}
                              </option>
                            </select>
                            <small class="text-danger" v-if="errors.company">
                              {{ errors.company[0] }}
                            </small>
                          </div>
                        </div>
                        <div class="col-md-8">
                          <div class="form-group">
                            <label for="to" class="control-label mb-1">Invoice To</label>
                            <select
                              id="to"
                              name="to"
                              v-model="form.to"
                              class="form-control"
                            >
                              <option value=""></option>
                              <option
                                v-for="(organization, index) in organizations"
                                :key="index"
                                :value="organization.address"
                              >
                                {{ organization.name }}
                              </option>
                            </select>
                            <small class="text-danger" v-if="errors.to">
                              {{ errors.to[0] }}
                            </small>
                          </div>
                        </div>
                        <div class="col-md-12">
                          <div class="form-group">
                            <label for="title" class="control-label mb-1"
                              >Invoice Title</label
                            >
                            <input
                              id="title"
                              name="title"
                              v-model="form.title"
                              type="text"
                              class="form-control"
                            />
                            <small class="text-danger" v-if="errors.title">
                              {{ errors.title[0] }}
                            </small>
                          </div>
                        </div>
                        <div class="col-md-3">
                          <div class="form-group">
                            <label for="service_charge" class="control-label mb-1"
                              >Service Charge / Fee</label
                            >
                            <input
                              id="service_charge"
                              name="service_charge"
                              v-model="form.service_charge"
                              type="text"
                              class="form-control"
                            />
                          </div>
                        </div>
                        <div class="col-md-3">
                          <div class="form-group">
                            <label for="vat" class="control-label mb-1">VAT</label>
                            <input
                              id="vat"
                              name="vat"
                              v-model="form.vat"
                              type="text"
                              class="form-control"
                            />
                          </div>
                        </div>
                        <div class="col-md-3">
                          <div class="form-group">
                            <label for="number_of_rows" class="control-label mb-1"
                              >Number of Rows</label
                            >
                            <input
                              id="number_of_rows"
                              name="number_of_rows"
                              v-model="number_of_rows"
                              type="number"
                              @input="convertInteger"
                              class="form-control"
                            />
                          </div>
                        </div>
                      </div>

                      <div class="row" v-for="(n, index) in number_of_rows">
                        <div class="col-md-2">
                          <div class="form-group">
                            <label for="qty" class="control-label mb-1"
                              >Qty of {{ n }}</label
                            >
                            <input
                              id="qty"
                              name="qty"
                              v-model="qty[index]"
                              type="number"
                              class="form-control"
                            />
                          </div>
                        </div>
                        <div class="col-md-6">
                          <div class="form-group">
                            <label for="description" class="control-label mb-1"
                              >Description of {{ n }}</label
                            >
                            <input
                              id="description"
                              name="description"
                              v-model="description[index]"
                              type="text"
                              class="form-control"
                            />
                          </div>
                        </div>
                        <div class="col-md-2">
                          <div class="form-group">
                            <label for="rate" class="control-label mb-1"
                              >Rate of {{ n }}</label
                            >
                            <input
                              id="rate"
                              name="rate"
                              v-model="rate[index]"
                              type="number"
                              class="form-control"
                            />
                          </div>
                        </div>
                        <div class="col-md-2">
                          <div class="form-group">
                            <label for="amount" class="control-label mb-1"
                              >Amount of {{ n }}</label
                            >
                            <input
                              id="amount"
                              type="text"
                              disabled
                              v-if="qty[index] && rate[index]"
                              :value="qty[index] * rate[index]"
                              class="form-control"
                            />
                          </div>
                        </div>
                      </div>

                      <div>
                        <button
                          id="payment-button"
                          type="submit"
                          class="btn btn-lg btn-info btn-block"
                        >
                          <i class="fa fa-lock fa-lg"></i>&nbsp;
                          <span id="payment-button-amount">Create Invoice</span>
                        </button>
                      </div>
                    </form>
                  </div>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-md-12">
                <div class="copyright">
                  <p>Copyright © 2024 Web Tags Ltd. All rights reserved.</p>
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
  data() {
    return {
      id: "",
      token: "",
      user: "",
      companies: "",
      number_of_rows: 1,
      counts: [],
      form: {
        company: "",
        to: "",
        title: "",
        service_charge: "",
        vat: "",
        qty: [],
        description: [],
        rate: [],
        number_of_rows: "",
      },
      organizations: [],
      qty: [],
      description: [],
      rate: [],
      errors: {},
      loading: false,
    };
  },
  created() {
    this.login();
    this.getUser();
    this.getCompanies();
    this.getOrganizations();
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
    convertInteger() {
      this.number_of_rows = parseInt(this.number_of_rows);
    },
    getOrganizations() {
      axios
        .get("/api/access/organizations", {
          headers: {
            Authorization: "Bearer " + this.token,
            Accept: "application/json",
          },
        })
        .then((res) => {
          this.organizations = res.data;
          this.loading1 = false;
        })
        .catch();
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
    getCompanies() {
      axios
        .get("/api/access/companies", {
          headers: {
            Authorization: "Bearer " + this.token,
            Accept: "application/json",
          },
        })
        .then((res) => (this.companies = res.data))
        .catch();
    },
    store() {
      this.loading = true;
      this.form.qty = this.qty;
      this.form.description = this.description;
      this.form.rate = this.rate;
      this.form.number_of_rows = this.number_of_rows;
      axios
        .post("/api/invoices", this.form)
        .then(() => {
          Toast.fire({
            icon: "success",
            title: "Invoice successfully created",
          });
          this.$router.push({
            name: "invoices",
          });
        })
        .catch((error) => {
          this.loading = false;
          this.errors = error.response.data.errors;
        });
    },
  },
};
</script>
