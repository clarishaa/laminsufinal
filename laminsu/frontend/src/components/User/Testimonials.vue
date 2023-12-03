<template>
    <!-- Testimonial Start -->
    <div class="container-xxl py-5">
        <div class="container">
            <div class="row g-5">
                <div class="col-lg-5 wow fadeInUp" data-wow-delay="0.1s">
                    <p class="fs-5 fw-bold text-primary">Customer Reviews</p>
                    <h1 class="display-5 mb-5">What Our Guests Say About Us!</h1>
                    <p class="mb-4">Our customers have shared their thoughts about their experience at our restaurant and
                        bar. We take pride in providing an exceptional dining and entertainment experience for our guests.
                    </p>
                    <a class="btn btn-primary py-3 px-4" @click="openModal">Add Review</a>
                    <ReusableModal :show="isModalOpen" @close="closeModal">
                        <div class="modal-content p-4">
                            <!-- Custom content for the modal -->
                            <h2 class="h4 mb-4">Share Your Experience</h2>

                            <!-- Testimonial Form -->
                            <form @submit.prevent="testimonials">
                                <!-- Testimonial Input -->
                                <div class="mb-3">
                                    <h6 class="form-label">{{ greeting }}</h6>
                                    <textarea class="form-control" rows="4" v-model="testimonial" required></textarea>
                                </div>
                                <!-- Submit and Clear Buttons -->
                                <div class="d-flex justify-content-end">
                                    <button type="reset" class="btn btn-danger btn-sm me-2">
                                        Clear Form
                                    </button>
                                    <button type="submit" class="btn btn-primary btn-sm me-2">
                                        Submit Testimonial
                                    </button>
                                </div>
                            </form>
                        </div>
                    </ReusableModal>
                </div>
                <div class="col-lg-7 wow fadeInUp" data-wow-delay="0.5s">
                    <div class="owl-carousel testimonial-carousel">
                        <div class="testimonial-item" v-for="reviews in reviews">
                            <img class="img-fluid rounded mb-3" src="@/assets/img/testimonial-1.jpg" alt="">
                            <p class="fs-5">{{ reviews.content }}</p>
                            <h4>{{ getUser(reviews).first_name }} {{ getUser(reviews).last_name }} </h4>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Testimonial End -->
    <Resources v-if="dataLoaded" />
    <Notification ref="notification" />
</template>
<script>
import Notification from '@/components/Notification.vue';
import ReusableModal from '@/components/User/Modal.vue';
import axios from 'axios';
import Resources from '@/components/User/Resources.vue'

export default {
    components: {
        ReusableModal, Notification, Resources
    },
    data() {
        return {
            isModalOpen: false,
            user: [],
            reviews: [],
            testimonial: '',
            dataLoaded: false,
        };
    },
    mounted() {
        this.fetchData();
    },
    computed: {
        greeting() {
            const customerName = this.user.length > 0 ? this.user[0].first_name : "Customer";
            return `Hey, ${customerName}! How was your experience with us?`;
        },
    },
    methods: {

        async fetchData() {
            const user_id = sessionStorage.getItem("user_id");

            try {
                const [user, testimonials] = await Promise.all([
                    axios.get("/getData"),
                    axios.get("/getTestimonial")
                ]);

                this.users = user.data;
                this.reviews = testimonials.data;
                this.dataLoaded = true;

                console.log('Data fetched successfully');
            } catch (error) {
                console.error('Error fetching data:', error);
            }
        },
        getUser(reviews) {
            return this.users.find(user => user.user_id === reviews.user_id) || {};
        },


        openModal() {
            this.isModalOpen = true;
        },
        closeModal() {
            this.isModalOpen = false;
        },
        async testimonials() {
            try {
                const user_id = sessionStorage.getItem("user_id");
                const response = await axios.post("addTestimonial", { testimonial: this.testimonial, user_id: user_id });
                this.$refs.notification.open(response.data.message, 'success');
                this.closeModal();
            } catch (error) {
                this.$refs.notification.error(error.response.data.message, 'error');
            }
        },
    },
};
</script>


