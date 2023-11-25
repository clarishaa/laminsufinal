<template></template>
<style scoped>
@import '@/assets/lib/animate/animate.min.css';
@import '@/assets/lib/owlcarousel/assets/owl.carousel.min.css';
@import '@/assets/lib/lightbox/css/lightbox.min.css';
@import '@/assets/css/bootstrap.min.css';
@import '@/assets/css/style.css';
</style>
<script>

export default {

  name: "Resources",

  mounted() {

    this.loadScripts();

  },

  methods: {
    loadScripts() {
      const scriptUrls = [
        '/lib/jquery.min.js',
        '/lib/wow/wow.min.js',
        '/lib/easing/easing.min.js',
        '/lib/waypoints/waypoints.min.js',
        '/lib/owlcarousel/owl.carousel.min.js',
        '/lib/counterup/counterup.min.js',
        '/lib/parallax/parallax.min.js',
        '/lib/isotope/isotope.pkgd.min.js',
        '/lib/lightbox/js/lightbox.min.js',
        '/js/main.js',
      ];

      const head = document.getElementsByTagName('head')[0];

      function loadScript(index) {
        if (index < scriptUrls.length) {
          const script = document.createElement('script');
          script.src = scriptUrls[index];
          script.async = true;

          script.onload = function () {
            loadScript(index + 1);
          };

          head.appendChild(script);
        }
      }

      loadScript(0);
    },
  },
};

</script>