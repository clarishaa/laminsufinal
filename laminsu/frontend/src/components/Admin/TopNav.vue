<template>
    <!-- Navbar Start -->
    <nav class="navbar navbar-expand-lg bg-light navbar-light fixed-top p-0">
        <a href="/" class="navbar-brand d-flex align-items-center px-4 px-lg-5">
            <h1 class="m-0">La MinSU</h1>
        </a>
        <button type="button" class="navbar-toggler me-4" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <div class="navbar-nav ms-auto p-4 p-lg-0">
                <a href="/" class="nav-item nav-link active fs-6">Dashboard</a>
                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle fs-6" data-bs-toggle="dropdown">User Management</a>
                    <div class="dropdown-menu bg-light m-0">
                        <a href="/admin/staff" class="dropdown-item">Staff Management</a>
                        <a href="/admin/customer" class="dropdown-item">Customer Management</a>
                    </div>
                </div>
                <a href="/admin/inventory" class="nav-item nav-link fs-6">Inventory</a>
                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle fs-6" data-bs-toggle="dropdown">Reservations</a>
                    <div class="dropdown-menu bg-light m-0">
                        <a href="/admin/pending-reservations" class="dropdown-item">Pending Reservations</a>
                        <a href="/admin/cancelled-reservations" class="dropdown-item">Cancelled Reservations</a>
                        <a href="/admin/confirmed-reservations" class="dropdown-item">Confirmed Reservations</a>
                        <a href="/admin/payed-reservations" class="dropdown-item">Payed Reservations</a>
                    </div>
                            </div>

                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle fs-6" data-bs-toggle="dropdown"><i
                                class="fas fa-user fa-fw" style="color: forestgreen;"></i></a>
                        <div class="dropdown-menu bg-light m-0">
                            <a href="/logout" class="dropdown-item">Logout</a>
                        </div>
                    </div>
                </div>
            </div>

        <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
            <div class="input-group mt-1">
                <input class="form-control" type="text" placeholder="Search for..." aria-label="Search for..."
                    aria-describedby="btnNavbarSearch" />
                <button class="btn btn-primary" id="btnNavbarSearch" type="button"><i class="fas fa-search"></i></button>
            </div>
        </form>

    </nav>
    <!-- Navbar End -->
</template>