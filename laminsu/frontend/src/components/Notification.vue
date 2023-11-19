<template></template>
  
<script>
export default {
    methods: {
        open(message) {
            this.$toast.open({
                message: message,
                type: "success",
                duration: 1000,
                dismissible: true
            })
        },
        error(message) {
            this.$toast.error({
                message: message,
                type: "error",
                duration: 1000,
                dismissible: true,
                position: 'top-right',
            })
        },
        warning(message) {
            this.$toast.warning({
                message: message,
                type: "error",
                duration: 1000,
                dismissible: true,
                position: 'top-right',
            })
        },
    }
};
</script>