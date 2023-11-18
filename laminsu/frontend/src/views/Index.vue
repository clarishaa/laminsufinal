<template>
  <Carousel />
  <Feature />
  <Menus />
  <Facts />
  <Services />
  <Booking />
  <Team />
  <Testimonials />
</template>
  
<script>
// @ is an alias to /src
import Carousel from '@/components/User/Carousel.vue'
import Feature from '@/components/User/Feature.vue'
import About from '@/components/User/About.vue'
import Facts from '@/components/User/Facts.vue'
import Features2 from '@/components/User/Features2.vue'
import Services from '@/components/User/Services.vue'
import Booking from '@/components/User/Booking.vue'
import Menus from '@/components/User/Menus.vue'
import Team from '@/components/User/Team.vue'
import Testimonials from '@/components/User/Testimonials.vue'

export default {
  name: 'Index',
  components: {
    Carousel, Feature, About, Facts, Features2, Services, Booking, Menus, Team, Testimonials,
  }
}
</script>
  