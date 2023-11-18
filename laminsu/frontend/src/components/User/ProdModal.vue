<!-- ProductModal.vue -->
<template>
    <div class="product-modal">
      <div class="modal-content">
        <span class="close" @click="closeModal">&times;</span>
        <h2>{{ product.name }}</h2>
        <!-- Add other product details here -->
      </div>
    </div>
  </template>
  
  <script>
  export default {
    props: ['product'],
    methods: {
      closeModal() {
        this.$emit('close');
      }
    }
  };
  </script>
  
  <style scoped>
  /* Add your modal styles here */
  </style>
  