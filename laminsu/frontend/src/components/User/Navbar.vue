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
                <a href="/" class="nav-item nav-link active">Home</a>
                <a href="/about" class="nav-item nav-link">About</a>
                <a href="/services" class="nav-item nav-link">Services</a>
                <a href="/menu" class="nav-item nav-link">Menu</a>
                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Pages</a>
                    <div class="dropdown-menu bg-light m-0">
                        <a href="/features" class="dropdown-item">Features</a>
                        <a href="/booking" class="dropdown-item">Book a Table</a>
                        <a href="/reservation" class="dropdown-item">Get Event Reservation</a>
                        <a href="/team" class="dropdown-item">Our Team</a>
                        <a href="/testimonials" class="dropdown-item">Testimonials</a>
                    </div>
                </div>
                <a href="/contact" class="nav-item nav-link">Contact</a>
                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle fs-6" data-bs-toggle="dropdown"><i
                            class="fas fa-user fa-fw" style="color: forestgreen;"></i></a>
                    <div class="dropdown-menu bg-light m-0">
                        <a href="/settings" class="dropdown-item">Settings</a>
                        <a href="/history" class="dropdown-item">Activity Log</a>
                        <a href="/logout" class="dropdown-item">Logout</a>
                    </div>
                </div>
            </div>
            <a href="/cart" class="btn btn-primary py-4 px-lg-4 rounded-0 d-none d-lg-block">Go to Cart<i
                    class="fa fa-arrow-right ms-3"></i></a>
        </div>
    </nav>
    <!-- Navbar End -->
</template>