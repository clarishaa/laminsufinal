<!-- Modal.vue -->
<template>
    <div v-if="show">
      <div class="modal-overlay" @click="closeModal"></div>
      <div class="modal">
        <div class="modal-header">
          <h2>{{ title }}</h2>
          <span class="close-button" @click="closeModal">×</span>
        </div>
        <div class="modal-body">
          <!-- Your modal content goes here -->
          <slot></slot>
        </div>
      </div>
    </div>
  </template>
  
  <script>
  export default {
    props: {
      show: Boolean,
      title: String,
    },
    methods: {
      closeModal() {
        this.$emit('close');
      },
    },
  };
  </script>
  
  <style scoped>
  /* Add your modal styles here */
  .modal {
    position: fixed;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    background: #fff;
    padding: 20px;
    z-index: 1000;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
  }
  
  .modal-overlay {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.5);
    z-index: 999;
  }
  
  .modal-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    border-bottom: 1px solid #ccc;
    padding-bottom: 10px;
  }
  
  .close-button {
    cursor: pointer;
    font-size: 20px;
    color: #333;
  }
  </style>
  