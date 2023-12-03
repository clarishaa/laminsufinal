<template>
    <!-- Booking Start -->
    <div class="container-fluid quote my-5 py-5" data-parallax="scroll"
        :data-image-src="require('@/assets/img/carousel-2.jpg/')">
        <div class="container py-5">
            <div class="row justify-content-center">
                <div class="col-lg-7">
                    <div class="bg-white rounded p-4 p-sm-5 wow fadeIn" data-wow-delay="0.5s">
                        <h2 class="text-center mb-4">{{ greeting }}</h2>
                        <div class="row g-3 text-center">
                            <p class="lead">{{ quote }}</p>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
    <!-- Booking End -->
</template>
<script>
import axios from 'axios';

export default {
    data() {
        return {
            user: [],
        };
    },
    mounted() {
        this.getData();
    },
    computed: {
        greeting() {
            const user_id = sessionStorage.getItem("user_id");
            const currentUser = this.user.find(user => user.user_id === user_id);
            const customerName = currentUser ? currentUser.first_name : "Customer";
            return `Greetings, ${customerName}!`;
            
        },

        quote() {
            const quotes = [
                "Savor the moment with our exquisite dishes.",
                "Let your taste buds dance with our culinary creations.",
                "Every dish is a story waiting to be told.",
                "Enjoy a gastronomic journey with us.",
                "A world of flavors awaits your palate.",
            ];

            const randomIndex = Math.floor(Math.random() * quotes.length);
            return quotes[randomIndex];
        }
    },
    methods: {
        async getData() {
            try {
                const response = await axios.get("getData");
                this.user = response.data;
            } catch (error) {
                console.error('Error fetching user data:', error);
            }
        },
    },
};
</script>
