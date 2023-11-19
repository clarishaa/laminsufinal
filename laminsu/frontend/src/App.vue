<template>
  <router-view/>
  <div class="container mt-5">
    <Notification />
  </div>
</template>

<script>
import Notification from '@/components/Notification.vue';
export default {
  components: {
    Notification
  }
}
</script>