<template>
  <!-- Facts Start -->
  <div class="container-fluid facts my-5 py-5" data-parallax="scroll"     :data-image-src="isLargeScreen ? require('@/assets/img/carousel-1.jpg/') : null">
    <div class="container py-5">
      <div class="row g-5">
        <div class="col-sm-6 col-lg-3 text-center wow fadeIn" data-wow-delay="0.1s">
          <h1 class="display-4 text-white" data-toggle="counter-up">587</h1>
          <span class="fs-5 fw-semi-bold text-light">Satisfied Diners</span>
        </div>
        <div class="col-sm-6 col-lg-3 text-center wow fadeIn" data-wow-delay="0.3s">
          <h1 class="display-4 text-white" data-toggle="counter-up">32</h1>
          <span class="fs-5 fw-semi-bold text-light">Signature Dishes</span>
        </div>
        <div class="col-sm-6 col-lg-3 text-center wow fadeIn" data-wow-delay="0.5s">
          <h1 class="display-4 text-white" data-toggle="counter-up">15</h1>
          <span class="fs-5 fw-semi-bold text-light">Culinary Experts</span>
        </div>
        <div class="col-sm-6 col-lg-3 text-center wow fadeIn" data-wow-delay="0.7s">
          <h1 class="display-4 text-white" data-toggle="counter-up">5</h1>
          <span class="fs-5 fw-semi-bold text-light">Awards and Accolades</span>
        </div>
      </div>
    </div>
  </div>
  <!-- Facts End -->
</template>

<script>
import Resources from '@/components/User/Resources.vue'

export default {
  components:{
    Resources
  },
  data() {
    return {
      isLargeScreen: window.innerWidth >= 1024,
      dataLoaded: false,
    };
  },
  mounted() {
    window.addEventListener('resize', this.handleResize);
  },
  destroyed() {
    window.removeEventListener('resize', this.handleResize);
  },
  methods: {
    handleResize() {
      this.isLargeScreen = window.innerWidth >= 1024; 
      this.dataLoaded = true;
    },
  },
};
</script>

