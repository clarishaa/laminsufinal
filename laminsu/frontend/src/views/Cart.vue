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
                                <div class="col-lg-3 col-md-12 mb-4 mb-lg-0">
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

                                <div class="col-lg-5 col-md-6 mb-4 mb-lg-0">
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

                                <div class="col-lg-4 col-md-6 mb-4 mb-lg-0">
                                    <!-- Quantity -->
                                    <div class="d-flex mb-4" style="max-width: 300px">
                                        <button class="btn btn-primary px-3 me-2"
                                            @click="decQuantity(getItem(carts).item_id)">
                                            <i class="fas fa-minus"></i>
                                        </button>

                                        <div class="form-outline">
                                            <input id="form1" min="0" name="quantity" :value="carts.quantity" type="number"
                                                class="form-control" />
                                            <label class="form-label" for="form1">Quantity</label>
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

                            <hr class="my-4" />

                        </div>
                        <div class="card mb-4">
                            <div class="card-body">
                                <p><strong>Expected shipping delivery</strong></p>
                                <p class="mb-0">12.10.2020 - 14.10.2020</p>
                            </div>
                        </div>
                        <div class="card mb-4 mb-lg-0">
                            <div class="card-body">
                                <p><strong>We accept</strong></p>

                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 footer">
                        <div class="card">
                            <div class="card-header py-3">
                                <h5 class="mb-0">Summary</h5>
                            </div>
                            <div class="card-body">
                                <ul class="list-group list-group-flush">
                                    <li
                                        class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 pb-0">
                                        <span class="text-nowrap">Products</span>
                                        <span>{{ countCheck() }}</span>
                                    </li>
                                    <hr class="my-4" />

                                    <li
                                        class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 mb-3">
                                        <div>
                                            <strong>Total amount</strong>
                                            <strong>
                                                <p class="mb-0 text-break">(including VAT)</p>
                                            </strong>
                                        </div>
                                        <span class="text-nowrap"><strong>₱ {{ TotalAmount() }}</strong></span>
                                    </li>
                                </ul>

                                <button type="button" class="btn btn-primary btn-lg btn-block float-end">
                                    Go to checkout
                                </button>
                            </div>
                        </div>
                    </div>


                </div>
            </div>
        </div>
    </section>
</template>
<style scoped>
.footer {
    position: fixed;
    bottom: 0;
    right: 0;
}
</style>
<script>
import axios from 'axios';

export default {
    data() {
        return {
            carts: [],
            items: [],
            categories: [],
            checkedItems: []
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

        getItem(cart) {
            return this.items.find(item => item.item_id === cart.item_id) || {};
        },
        getCategory(item) {
            return this.categories.find(category => category.category_id === item.category_id) || {};
        },
        getTotal(cart) {
            const item = this.getItem(cart);
            const total = (item.price || 0) * cart.quantity;

            // Use toFixed to round to two decimal places
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
                    console.error('Error updating quantity:', error);
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
    },
};
</script>