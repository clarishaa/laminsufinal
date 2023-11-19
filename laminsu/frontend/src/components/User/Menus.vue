<template>
    <!-- Menu Start -->
    <div class="container-xxl py-5">
        <div class="container">
            <div class="text-center mx-auto wow fadeInUp" data-wow-delay="0.1s" style="max-width: 500px;">
                <p class="fs-5 fw-bold text-primary">Our Menu</p>
                <h1 class="display-5 mb-5">Explore Our Delicious Menu</h1>
            </div>
            <div class="row wow fadeInUp" data-wow-delay="0.3s">
                <div class="col-12 text-center">
                    <ul class="list-inline rounded mb-5" id="portfolio-flters">
                        <li class="mx-2 active" data-filter="*">All</li>
                        <li v-for="categories in categories" class="mx-2" :data-filter="'.' + categories.category_id">
                            {{ categories.name }}</li>
                    </ul>
                </div>
            </div>
            <div class="row g-4 portfolio-container">
                <div :key="menus.id" v-for="menu in menus"
                    :class="'col-lg-2 col-md-3 col-sm-4 col-6 wow fadeInUp shadow rounded overflow-hidden m-3 ' + 'portfolio-item ' + menu.category_id"
                    data-wow-delay="0.1s">
                    <div class="portfolio-wrapper">
                        <div class="portfolio-inner rounded">
                            <!-- Image -->
                            <img class="img-fluid menu" style="width: 100%; max-width: 200px; height: 200px;"
                                :src="require('@/assets/img/' + menu.img_path)" alt="" />

                            <!-- Description -->
                            <div class="portfolio-text">
                                <div class="d-flex">
                                    <!-- View Button -->
                                    <a class="btn btn-lg-square rounded-circle mx-2">
                                        <i class="fa fa-eye"></i>
                                    </a>

                                    <!-- Add to Cart Button -->
                                    <button class="btn btn-lg-square rounded-circle mx-2" @click="addCart(menu.item_id)">
                                        <i class="fa fa-shopping-cart"></i>
                                    </button>
                                </div>

                            </div>
                        </div>


                    </div>
                    <!-- Additional Details -->
                    <div class="mt-2">
                        <h6 class="mb-0 text-dark text-center">{{ menu.name }}</h6>
                        <p class="mb-0 text-dark text-center">₱ {{ menu.price }}</p>
                    </div>
                    <div class="d-flex flex-column mb-1 align-items-center justify-content-center bottom-0">
                        <div class="d-flex mb-3">
                            <div>
                                <small class="fa fa-star text-primary"></small>
                                <small class="fa fa-star text-primary"></small>
                                <small class="fa fa-star text-primary"></small>
                                <small class="fa fa-star text-primary"></small>
                                <small class="fa fa-star text-primary"></small>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <Notification ref="notification" />
    </div>
    <!-- Menu End -->
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
            menus: [], categories: [],
        }
    },
    mounted() {
        this.getMenu();
        this.getCategory();

    },
    methods: {
        async getMenu() {
            const menu = await axios.get("getMenu");
            this.menus = menu.data;
        },
        async getCategory() {
            const category = await axios.get("getCategory");
            this.categories = category.data;
        },
        async addCart(item_id) {
            try {
                const user_id = sessionStorage.getItem("user_id");
                const response = await axios.post("addCart", { item_id: item_id, user_id: user_id });
                this.$refs.notification.open(response.data.message, 'success');


            } catch (error) {
                this.$refs.notification.error(error.response.data.message, 'error');
            }
        },
    }
}
</script>