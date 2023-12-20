<template>
    <section class="section-content padding-y-sm bg-default" style="margin-top: 6rem;">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-8 card padding-y-sm card">
                    <ul class="nav bg radius nav-pills nav-fill mb-3 bg filters_menu" role="tablist">
                        <li class="nav-item" @click="selectCategory(null)">
                            <a class="nav-link" data-toggle="pill" :class="{ 'active': selectedCategory === null }">
                                <i class="fa fa-tags"></i> All
                            </a>
                        </li>
                        <!-- Category Loop Placeholder -->
                        <li class="nav-item" v-for="cat in categories" :key="cat.category_id"
                            @click="selectCategory(cat.category_id)">
                            <a class="nav-link" data-toggle="pill"
                                :class="{ 'active': selectedCategory === cat.category_id }">
                                <i class="fa fa-cutlery"></i> {{ cat.name }}
                            </a>
                        </li>
                    </ul>
                    <span id="items">
                        <div class="row filters-content" style="max-height: 500px; overflow-y: auto;">
                            <!-- Menu Item Loop Placeholder -->
                            <div class="col-md-3 all menu" v-for="menu in filteredMenus" :key="menu.menu_id">
                                <figure class="card card-product"
                                    style="height: 230px; border: 1px solid #ccc; border-radius: 10px; overflow: hidden; position: relative;">
                                    <div class="img-wrap" style="height: 70%;">
                                        <img :src="require('@/assets/img/' + menu.img_path)" alt="menu.name"
                                            class="img-fluid" style="object-fit: cover; width: 100%; height: 100%;">
                                    </div>
                                    <figcaption class="info-wrap"
                                        style="height: 30%; background-color: #f8f9fa; padding: 10px;">
                                        <div class="row h-100">
                                            <div class="col-md-12">
                                                <a href="#" class="title mb-2" style="font-size: 14px;">{{ menu.name }}</a>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="action-wrap text-end">
                                                    <input type="hidden" name="item" value="item_id">
                                                    <button class="btn btn-primary btn-sm" @click="addCart(menu.item_id)">
                                                        <i class="fa fa-cart-plus"></i>
                                                    </button>
                                                    <div class="price-wrap h5">
                                                        <span class="price"></span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </figcaption>
                                </figure>
                            </div>
                        </div>
                    </span>
                </div>

                <div class="col-md-4">
                    <div class="card">
                        <div id="cart" class="p-3">
                            <div class="cart-table-container" style="max-height: 250px; overflow-y: auto;">

                                <!-- Shopping cart table -->
                                <table class="table table-hover shopping-cart-wrap">
                                    <!-- Table header -->
                                    <thead class="text-muted">
                                        <tr>
                                            <th scope="col" style="width: 120px;">Item</th>
                                            <th scope="col" style="width: 120px;">Qty</th>
                                            <th scope="col" style="width: 200px;">Price</th>
                                            <!-- Increase the width for the Price column -->
                                            <th scope="col" class="text-end" style="width: 120px;">Delete</th>
                                        </tr>
                                    </thead>

                                    <!-- Table body -->
                                    <tbody>
                                        <!-- Cart Item Loop Placeholder -->
                                        <tr v-for="cart in carts" :key="cart.cart_id">
                                            <td>
                                                <div class="media">
                                                    <div class="img-wrap">
                                                        <img :src="require('@/assets/img/' + cart.img_path)" class="img-xs"
                                                            alt="" style="width: 75px; height: 75px;">
                                                    </div>
                                                    <div class="media-body" style="margin-top: 5px;">
                                                        <h6 class="title text-truncate">{{ cart.item_name }}</h6>
                                                    </div>
                                                </div>
                                            </td>
                                            <td class="text-center">
                                                <div class="btn-group" role="group" aria-label="Quantity Control">
                                                    <button type="button" class="btn btn-outline-secondary"
                                                        @click="decQuantity(cart.item_id)">
                                                        <i class="fa fa-minus"></i>
                                                    </button>
                                                    <button type="button" class="btn btn-outline-secondary" disabled>
                                                        {{ cart.cart_quantity }}
                                                    </button>
                                                    <button type="button" class="btn btn-outline-secondary"
                                                        @click="addQuantity(cart.item_id)">
                                                        <i class="fa fa-plus"></i>
                                                    </button>
                                                </div>

                                            </td>

                                            <td>
                                                <div class="price-wrap">
                                                    <span class="price" data-price="item_price">
                                                        ₱ {{ (cart.price * cart.cart_quantity).toLocaleString('en-US') }}
                                                    </span>
                                                </div>


                                            </td>
                                            <td class="text-end">
                                                <div class="btn-group" role="group" aria-label="Delete">
                                                    <a @click="deleteItem(cart.cart_id)" class="btn btn-outline-danger">
                                                        <i class="fa fa-trash"></i>
                                                    </a>
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <!-- Totals and buttons -->
                            </div>

                            <div class="box m-3">
                                <dl class="dlist-align">
                                    <dt class="fw-bold">Sub Total:</dt>
                                    <dd class="text-end"><span>₱ {{ subtotal.toLocaleString('en-US') }}</span></dd>
                                </dl>

                                <dl class="dlist-align">
                                    <dt class="fw-bold">Tax (12%):</dt>
                                    <dd class="text-end"><span>₱ {{ tax.toLocaleString('en-US') }}</span></dd>
                                </dl>

                                <dl class="dlist-align">
                                    <dt class="fw-bold">Total:</dt>
                                    <dd class="text-end"><span>₱ {{ total.toLocaleString('en-US') }}</span></dd>
                                </dl>
                                <form action="/posdel" method="post">
                                    <!-- Cart IDs Loop Placeholder -->
                                    <input type="hidden" name="cart_ids[]" value="cart_id">
                                    <div class="row">
                                        <div class="col-md-12 text-center">
                                            <button @click="cancelOrder"
                                                class="btn btn-danger btn-lg btn-block mx-auto w-50">
                                                <i class="fa fa-times-circle"></i> Cancel
                                            </button>
                                            <button @click="openModal" type="button"
                                                class="btn btn-primary btn-lg btn-block mx-auto w-50" data-toggle="modal"
                                                data-target="#myModal">
                                                <i class="fa fa-shopping-bag"></i> Charge
                                            </button>
                                        </div>
                                    </div>
                                </form>

                            </div> <!-- box -->
                        </div>

                        <!-- Payment Form -->
                        <form @submit.prevent="submitForm">
                            <div class="input-group mt-2">
                                <input type="text" class="form-control" v-model="invoice_id" id="qrCodeInput"
                                    placeholder="Scan QR or enter invoice number." />
                                <button type="submit" class="btn btn-primary me-1">Submit</button>
                            </div>
                        </form>
                        <video id="qrCodeScanner" style="display: none;" class="col-10"></video>
                    </div>
                </div>
            </div>
        </div><!-- container //  -->
    </section>
    <div class="modal" id="myModal" ref="myModal">
        <div class="modal-dialog receipt-modal">
            <div class="modal-content">
                <form @submit.prevent="pay">
                    <div id="rec">
                        <div class="modal-header">
                            <h4 class="modal-title">Receipt No: {{ receiptNumber }}</h4>
                        </div>

                        <div class="modal-body">
                            <input type="hidden" name="receipt_number" v-model="receiptNumber">

                            <div class="row">
                                <div class="col-md-12 text-center">
                                    <h5>
                                        <img :src="require('@/assets/logo.png')" alt="La Minsu Logo"
                                            style="max-width: 10%; height: auto;">
                                        <strong>La Minsu</strong>
                                    </h5>
                                    <p>Masipit, Calapan City | Contact: (123) 456-7890</p>
                                </div>
                            </div>

                            <hr>
                            <div class="row">
                                <div class="col-md-12">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>Product</th>
                                                <th class="text-right">Quantity</th>
                                                <th class="text-right">Unit Price</th>
                                            </tr>
                                        </thead>
                                        <tbody v-for="cart in carts" :key="cart.cart_id">
                                            <tr>
                                                <td><strong>{{ cart.item_name }}</strong></td>
                                                <td class="text-right">{{ cart.cart_quantity }}</td>
                                                <td class="text-right">₱ {{ (cart.price *
                                                    cart.cart_quantity).toLocaleString('en-US') }}
                                                </td>
                                            </tr>
                                            <input type="hidden" name="cart_ids[]">
                                        </tbody>
                                    </table>
                                </div>
                            </div>

                            <hr>

                            <div class="row text-end">
                                <div class="col-md-12">
                                    <p><strong>Tax (12%):</strong>₱ {{ tax.toLocaleString('en-US') }}</p>
                                    <p><strong>Sub Total:</strong>₱ {{ subtotal.toLocaleString('en-US') }}</p>
                                    <p><strong>Total:</strong>₱ {{ total.toLocaleString('en-US') }}</p>
                                    <input type="hidden" name="receipt_number" v-model="receiptNumber">
                                    <input type="hidden" name="total" v-model="total">
                                </div>
                            </div>

                        </div>
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Pay</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <Notification ref="notification" />
</template>

<script>
import Notification from '@/components/Notification.vue';
import axios from 'axios'
export default {
    name: 'Menus',
    components: {
        Notification
    },
    data() {
        return {
            menus: [], categories: [], selectedCategory: null, carts: [], subtotal: 0,
            taxRate: 0.12,
            tax: 0,
            total: '',
            showModal: false,
            receiptNumber: '',
            cartIds: '',
            invoice_id: ''
        }
    },
    mounted() {
        this.getMenu();
        this.getCart();
        this.generateReceipt();

    },
    computed: {
        filteredMenus() {
            if (this.selectedCategory === null) {
                return this.menus;
            } else {
                return this.menus.filter(menu => menu.category_id === this.selectedCategory);
            }
        }
    },
    watch: {
        carts: {
            handler() {
                this.calculateTotals();
            },
            deep: true,
        },
    },
    methods: {
        async getMenu() {
            const response = await axios.get("pos");
            this.menus = response.data.menu;
            this.categories = response.data.categories;
        },
        async getCart() {
            const user_id = sessionStorage.getItem("user_id");
            const cart = await axios.get(`/getPos/${user_id}`);
            this.carts = cart.data;
        },
        async addCart(item_id) {
            try {
                const user_id = sessionStorage.getItem("user_id");
                const response = await axios.post("addCart", { item_id: item_id, user_id: user_id });
                this.$refs.notification.open(response.data.message);
                this.getCart();

            } catch (error) {
                this.$refs.notification.error(error.response.data.message, 'error');
            }
        },
        selectCategory(categoryId) {
            this.selectedCategory = categoryId;
        },

        addQuantity(item_id) {
            const user_id = sessionStorage.getItem("user_id");

            axios.post('/addQuantity', { user_id, item_id })
                .then(response => {
                    this.getCart();
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
                    this.getCart();
                })
                .catch(error => {
                    this.$refs.notification.error(error.response.data.message, 'error');
                });
        },
        async deleteItem(itemId) {
            await axios.delete(`/deleteCart/${itemId}`);
            this.$refs.notification.open("Deleted successfully.", 'success');
            this.getCart();

        },
        calculateTotals() {
            this.subtotal = this.carts.reduce((sum, item) => {
                return sum + item.cart_quantity * item.price;
            }, 0);

            this.tax = this.subtotal * this.taxRate;
            this.total = this.subtotal + this.tax;
        },
        openModal() {
            $(this.$refs.myModal).modal('show');
        },
        generateReceipt() {
            const currentDate = new Date();
            const formattedDate = currentDate.toISOString().replace(/[-:T]/g, '').substring(0, 14);
            this.receiptNumber = 'LMCC' + formattedDate;
        },
        async pay() {
            const user_id = sessionStorage.getItem("user_id");

            const orderItems = this.carts.map(cart => ({
                item_id: cart.item_id,
                quantity: cart.cart_quantity,
                total_price: cart.price * cart.cart_quantity,
            }));

            const orderData = {
                user_id: user_id,
                order_type: '',
                delivery_address: '',
                order_details: '',
                status: 'pending',
                total_amount: this.total,
                items: orderItems,
            };

            console.log(orderData);

            try {
                const response = await axios.post('pay', orderData);
                console.log(response.data);
                if (response.data.message === 'Checkout successful') {
                    this.$refs.notification.open('Payment Successful.');
                    $(this.$refs.myModal).modal('hide');
                } else {

                    console.error('Payment failed:', response.data.message);
                }
                this.getCart();
            } catch (error) {
                console.error(error);
            }
        },

        async submitForm() {
            try {
                const response = await axios.post('/payment', {
                    invoice_id: this.invoice_id,
                });

                console.log('Payment response:', response.data);
                this.$refs.notification.open("Payment Successful.", 'success');
            } catch (error) {
                console.error('Error submitting payment:', error);
            }

            console.log('Invoice ID submitted:', this.invoice_id);
        },
        async cancelOrder() {
            try {
                const response = await axios.post('cancelOrder');

            } catch (error) {
                console.error(error);
            }
        },
    }
}
</script>

