<template>
  <div class="card">
    <div class="card-body">
      <div class="container mb-5 mt-3" v-if="invoices.length > 0" v-for="invoice in invoices" :key="invoice.invoice_id">
        <div class="row d-flex align-items-baseline">
          <div class="col-xl-9">
            <img :src="require('@/assets/logo.png')" class="img-fluid" alt="Image description"
              style="max-width: 6%; height: 6%;" />
          </div>

          <div class="col-xl-3 float-end mb-3">
            <p class="text-sm" style="color: #7e8d9f; font-size: 18px; margin-left: 10px;">Invoice ID: <strong>
                {{ invoice.invoice_number }}</strong></p>
          </div>

          <hr class="w-100">
        </div>

        <div class="container">

          <div class="row">
            <div class="col-xl-6">
              <ul class="list-unstyled">
                <li class="text-muted text-sm">To: <span style="color:#5d9fc5 ;">{{ invoice.first_name }} {{
                  invoice.last_name }}</span> | {{ invoice.email }} | <i class="fas fa-phone"></i> {{ invoice.mobile }}
                </li>
              </ul>
            </div>
            <div class="col-xl-4">
              <p class="text-muted text-sm">
                Invoice: <i class="fas fa-circle" style="color:#84B0CA ;"></i> <span class="me-1 fw-bold">Date: {{
                  invoice.invoice_date }}
                </span> <span class="badge bg-warning text-black fw-bold">{{ String(invoice.order_status).toUpperCase()
                }}</span>
              </p>
            </div>
            <div class="col-xl-2 ms-auto">
                <button class="btn btn-light text-capitalize border-0 ms-2" onclick="window.print()">
                  <i class="fas fa-print text-primary"></i> Print
                </button>
                <button class="btn btn-light text-capitalize ms-2">
                  <i class="far fa-file-pdf text-danger"></i> Export
                </button>
              </div>
          </div>

          <div class="row my-2 mx-1 justify-content-center text-sm" v-for="item in items">
            <table class="table table-striped table-borderless">
              <thead style="background-color:#84B0CA ;" class="text-white">
                <tr>
                  <th scope="col">No.</th>
                  <th scope="col">Product</th>
                  <th scope="col">Quantity</th>
                  <th scope="col">Price</th>
                  <th scope="col">Total</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <th scope="row">1</th>
                  <td>{{ item.name }}</td>
                  <td>{{ item.quantity }}</td>
                  <td>₱ {{ item.price }}</td>
                  <td>₱ {{ item.total_price }}</td>
                </tr>
              </tbody>

            </table>
          </div>

          <div class="row text-sm">
            <div class="col-xl-6">
              <ul class="list-unstyled">
                <li class="text-muted ms-3"><span class="text-black me-2">SubTotal</span>₱ {{ invoice.total_amount }}</li>
                <li class="text-muted ms-3 mt-2"><span class="text-black me-2">Tax(15%)</span>$111</li>
              </ul>
            </div>
            <div class="col-xl-6 text-end">
              <p class="text-black">
                <span class="text-black me-2">Total Amount</span>
                <strong style="font-size: 18px; color: rgb(3, 70, 52);">$1221</strong>
              </p>
            </div>

          </div>

          <hr>
          <div class="row text-sm">
            <div class="col-xl-10">
              <p>Thank you for your purchase</p>
            </div>
            <div class="col-xl-2">
              <button type="button" class="btn btn-primary text-capitalize btn-lg float-end">Pay
                Now</button>
            </div>
          </div>

        </div>
      </div>
    </div>
  </div>
</template>

<style >
.btn-light:hover {
  background-color: rgb(123, 207, 148);
  /* Change to your desired hover background color */
  color: #fff;
  /* Change to your desired hover text color */
}
</style>
<script>
import axios from 'axios';

export default {
  components: {
  },
  data() {
    return {
      invoices: {},
    };
  },
  mounted() {
    const invoiceId = this.$route.params.invoice_id;
    this.getInvoice(invoiceId);
  },
  methods: {
    async getInvoice(invoice_id) {
      try {
        const response = await axios.get(`/getInvoice/${invoice_id}`);
        this.invoices = response.data.invoice_details;
        this.items = response.data.items;

        console.log('Retrieved invoices:', this.invoices);
      } catch (error) {
        console.error('Error fetching invoice:', error);
        console.log('Retrieved invoices:', this.invoices);

      }
    },
  }
};
</script>