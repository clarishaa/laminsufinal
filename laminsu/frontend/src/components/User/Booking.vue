<template>
    <!-- Booking Start -->
    <div class="container-fluid quote my-5 py-5" data-parallax="scroll"
        :data-image-src="require('@/assets/img/carousel-2.jpg/')">
        <div class="container py-5">
            <div class="row justify-content-center">
                <div class="col-lg-7">
                    <div class="bg-white rounded p-4 p-sm-5 wow fadeIn" data-wow-delay="0.5s">
                        <h1 class="display-5 text-center mb-5">Book A Table</h1>
                        <form @submit.prevent="book">
                            <div class="row g-3">
                                <div class="col-sm-6">
                                    <div class="form-floating">
                                        <input type="text" class="form-control bg-light border-0" 
                                            placeholder="Your Name" v-model="uname">
                                        <label for="name">Your Name</label>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-floating">
                                        <input type="email" class="form-control bg-light border-0" 
                                            placeholder="Your Email" v-model="email">
                                        <label for="email">Your Email</label>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-floating">
                                        <input type="text" class="form-control bg-light border-0"
                                            placeholder="Your Mobile" v-model="mobile">
                                        <label for="phone">Your Mobile</label>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-floating">
                                        <input type="time" class="form-control bg-light border-0" 
                                            placeholder="Reservation Time" v-model="rtime">
                                        <label for="time">Reservation Time</label>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-floating">
                                        <input type="date" class="form-control bg-light border-0" 
                                            placeholder="Reservation Date" v-model="rdate">
                                        <label for="date">Reservation Date</label>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-floating">
                                        <input type="number" class="form-control bg-light border-0" 
                                            placeholder="Number of People" v-model="people">
                                        <label for="numOfPeople">Number of People</label>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-floating">
                                        <textarea class="form-control bg-light border-0"
                                            placeholder="Special Requests or Message"
                                            style="height: 100px" v-model="message"></textarea>
                                        <label for="message">Special Requests or Message</label>
                                    </div>
                                </div>
                                <div class="col-12 text-center">
                                    <button class="btn btn-primary py-3 px-4" type="submit">Book a Table</button>
                                </div>
                            </div>
                        </form>
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
  name: 'Booking',
  data() {
    return {
      uname: '',
      email: "",
      mobile: "",
      rtime: '',
      rdate: '',
      people: '',
      message: '',

    };
  },
  methods: {
    async book() {
      try {
        const insert = await axios.post("book", {
          uname: this.uname,
          email: this.email,
          mobile: this.mobile,
          rtime: this.rtime,
          rdate: this.rdate,
          people: this.people,
          message: this.message,

        })
        this.showMessage = false;
      } catch (error) {
      }
    }
  },
};
</script>
  
  
  