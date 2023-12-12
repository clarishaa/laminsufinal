<template>
  <div class="card">
    <div class="card-body" id="inv" v-if="invoices.length > 0">
      <div class="container mb-5 mt-3">
        <div class="row d-flex align-items-baseline">
          <div class="col-xl-9">
            <img :src="require('@/assets/logo.png')" class="img-fluid" alt="Image description"
              style="max-width: 6%; height: 6%;" />
          </div>

          <div class="col-xl-3 float-end mb-3">
            <p class="text-sm" style="color: #7e8d9f; font-size: 18px; margin-left: 10px;">Invoice ID: <strong>
                {{ invoices[0].invoice_number }}</strong></p>
          </div>

          <hr class="w-100">
        </div>

        <div class="container">

          <div class="row">
            <div class="col-xl-6">
              <ul class="list-unstyled">
                <li class="text-muted text-sm">To: <span style="color:#5d9fc5 ;">{{ invoices[0].first_name }} {{
                  invoices[0].last_name }}</span> | {{ invoices[0].email }} | <i class="fas fa-phone"></i> {{
    invoices[0].mobile }}
                </li>
              </ul>
            </div>
            <div class="col-xl-4">
              <p class="text-muted text-sm">
                Invoice: <i class="fas fa-circle" style="color:#84B0CA ;"></i> <span class="me-1 fw-bold">Date: {{
                  invoices[0].invoice_date }}
                </span> <span class="badge bg-warning text-black fw-bold">{{
                  String(invoices[0].order_status).toUpperCase()
                }}</span>
              </p>
            </div>
            <div class="col-xl-2 ms-auto">
              <button class="btn btn-light text-capitalize border-0 ms-2" onclick="window.print()">
                <i class="fas fa-print text-primary"></i>
              </button>
              <button class="btn btn-light text-capitalize ms-2">
                <i class="far fa-file-pdf text-danger"></i>
              </button>
              <button class="btn btn-light text-capitalize ms-2" @click="save">
                <i class="fas fa-images ms-2"></i>
              </button>
            </div>
          </div>

          <div class="row my-2 mx-1 justify-content-center text-sm">
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
                <tr v-for="(item, index) in items" :key="item.id">
                  <th scope="row">{{ index + 1 }}</th>
                  <td>{{ item.name }}</td>
                  <td>{{ item.order_item_quantity }}</td>
                  <td>₱ {{ item.price }}</td>
                  <td>₱ {{ item.total_price }}</td>
                </tr>
              </tbody>


            </table>
          </div>

          <div class="row text-sm">
            <div class="col-xl-6">
              <ul class="list-unstyled">
                <li class="text-muted ms-3">
                  <span class="text-black me-2">SubTotal</span>₱ {{ invoices[0].total_amount }}
                </li>
                <li class="text-muted ms-3 mt-2">
                  <span class="text-black me-2">Tax(12%)</span>
                  ₱ {{ (invoices[0].total_amount * 0.12).toFixed(2) }}
                </li>
              </ul>
            </div>
            <div class="col-xl-6 text-end">
              <p class="text-black">
                <span class="text-black me-2">Total Amount</span>
                <strong style="font-size: 18px; color: rgb(3, 70, 52);">₱ {{ (Number(invoices[0].total_amount) +
                  Number(invoices[0].total_amount * 0.12)).toFixed(2) }}</strong>
              </p>
            </div>

          </div>

          <hr>
          <div class="row text-sm text-center">
            <div style="text-align: center; margin-top: 20px; font-family: 'Helvetica', sans-serif; color: #333;">
              <h2 style="color: #4CAF50; font-size: 24px; font-weight: bold;">Thank you for your purchase!</h2>
            </div>
            <p style="font-size: 10px; line-height: 1.5; margin-bottom: 20px;">La Minsu | Masipit, Calapan City |
              laminsu@gail.com | +630 123 456 789</p>
            <p>Show this to {{ invoices[0].order_type === 'delivery' ? 'Delivery Rider' : 'Cashier' }}.</p>
          </div>
        </div>
      </div>
    </div>
  </div>
  <Notification ref="notification" />
</template>

<style >
.btn-light:hover {
  background-color: rgb(123, 207, 148);
  color: #fff;
}
</style>
<script>
import ReusableModal from '@/components/User/Modal.vue';
import Notification from '@/components/Notification.vue';
import axios from 'axios';

export default {
  components: {
    Notification, ReusableModal,
  },
  data() {
    return {
      invoices: {},
      isModalOpen: false,
      selectedOption: '',

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
    openModal() {
      this.isModalOpen = true;
    },
    closeModal() {
      this.isModalOpen = false;
    },
    selectOption(option) {
      this.selectedOption = option;
      console.log(this.selectedOption);
    },
    async save() {
      const cardElement = document.querySelector('#inv');

      if (cardElement) {
        try {
          const canvas = await html2canvas(cardElement);
          const imageData = canvas.toDataURL('image/png');

          const link = document.createElement('a');
          link.href = imageData;
          link.download = 'invoice.png';
          link.click();
        } catch (error) {
          console.error('Error saving image:', error);
        }
      }
    },
  }
};
</script>