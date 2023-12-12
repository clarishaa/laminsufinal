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
                <router-link to="/about" class="nav-item nav-link" :class="{ 'active': isRouteActive('/about') }">About</router-link>
                <router-link to="/services" class="nav-item nav-link" :class="{ 'active': isRouteActive('/services') }">Services</router-link>
                <router-link to="/menu" class="nav-item nav-link" :class="{ 'active': isRouteActive('/menu') }">Menu</router-link>
                <router-link to="/booking" class="nav-item nav-link" :class="{ 'active': isRouteActive('/booking') }">Book a Table</router-link>
                <router-link to="/team" class="nav-item nav-link" :class="{ 'active': isRouteActive('/team') }">Our Team</router-link>
                <router-link to="/testimonials" class="nav-item nav-link" :class="{ 'active': isRouteActive('/testimonials') }">Testimonials</router-link>
                <router-link to="/contact" class="nav-item nav-link" :class="{ 'active': isRouteActive('/contact') }">Contact</router-link>
            </div>
            <a href="/cart" class="btn btn-primary py-4 px-lg-4 rounded-0 d-none d-lg-block">Go to Cart<i
                    class="fa fa-arrow-right ms-3"></i></a>
        </div>
    </nav>
    <!-- Navbar End -->
</template>

<script>
export default {
    methods: {
        isRouteActive(route) {
            return this.$route.path === route;
        }
    }
};
</script>
