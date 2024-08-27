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
                  <h2 class="title-1">invoices</h2>
                  <routerLink
                    :to="{ name: 'create-invoice' }"
                    class="au-btn au-btn-icon au-btn--blue"
                  >
                    <i class="zmdi zmdi-plus"></i>create invoice
                  </routerLink>
                </div>
              </div>
            </div>
            <page-loader v-if="loading" title="Loading Invoice"></page-loader>
            <div class="row" v-else>
              <div class="col-md-12" id="printableArea">
                <div class="card mt-3 p-5">
                  <div class="row">
                    <div class="col-md-9" style="width: 75%">
                      <div
                        v-if="
                          data.invoice.name == 'Access Advertising' ||
                          data.invoice.name == 'Access Developers Ltd'
                        "
                        class=""
                        style="
                          padding: 13px 15px !important;
                          background-color: #394841 !important;
                          color: #fff;
                        "
                      >
                        <h3 class="text-uppercase text-white text-right font">Invoice</h3>
                      </div>
                      <div
                        class=""
                        v-if="data.invoice.name == 'Jerome K. Ejem'"
                        style="
                          padding: 13px 15px !important;
                          background-color: #00923f !important;
                          color: #fff;
                        "
                      >
                        <h3 class="text-uppercase text-white text-right font">Invoice</h3>
                      </div>
                      <h6 class="text-uppercase mt-4 font">TO:</h6>
                      <h5 class="text-uppercase font mt-2">
                        {{ data.invoice.organization }}
                      </h5>
                      <h5 class="text-uppercase mt-2 font">{{ data.invoice.to }}</h5>
                    </div>
                    <div class="col-md-3" style="width: 25%">
                      <img :src="'../../' + data.invoice.logo" alt="" />
                      <p class="mt-2 font" v-html="data.invoice.address"></p>
                    </div>
                  </div>
                  <div class="row mt-5">
                    <div class="col-md-9">
                      <h5 class="font">
                        Invoice Number: {{ data.invoice.invoice_number }}
                      </h5>
                    </div>
                    <div class="col-md-3">
                      <h5 class="font">
                        Date: {{ data.invoice.date | moment("Do MMMM, YYYY") }}
                      </h5>
                    </div>
                  </div>
                  <div class="row mt-5">
                    <div class="col-md-12">
                      <table class="table text-black" border="2">
                        <thead>
                          <tr>
                            <th colspan="4" class="text-uppercase text-center">
                              {{ data.invoice.title }}
                            </th>
                          </tr>
                          <tr>
                            <th class="text-black" style="width: 9%">Quantity</th>
                            <th class="text-black" style="width: 61%">Description</th>
                            <th class="text-black" style="width: 15%">Rate</th>
                            <th class="text-black" style="width: 15%">Amount</th>
                          </tr>
                        </thead>
                        <tbody>
                          <tr v-for="(invoice, index) in data.invoice_rows" :key="index">
                            <td>{{ invoice.qty }}</td>
                            <td>{{ invoice.description }}</td>
                            <td>&#8358; {{ formatNumber(invoice.rate) }}</td>
                            <td>
                              &#8358;
                              {{ formatNumber(invoice.rate * 1 * (invoice.qty * 1)) }}
                            </td>
                          </tr>
                          <tr>
                            <td></td>
                            <td>SUBTOTAL</td>
                            <td>&#8358;{{ formatNumber(computeSubTotal()) }}</td>
                            <td></td>
                          </tr>
                          <tr
                            v-if="
                              data.invoice.service_charge &&
                              (data.invoice.name == 'Access Advertising' ||
                                data.invoice.name == 'Access Developers Ltd')
                            "
                          >
                            <td></td>
                            <td>
                              PLUS {{ data.invoice.service_charge }}% AGENCY SERVICE FEE
                            </td>
                            <td></td>
                            <td>&#8358; {{ formatNumber(computeServiceFee()) }}</td>
                          </tr>
                          <tr
                            v-if="
                              data.invoice.service_charge &&
                              data.invoice.name == 'Jerome K. Ejem'
                            "
                          >
                            <td></td>
                            <td>PLUS {{ data.invoice.service_charge }}% SERVICE FEE</td>
                            <td></td>
                            <td>&#8358; {{ formatNumber(computeServiceFee()) }}</td>
                          </tr>
                          <tr v-if="data.invoice.service_charge">
                            <td></td>
                            <td>SUBTOTAL</td>
                            <td>
                              &#8358;
                              {{ formatNumber(computeSubTotal() + computeServiceFee()) }}
                            </td>
                            <td></td>
                          </tr>
                          <tr v-if="data.invoice.vat">
                            <td></td>
                            <td>PLUS {{ data.invoice.vat }}% VAT (IKV10002100993)</td>
                            <td></td>
                            <td>&#8358; {{ formatNumber(computeVAT()) }}</td>
                          </tr>
                          <tr>
                            <td></td>
                            <td>TOTAL</td>
                            <td></td>
                            <td>
                              &#8358;
                              <span v-if="data.invoice.service_charge">
                                {{
                                  formatNumber(
                                    computeSubTotal() + computeServiceFee() + computeVAT()
                                  )
                                }}</span
                              ><span v-else>
                                {{ formatNumber(computeSubTotal() + computeVAT()) }}</span
                              >
                            </td>
                          </tr>
                        </tbody>
                      </table>
                    </div>
                  </div>
                  <div class="row mt-5">
                    <div class="col-lg-9 mt-5" style="width: 70%">
                      <button @click="printDiv('printableArea')" class="noPrint">
                        Print Invoice
                      </button>
                    </div>
                    <div class="col-lg-3 mt-5" style="width: 30%">
                      <div class="line"></div>
                      <p class="text-center">Signature</p>
                    </div>
                  </div>
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
  data() {
    return {
      id: "",
      token: "",
      user: "",
      data: {},

      loading: true,
    };
  },
  created() {
    this.login();
    this.getUser();
    this.getInvoice();
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
    formatNumber(number) {
      number = number.toFixed(2) + "";
      let x = number.split(".");
      let x1 = x[0];
      let x2 = x.length > 1 ? "." + x[1] : "";
      var rgx = /(\d+)(\d{3})/;
      while (rgx.test(x1)) {
        x1 = x1.replace(rgx, "$1" + "," + "$2");
      }
      return x1 + x2;
    },
    printDiv(divName) {
      var printContents = document.getElementById(divName).innerHTML;
      var originalContents = document.body.innerHTML;

      document.body.innerHTML = printContents;

      window.print();

      document.body.innerHTML = originalContents;
    },
    computeSubTotal() {
      let total = 0;
      let invoices = this.data.invoice_rows;
      for (let index = 0; index < invoices.length; index++) {
        total += invoices[index].qty * invoices[index].rate;
      }
      return total;
    },
    computeServiceFee() {
      let total = 0;
      let invoices = this.data.invoice_rows;
      for (let index = 0; index < invoices.length; index++) {
        total += invoices[index].qty * invoices[index].rate;
      }
      let service_charge = parseInt(this.data.invoice.service_charge);
      let service_fee = (service_charge / 100) * total;
      return service_fee;
    },
    computeVAT() {
      let total = 0;

      if (this.data.invoice.service_charge) {
        total = this.computeSubTotal() + this.computeServiceFee();
      } else {
        total = this.computeSubTotal();
      }
      let vat = (this.data.invoice.vat / 100) * total;
      return vat;
    },
    getInvoice() {
      let id = this.$route.params.id;
      axios
        .get("/api/access/invoices/" + id, {
          headers: {
            Authorization: "Bearer " + this.token,
            Accept: "application/json",
          },
        })
        .then((res) => {
          this.data = res.data;
          this.loading = false;
        })
        .catch();
    },
  },
};
</script>
<style scoped>
.font {
  font-family: Arial, Helvetica, sans-serif;
}

.invoice-title {
  padding: 13px 15px;
  background: #394841;
}
.jerome {
  padding: 13px 15px;
  background: #00923f;
}
.line {
  border-top: 2px dotted #000;
}
.table {
  border: 2px solid #000;
}

.table thead th {
  border-bottom: 2px solid #000;
  color: #000;
}

.table tbody td {
  border-bottom: 2px solid #000;
  color: #000;
}

@media print {
  .noPrint {
    display: none;
  }
  .invoice-title {
    padding: 13px 15px;
    background: #394841;
  }
  .jerome {
    padding: 13px 15px;
    background: #00923f;
  }
}
</style>
