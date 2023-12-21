<template>
    <div class="container">
        <div class="col-md-12" style="margin-top: 6rem;">
            <div class="card">
                <div class="card-header d-flex justify-content-between align-items-center">
                    <h4>Inventory Management</h4>
                    <a class="btn btn-primary ms-auto" @click="openModal()" data-bs-toggle="modal"
                        data-bs-target="#editModal" data-bs-placement="top" title="Add">
                        Add Product
                    </a>
                    <a class="btn btn-primary ms-2" href="/admin/audit">
                        <i class="fas fa-history"></i>
                    </a>

                </div>

                <div class="card-body">
                    <table class="table table-bordered table-hover display" id="example" style="width:100%" ref="dataTable">
                        <thead>
                            <tr>
                                <th>No</th>
                                <th>Image</th>
                                <th>Product</th>
                                <th>Category</th>
                                <th>Description</th>
                                <th>Price</th>
                                <th>Quantity</th>
                                <th class="text-center">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr v-for="(prod, index) in items" :key="index">
                                <td>{{ index + 1 }}</td>
                                <td style="width: 5rem; height: 5rem; overflow: hidden;">
                                    <img :src="require('@/assets/img/' + prod.img_path)" class="img-fluid"
                                        alt="Image description" style="width: 100%; height: 100%; object-fit: cover;">
                                </td>
                                <td>{{ prod.item_name }}</td>
                                <td>{{ prod.category_name }}</td>
                                <td>{{ prod.description }}</td>
                                <td>₱ {{ prod.price }}</td>
                                <td>{{ prod.quantity }}</td>
                                <td class="text-center">
                                    <a class="btn btn-primary me-2" @click="openModal(prod.item_id)" data-bs-toggle="modal"
                                        data-bs-target="#editModal" data-bs-placement="top" title="Edit">
                                        <i class="fas fa-edit"></i>
                                    </a>
                                    <a class="btn btn-primary me-2" @click="openModall(prod.item_id)" data-bs-toggle="modal"
                                        data-bs-target="#auditModal" data-bs-placement="top" title="Add">
                                        <i class="fas fa-plus"></i>
                                    </a>
                                </td>
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
                    <!-- Image Input -->
                    <div class="mb-3">
                        <div class="form-floating">
                            <input type="file" class="form-control" id="imageInput" name="image" ref="imageInput"
                                @change="imageInput" accept="image/*">
                            <label for="imageInput">Choose an image</label>
                        </div>
                    </div>

                    <!-- Product Input -->
                    <div class="mb-3">
                        <div class="form-floating">
                            <input type="text" class="form-control" id="productInput" v-model="name" required>
                            <label for="productInput">Product Name</label>
                        </div>
                    </div>

                    <!-- Category Input -->
                    <div class="mb-3">
                        <label for="categorySelect" class="form-label">Category</label>
                        <div class="form-floating">
                            <select class="form-select" id="categorySelect" v-model="category_id" required>
                                <option value="" disabled selected>Select a category</option>
                                <option v-for="category in categories" :key="category.category_id"
                                    :value="category.category_id">
                                    {{ category.name }}</option>
                            </select>
                            <label for="categorySelect">Select a category</label>
                        </div>
                    </div>


                    <!-- Description Input -->
                    <div class="mb-3">
                        <div class="form-floating">
                            <textarea class="form-control" id="descriptionInput" v-model="description" required></textarea>
                            <label for="descriptionInput">Product Description</label>
                        </div>
                    </div>

                    <!-- Price Input -->
                    <div class="mb-3">
                        <div class="form-floating">
                            <input type="" class="form-control" id="priceInput" v-model="price" required>
                            <label for="priceInput">Product Price</label>
                        </div>
                    </div>

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
    <!-- Modal for Confirmation -->
    <div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="deleteModalLabel">Confirm Deletion</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    Are you sure you want to delete this product?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="button" class="btn btn-danger" @click="deleteConfirmed">Delete</button>

                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="auditModal" tabindex="-1" aria-labelledby="editModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content  p-4 rounded m-4">
                <h5 class="card-title text-center mb-2 fw-light fs-5">{{ modalTitle }}</h5>
                <form @submit.prevent="saveProd">

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
    name: "Inventory",
    components: {
        Notification, ReusableModal
    },
    data() {
        return {
            formData: {
                image: null,
            },
            items: [],
            img_path: null,
            name: '',
            description: '',
            price: '',
            category_id: '',
            quantity: '',
            isUpdate: false,
            modalTitle: 'Add Product',
            submitButtonText: 'Add',
            categories: [],
            item_id: ''
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
            const item = await axios.get("getInv");
            const category = await axios.get("getCat");
            this.items = item.data;
            this.categories = category.data;

        },
        async getData() {
            const item = await axios.get("getInv");
            const category = await axios.get("getCat");
            this.items = item.data;
            this.categories = category.data;

            this.$nextTick(() => {
                $(this.$refs.dataTable).DataTable({
                    dom: "Bfrtip",
                    responsive: true,
                    pageLength: 5,
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
                    this.modalTitle = 'Edit Product';
                    this.submitButtonText = 'Save Changes';
                    this.productId = id;
                    this.name = products.item_name;
                    this.description = products.description;
                    this.price = products.price;
                    this.productImage = products.img_path;
                    this.category_id = products.category_id;
                    this.quantity = products.quantity;

                    this.$router.push({ name: 'inventory', params: { id: id } });
                } catch (error) {
                    console.error('Error fetching employee data:', error);
                }
            } else {
                this.isUpdate = false;
                this.modalTitle = 'Add Product';
                this.submitButtonText = 'Add';
                this.employeeId = null;

                this.$router.push({ name: 'inventory' });
            }
        },
        imageInput() {
            const fileInput = this.$refs.imageInput;
            const file = fileInput.files[0];

            const formData = new FormData();
            formData.append('image', file);

            this.img_path = formData;
        },

        async saveProduct() {
            if (this.isUpdate) {
                try {
                    const formData = new FormData();

                    if (this.id) {
                        formData.append('id', this.id);
                    }

                    formData.append('name', this.name);
                    formData.append('category_id', this.category_id);
                    formData.append('description', this.description);
                    formData.append('price', this.price);
                    formData.append('quantity', this.quantity);

                    if (this.img_path && this.img_path.get('image')) {
                        formData.append('image', this.img_path.get('image'));
                    }

                    await axios.post(`updateProd/${this.$route.params.id}`, formData);

                    this.closeModal();
                    this.$refs.notification.open("Product info updated.", 'success');

                } catch (error) {
                    console.log(error);
                }
            }
            else {
                try {
                    const formData = new FormData();

                    formData.append('name', this.name);
                    formData.append('category_id', this.category_id);
                    formData.append('description', this.description);
                    formData.append('price', this.price);
                    formData.append('quantity', this.quantity);

                    formData.append('image', this.img_path.get('image'));

                    await axios.post("addProd", formData);
                    this.name = "";
                    this.category_id = "";
                    this.description = "";
                    this.price = "";
                    this.quantity = "";
                    this.$router.push({ name: 'inventory' });
                    this.closeModal();
                } catch (error) {
                    console.error('Error saving product:', error);
                }
            }
            this.getStaff();
        },



        closeModal() {
            this.$router.push({ name: 'inventory' });
            $('#editModal').modal('hide');
            $('#auditModal').modal('hide');
        },
        clearError() {
            this.emailError = '';
            this.passErrorError = '';
        },
        prodDelete(userId) {
            this.DeleteId = userId;

            $('#deleteModal').modal('show');
        },
        deleteConfirmed() {
            this.deleteProd(this.DeleteId);

            $('#deleteModal').modal('hide');
        },
        async deleteProd(userId) {
            try {
                await axios.delete(`/deleteProd/${userId}`);
                this.$refs.notification.open("Deleted successfully.", 'success');
                this.getStaff();
            } catch (error) {
                console.log(error);
            }
            this.$router.push({ name: 'inventory' });
        },
        async openModall(id = null) {
            if (id) {
                try {
                    const response = await axios.get(`fetchProducts/${id}`);
                    const products = response.data;

                    this.isUpdate = true;
                    this.modalTitle = 'Add Quantity';
                    this.submitButtonText = 'Save Changes';
                    this.productId = id;


                    this.$router.push({ name: 'inventory', params: { id: id } });
                } catch (error) {
                    console.error('Error fetching audit data:', error);
                }
            } else {
                this.isUpdate = false;
                this.modalTitle = 'Add Product';
                this.submitButtonText = 'Add';
                this.employeeId = null;

                this.$router.push({ name: 'inventory' });
            }
        },
        async saveProd() {
            const q = {
                quantity: this.quantity
            };
            
            await axios.put(`updateQuan/${this.$route.params.id}`, q);
            this.$refs.notification.open("Product quantity updated.", 'success');
            this.$router.push({ name: 'inventory' });
            this.closeModal();
            this.getStaff();
        }

    },
};
</script>
    
<style></style>
    