<!-- ReusableModal.vue -->
<template>
  <div v-if="show" class="modal" @click="closeModal">
    <div class="modal-dialog" role="document">
      <div class="modal-content" @click.stop>
        <slot></slot>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    show: {
      type: Boolean,
      required: true,
    },
  },
  methods: {
    closeModal() {
      this.$emit('close');
    },
  },
};
</script>

<style scoped>
.modal {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: rgba(0, 0, 0, 0.5);
  display: flex;
  align-items: center;
  justify-content: center;
}

.modal-dialog {
  max-width: 90%;
}

.modal-content {
  background: white;
  padding: 10px;
  border-radius: 10px;
  width: 100%;
}

</style>
