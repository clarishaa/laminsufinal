<template>
    <Headd />
    <body class="sb-nav-fixed">
<Topnav/>
        <div id="layoutSidenav">
<!-- <Sidenav/> -->
<Dashboard/>
        </div>
    </body>
</template>
<script>
import Headd from '@/components/Admin/Headd.vue'
import Topnav from '@/components/Admin/TopNav.vue'
import Dashboard from '@/components/Admin/Dashboard.vue'

export default {

    name: "Admin",

    components: {
      Headd,Topnav,  Dashboard,
    },

    mounted() {

        this.loadScripts();

    },

    methods: {
        loadScripts() {
            const scriptUrls = [
                '/js/scripts.js',
                '/assets/demo/chart-area-demo.js',
                '/assets/demo/chart-bar-demo.js',
                '/js/datatables-simple-demo.js',
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