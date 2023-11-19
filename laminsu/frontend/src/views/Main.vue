<template>
    <Headd />
    <Resources />
    <Top />
    <Navbar />
    <main>
        <router-view/>
    </main>
  </template>
    
  <script>
  // @ is an alias to /src
  import Headd from '@/components/User/Headd.vue'
  import Resources from '@/components/User/Resources.vue'
  import Top from '@/components/User/Top.vue'
  import Navbar from '@/components/User/Navbar.vue'
  import Foot from '@/components/User/Foot.vue'
  
  export default {
    name: 'Main',
    components: {
      Headd, Resources, Top, Navbar, Foot
    }
  }
  </script>


<style scoped>
@import '@/assets/lib/animate/animate.min.css';
@import '@/assets/lib/owlcarousel/assets/owl.carousel.min.css';
@import '@/assets/lib/lightbox/css/lightbox.min.css';
@import '@/assets/css/bootstrap.min.css';
@import '@/assets/css/style.css';
</style>