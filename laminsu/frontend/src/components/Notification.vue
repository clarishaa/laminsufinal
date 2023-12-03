<!-- Notification.vue -->

<template>
    <div></div>
  </template>
  
  <script>
  export default {
    methods: {
      showNotification(message, type, duration = 1000, dismissible = true, position = 'top-right') {
        this.$toast.open({
          message: message,
          type: type,
          duration: duration,
          dismissible: dismissible,
          position: position,
        });
      },
  
      open(message) {
        this.showNotification(message, 'success');
      },
  
      error(message) {
        this.showNotification(message, 'error', 1000, true, 'top-right');
      },
  
      warning(message) {
        this.showNotification(message, 'warning', 1000, true, 'top-right');
      },
    },
  };
  </script>
  