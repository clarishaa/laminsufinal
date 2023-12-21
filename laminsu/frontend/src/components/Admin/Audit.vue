<template>
    <div class="container">
        <div class="col-md-12" style="margin-top: 6rem;">
            <div class="card">
                <div class="card-header d-flex justify-content-between align-items-center">
                    <h4>Audit History</h4>

                </div>

                <div class="card-body">
                    <table class="table table-bordered table-hover display" id="example" style="width:100%" ref="dataTable">
                        <thead>
                            <tr>
                                <th>No</th>
                                <th>Product</th>
                                <th>Old Quantity</th>
                                <th>New Quantity</th>
                                <th>Type</th>
                                <th>Last Update</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr v-for="(prod, index) in items" :key="index">
                                <td>{{ index + 1 }}</td>
                                <td>{{ prod.name }}</td>
                                <td>{{ prod.oldQuantity }}</td>
                                <td>{{ prod.audit_quantity }}</td>
                                <td>{{ prod.type }}</td>
                                <td>{{ prod.updated_at }}</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="editModal" tabindex="-1" aria-labelledby="editModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content  p-4 rounded m-4">
                <h5 class="card-title text-center mb-2 fw-light fs-5">{{ modalTitle }}</h5>
                <form @submit.prevent="saveProduct">

                    <!-- Quantity Input -->
                    <div class="mb-3">
                        <div class="form-floating">
                            <input type="number" class="form-control" id="quantityInput" v-model="quantity" required>
                            <label for="quantityInput">Product Quantity</label>
                        </div>
                    </div>

                    <!-- Submit Button -->
                    <div class="d-grid">
                        <button class="btn btn-primary btn-login text-uppercase fw-bold" type="submit">{{ submitButtonText
                        }}</button>
                    </div>

                    <hr class="my-4">
                </form>

            </div>
        </div>
    </div>

    <Notification ref="notification" />
</template>
    
<script>
import Notification from "@/components/Notification.vue";
import ReusableModal from '@/components/User/Modal.vue';
import axios from "axios";

export default {
    name: "Audit",
    components: {
        Notification, ReusableModal
    },
    data() {
        return {
            items: [],
            isUpdate: false,
            modalTitle: 'Add Product',
            submitButtonText: 'Add',
            categories: [],
            item_id: '',
            quantity:''
        };
    },
    computed: {
    },
    mounted() {
        this.getData();
        this.getStaff();
    },
    methods: {
        async getStaff() {
            const item = await axios.get("getAud");
            this.items = item.data;

        },
        async getData() {
            const item = await axios.get("getAud");
            this.items = item.data;

            this.$nextTick(() => {
                $(this.$refs.dataTable).DataTable({
                    dom: "Bfrtip",
                    responsive: true,
                    pageLength: 10,
                    buttons: ["csv", "excel", "print"],
                });
            });
        },
        async openModal(id = null) {
            if (id) {
                try {
                    const response = await axios.get(`fetchProducts/${id}`);
                    const products = response.data;

                    this.isUpdate = true;
                    this.modalTitle = 'Add Quantity';
                    this.submitButtonText = 'Save Changes';
                    this.productId = id;
        

                    this.$router.push({ name: 'audit', params: { id: id } });
                } catch (error) {
                    console.error('Error fetching audit data:', error);
                }
            } else {
                this.isUpdate = false;
                this.modalTitle = 'Add Product';
                this.submitButtonText = 'Add';
                this.employeeId = null;

                this.$router.push({ name: 'audit' });
            }
        },


        closeModal() {
            this.$router.push({ name: 'audit' });
            $('#editModal').modal('hide');
        },
    },
};
</script>
    
<style></style>
    