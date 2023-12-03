<template>
    <section class="h-100 gradient-custom">
        <div class="container py-5">
            <div class="row d-flex  my-4">
                <div class="col-md-9">
                    <div class="card mb-4">
                        <div class="card-header py-3">
                            <h5 class="mb-0">Cart - {{ countCart() }} items</h5>
                        </div>
                        <div class="card-body" :key="carts.cart_id" v-for="carts in carts">
                            <div class="col-lg-1 col-md-12 mb-4 mb-lg-0">
                                <!-- Checkbox -->
                                <input type="checkbox" :id="'checkbox_' + carts.cart_id" v-model="checkedItems"
                                    :value="carts.cart_id" @click="check(carts.cart_id)">
                                <!-- Checkbox -->
                            </div>
                            <!-- Single item -->
                            <div class="row">
                                <div class="col-lg-3 col-md-12 mb-2 mb-lg-0">
                                    <!-- Image -->
                                    <div class="bg-image hover-overlay hover-zoom ripple rounded"
                                        data-mdb-ripple-color="light">
                                        <img :src="require('@/assets/img/' + getItem(carts).img_path)" class="img-fluid"
                                            alt="Image description" style="max-width: 50%; height: 50%;" />
                                        <a href="#!">
                                            <div class="mask" style="background-color: rgba(251, 251, 251, 0.2)">
                                            </div>
                                        </a>
                                    </div>
                                    <!-- Image -->
                                </div>

                                <div class="col-lg-5 col-md-6 mb-2 mb-lg-0">
                                    <!-- Data -->
                                    <p><strong>{{ getItem(carts).name }}</strong></p>
                                    <p>Category: {{ getCategory(getItem(carts)).name }}</p>
                                    <button type="button" class="btn btn-primary btn-sm me-1 mb-2" data-mdb-toggle="tooltip"
                                        title="Remove item">
                                        <i class="fas fa-trash"></i>
                                    </button>
                                    <button type="button" class="btn btn-danger btn-sm mb-2" data-mdb-toggle="tooltip"
                                        title="Move to the wish list">
                                        <i class="fas fa-heart"></i>
                                    </button>
                                    <!-- Data -->
                                </div>

                                <div class="col-lg-4 col-md-6 mb-2 mb-lg-0">
                                    <!-- Quantity -->
                                    <div class="d-flex mb-4" style="max-width: 300px">
                                        <button class="btn btn-primary px-3 me-2"
                                            @click="decQuantity(getItem(carts).item_id)">
                                            <i class="fas fa-minus"></i>
                                        </button>

                                        <div class="form-outline">
                                            <input disabled id="form1" min="0" name="quantity" :value="carts.quantity"
                                                type="number" class="form-control" />
                                        </div>

                                        <button class="btn btn-primary px-3 ms-2"
                                            @click="addQuantity(getItem(carts).item_id)">
                                            <i class="fas fa-plus"></i>
                                        </button>

                                    </div>
                                    <!-- Quantity -->

                                    <!-- Price -->
                                    <p class="text-start text-md-center">
                                        <strong>₱ {{ getTotal(carts) }}</strong>
                                    </p>
                                    <!-- Price -->
                                </div>
                            </div>
                            <!-- Single item -->

                            <hr class="my-2" />

                        </div>
                    </div>

                    <div class="col-md-3 footer me-3">
                        <div class="card">
                            <div class="card-header py-2">
                                <h5 class="mb-0">Summary</h5>
                            </div>
                            <div class="card-body">
                                <ul class="list-group list-group-flush">
                                    <li
                                        class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 pb-0">
                                        <span class="text-nowrap">Products</span>
                                        <span>{{ countCheck() }}</span>
                                    </li>
                                    <hr class="my-2" />

                                    <li
                                        class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 mb-2">
                                        <div>
                                            <strong>Total amount</strong>
                                            <strong>
                                                <p class="mb-0 text-break">(including VAT 12%) </p>
                                            </strong>
                                        </div>
                                        <span class="text-nowrap"><strong>₱ {{ (Number(TotalAmount()) +
                                            Number(TotalAmount() * 0.12)).toFixed(2) }}</strong></span>
                                    </li>
                                </ul>
                                <hr class="border border-primary border-2 opacity-75 mt-2">

                                <button type="button" @click="openModal" class="btn btn-primary mt-3 float-end">
                                    Go to checkout
                                </button>
                                <div class="mb-2 mb-lg-0">
                                    <div class="card-body d-flex align-items-center">
                                        <p class="mb-0 me-2 text-xs"><strong>We accept</strong></p>

                                        <!-- Cash Icon -->
                                        <i class="fas fa-money-bill me-1 text-dark text-xs"></i>

                                        <!-- Card Icons -->
                                        <i class="fas fa-credit-card me-1 text-primary text-xs"></i>

                                        <!-- GCash Icon -->
                                        <i class="fas fa-mobile-alt me-1 text-success text-xs"></i>

                                        <!-- PayMaya Icon -->
                                        <i class="fas fa-wallet me-1 text-muted text-xs"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <hr class="my-4 bg-secondary">
                </div>
            </div>
        </div>

    </section>
    <ReusableModal :show="isModalOpen" @close="closeModal" :selectedOption="selectedOption">
        <div class="row">
            <!-- Dine-In -->
            <div class="col-12 col-md-4">
                <div class="card mb-3 card-hover" @click="selectOption('dinein')">
                    <div class="card-body" :class="{ 'selected': selectedOption === 'dinein' }">
                        <h5 class="card-title text-center">Dine-in</h5>
                        <p class="card-text text-center">Cozy ambiance,<br>delightful experience.</p>
                    </div>
                </div>
            </div>

            <!-- Takeout -->
            <div class="col-12 col-md-4">
                <div class="card mb-3 card-hover" @click="selectOption('takeout')">
                    <div class="card-body" :class="{ 'selected': selectedOption === 'takeout' }">
                        <h5 class="card-title text-center">Takeout</h5>
                        <p class="card-text text-center">Gourmet at home,<br>fresh and <br>flavorful.</p>
                    </div>
                </div>
            </div>

            <!-- Delivery -->
            <div class="col-12 col-md-4">
                <div class="card mb-3 card-hover" @click="selectOption('delivery')">
                    <div class="card-body" :class="{ 'selected': selectedOption === 'delivery' }">
                        <h5 class="card-title text-center">Delivery</h5>
                        <p class="card-text text-center">Diverse menu at your <br>doorstep.</p>
                    </div>
                </div>
            </div>

        </div>
        <input class="form-control p-2 fs-6 mb-2" v-if="selectedOption === 'delivery'" v-model="address"
            placeholder="Enter your address" />
        <input class="form-control p-2 fs-6 mb-2" v-model="details" placeholder="Message" />
        <!-- <div class="input-group mb-3">
            <input class="form-control p-2 fs-6" v-model="discount" placeholder="Voucher Code" />
            <button class="btn btn-outline-primary" @click="applyDiscount">Apply</button>
        </div> -->
        <button class="btn btn-primary mt-2" @click="checkout">Checkout</button>

    </ReusableModal>
    

    <Notification ref="notification" />
</template>
<style >
.footer {
    position: fixed;
    bottom: 0;
    right: 0;
}

.card-hover:hover {
    background-color: #f8f9fa;
    cursor: pointer;
}

.selected {
    background-color: rgba(70, 177, 128, 0.1);
}

@media (max-width: 575.98px) {
    .footer {
        position: fixed;
        bottom: 0;
        left: 0;
        right: 0;
        z-index: 1000;
        height: 15rem;
    }

    .card-body {
        font-size: 0.8rem;
    }

    .btn {
        font-size: 0.9rem;
        margin-bottom: 5px;
    }

    .text-sm {
        font-size: 0.6rem;
    }
}

@media (max-width: 767px) {
    .invoice-container {
        max-width: 90%;
        max-height: 70vh;
        /* Adjust the max-height as needed */
        overflow-y: auto;
        max-height: 600px;
        font-size: 0.8rem;
    }

    .btn {
        font-size: 0.8rem;
    }
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
            carts: [],
            items: [],
            categories: [],
            checkedItems: [],
            isModalOpen: false,
            isInvOpen: false,
            selectedOption: '',
            address: '',
            details: '',
            invoices: [],
            invoice_id: null,
        };
    },
    mounted() {
        this.fetchData();
    },

    methods: {
        async fetchData() {
            const user_id = sessionStorage.getItem("user_id");

            try {
                const [cart, menu, category] = await Promise.all([
                    axios.get(`/getCart/${user_id}`),
                    axios.get("/getMenu"),
                    axios.get("/getCategory")
                ]);

                this.carts = cart.data;
                this.items = menu.data;
                this.categories = category.data;
            } catch (error) {
                console.error('Error fetching data:', error);
            }
        },

        async getInvoice(invoice_id) {
            try {
                const response = await axios.get(`/getInvoice/${invoice_id}`);
                this.invoices = response.data;
            } catch (error) {
                console.error('Error fetching invoice:', error);
            }
        },
        getItem(cart) {
            return this.items.find(item => item.item_id === cart.item_id) || {};
        },
        getCategory(item) {
            return this.categories.find(category => category.category_id === item.category_id) || {};
        },
        getTotal(cart) {
            const item = this.getItem(cart);
            const total = (item.price || 0) * cart.quantity;

            return parseFloat(total.toFixed(2));
        },

        addQuantity(item_id) {
            const user_id = sessionStorage.getItem("user_id");

            axios.post('/addQuantity', { user_id, item_id })
                .then(response => {
                    console.log(response.data.message);

                    this.fetchData();
                })
                .catch(error => {
                    console.error('Error updating quantity:', error);
                    this.$refs.notification.error(error.response.data.message, 'error');
                });
        },
        decQuantity(item_id) {
            const user_id = sessionStorage.getItem("user_id");

            axios.post('/decQuantity', { user_id, item_id })
                .then(response => {
                    console.log(response.data.message);

                    this.fetchData();
                })
                .catch(error => {
                    this.$refs.notification.error(error.response.data.message, 'error');
                });
        },
        countCart() {
            return this.carts.length;
        },
        countCheck() {
            return this.checkedItems.length;
        },
        check(cartId) {
            const index = this.checkedItems.indexOf(cartId);

            if (index === -1) {
                this.checkedItems.push(cartId);
            } else {
                this.checkedItems.splice(index, 1);
            }
            console.log('Checked Items:', this.checkedItems);
        },

        TotalAmount() {
            let totalAmount = 0;
            this.checkedItems.forEach(cartId => {
                const cart = this.carts.find(cart => cart.cart_id === cartId);
                if (cart) {
                    totalAmount += this.getTotal(cart);
                }
            });
            return parseFloat(totalAmount.toFixed(2));
        },
        openModal() {
            if (this.checkedItems.length === 0) {
                this.$refs.notification.error('Please select at least one item before proceeding to checkout.', 'error');
                return;
            }
            this.isModalOpen = true;
        },
        closeModal() {
            this.isModalOpen = false;
            this.address = ''
        },
        openInv() {
            this.isInvOpen = true;
        },
        closeInv() {
            this.isInvOpen = false;
        },
        selectOption(option) {
            this.selectedOption = option;
            console.log(this.selectedOption);
        },
        async checkout() {
            const confirmed = window.confirm('Are you sure you want to proceed with the checkout? This action cannot be undone.');
            if (confirmed) {
                try {
                    if (!this.selectedOption) {
                        this.$refs.notification.error('Please select an order type.', 'error');
                        return;
                    }
                    const user_id = sessionStorage.getItem("user_id");

                    const orderItems = this.checkedItems.map(cartId => {
                        const cart = this.carts.find(cart => cart.cart_id === cartId);
                        const item_id = cart ? cart.item_id : null;

                        return {
                            item_id: item_id,
                            quantity: cart ? cart.quantity : 0,
                            total_price: this.getTotal(cart),
                        };
                    });

                    const orderData = {
                        user_id: user_id,
                        order_type: this.selectedOption,
                        delivery_address: this.address,
                        order_details: this.details,
                        status: 'pending',
                        total_amount: this.TotalAmount(),
                        items: orderItems,
                    };

                    const response = await axios.post('checkout', orderData);

                    console.log('Checkout Response:', response);
                    this.invoice_id = response.data.invoice_id;
                    console.log('Invoice ID:', this.invoice_id);
                    this.checkedItems = [];
                    this.closeModal();
                    const inv = await axios.post(`getInvoice/${this.invoice_id}`);

                    setTimeout(() => {
                        this.$refs.notification.open(response.data.message, 'success');
                        this.$router.push({ name: 'invoice', params: { invoice_id: this.invoice_id } });

                    }, 0);
                } catch (error) {
                    console.error('Checkout Error:', error);
                    this.$refs.notification.error(error.response.data.message, 'error');
                }
            }
        }
    }
};
</script>