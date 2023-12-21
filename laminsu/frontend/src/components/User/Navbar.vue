<template>
    <!-- Navbar Start -->
    <nav class="navbar navbar-expand-lg bg-white navbar-light sticky-top p-0">
        <a href="/" class="navbar-brand d-flex align-items-center px-4 px-lg-5">
            <h1 class="m-0">La MinSU</h1>
        </a>
        <button type="button" class="navbar-toggler me-4" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <div class="navbar-nav ms-auto p-4 p-lg-0">
                <router-link to="/" class="nav-item nav-link" :class="{ 'active': isRouteActive('/') }">Home</router-link>
                <router-link to="/about" class="nav-item nav-link"
                    :class="{ 'active': isRouteActive('/about') }">About</router-link>
                <router-link to="/services" class="nav-item nav-link"
                    :class="{ 'active': isRouteActive('/services') }">Services</router-link>
                <router-link to="/menu" class="nav-item nav-link"
                    :class="{ 'active': isRouteActive('/menu') }">Menu</router-link>
                <router-link to="/booking" class="nav-item nav-link" :class="{ 'active': isRouteActive('/booking') }">Book a
                    Table</router-link>
                <router-link to="/team" class="nav-item nav-link" :class="{ 'active': isRouteActive('/team') }">Our
                    Team</router-link>
                <router-link to="/testimonials" class="nav-item nav-link"
                    :class="{ 'active': isRouteActive('/testimonials') }">Testimonials</router-link>
                <router-link to="/contact" class="nav-item nav-link"
                    :class="{ 'active': isRouteActive('/contact') }">Contact</router-link>
            </div>
            <div class="nav-item dropdown">
                <a href="#" class="nav-link dropdown-toggle fs-6" data-bs-toggle="dropdown">
                    <i class="fas fa-bell"></i>
                    <span class="badge rounded-pill badge-notification bg-danger small-badge">{{ notifications.length
                    }}</span>
                </a>
                <div class="dropdown-menu bg-light m-0">
                    <template v-if="notifications.length">
                        <div v-for="(notification, index) in notifications" :key="index">
                            <a class="dropdown-item" :href="notification.link">{{ notification.message }}</a>
                        </div>
                    </template>
                    <template v-else>
                        <p class="dropdown-item">No new notifications</p>
                    </template>
                </div>
            </div>

            <div class="nav-item dropdown">
                <a href="#" class="nav-link dropdown-toggle fs-6" data-bs-toggle="dropdown"><i class="fas fa-user fa-fw"
                        style="color: forestgreen;"></i></a>
                <div class="dropdown-menu bg-light m-0">
                    <button @click="logout" class="btn logout-logo-btn">
                        <i class="fas fa-power-off logout-icon"></i>
                        Logout
                    </button>
                </div>
            </div>
            <a href="/cart" class="btn btn-primary py-4 px-lg-4 rounded-0 d-none d-lg-block">Go to Cart<i
                    class="fa fa-arrow-right ms-3"></i></a>
        </div>
    </nav>
    <!-- Navbar End -->
</template>

<script>
import axios from "axios";

export default {
    data() {
        return {
            notifications: [],
        };
    },
    mounted() {
        this.getNotif();
    },
    methods: {
        async getNotif() {
            const user_id = sessionStorage.getItem("user_id");

            const notif = await axios.get(`/notification/${user_id}`);
            this.notifications = notif.data;
        },
        isRouteActive(route) {
            return this.$route.path === route;
        },
        async logout() {
            try {
                const response = await axios.post("/logout");

                if (response.status === 200) {
                    console.log("Logout successful");

                    sessionStorage.removeItem("token");
                    this.$router.push("/signin");
                }
            } catch (error) {
                console.error("Error during logout", error);
            }
        },

    }


};
</script>
<style>
.small-badge {
    font-size: 0.5rem;
}
</style>