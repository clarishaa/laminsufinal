<template>
    <!-- Booking Start -->
    <div class="container-fluid quote my-5 py-5" data-parallax="scroll" :data-image-src="require('@/assets/img/carousel-2.jpg/')">
        <div class="container py-5">
            <div class="row justify-content-center">
                <div class="col-lg-7">
                    <div class="bg-white rounded p-4 p-sm-5 wow fadeIn" data-wow-delay="0.5s">
                        <h1 class="display-5 text-center mb-5">Book A Table</h1>
                        <div class="row g-3">
                            <div class="col-sm-6">
                                <div class="form-floating">
                                    <input type="text" class="form-control bg-light border-0" id="name"
                                        placeholder="Your Name">
                                    <label for="name">Your Name</label>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-floating">
                                    <input type="email" class="form-control bg-light border-0" id="email"
                                        placeholder="Your Email">
                                    <label for="email">Your Email</label>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-floating">
                                    <input type="text" class="form-control bg-light border-0" id="phone"
                                        placeholder="Your Mobile">
                                    <label for="phone">Your Mobile</label>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-floating">
                                    <input type="time" class="form-control bg-light border-0" id="time"
                                        placeholder="Reservation Time">
                                    <label for="time">Reservation Time</label>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-floating">
                                    <input type="date" class="form-control bg-light border-0" id="date"
                                        placeholder="Reservation Date">
                                    <label for="date">Reservation Date</label>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-floating">
                                    <input type="number" class="form-control bg-light border-0" id="numOfPeople"
                                        placeholder="Number of People">
                                    <label for="numOfPeople">Number of People</label>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-floating">
                                    <textarea class="form-control bg-light border-0"
                                        placeholder="Special Requests or Message" id="message"
                                        style="height: 100px"></textarea>
                                    <label for="message">Special Requests or Message</label>
                                </div>
                            </div>
                            <div class="col-12 text-center">
                                <button class="btn btn-primary py-3 px-4" type="submit">Book a Table</button>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Booking End -->
</template>