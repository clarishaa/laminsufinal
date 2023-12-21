<template>
    <div class="sidebar bg-dark-blue text-light p-4">
        <h3>Add New</h3>
        <form @submit.prevent="saveee">
          
          <div class="mb-3">
            <label for="name" class="form-label">Name:</label>
            <input type="text" class="form-control" placeholder="Name" v-model="name" required>
          </div>
          
          <div class="mb-3">
            
            <label for="email" class="form-label">email</label>
            <input type="text" class="form-control" placeholder="email" v-model="email" required>
          </div>
    
                
                
          <div style="display: flex; justify-content: space-between;">
      <button v-if="isEditing" type="button" @click="cancelEdit" class="btn btn-secondary">Cancel</button>
      <button v-if="isEditing" type="submit" @click.prevent="updateItem" class="btn btn-danger" style="margin-right: 150px;">Update</button>
      <button v-else type="submit" @click.prevent="saveee" class="btn btn-success">Save</button>
    </div>
    
        </form>
      </div>
    </template>
    
    <script>
    import axios from 'axios';
    
    export default {
      data() {
        return {
          name: '',
          email: '',
          itemId: null,
          sid: '',
        };
      },
      // methods: {
      //   handleImageChange(event) {
      //     this.image = event.target.files[0];
      //   },
        
      //   async save() {
      //   try {
      //       const formData = this.createFormData();
    
      //       // Save operation
      //       const response = await axios.post('save', formData, {
      //           headers: {
      //               'Content-Type': 'multipart/form-data',
      //           },
      //       });
    
      //       console.log(response.data);
    
      //       // Remove the current item from the table
      //       if (this.itemId) {
      //           this.info = this.info.filter(item => item.id !== this.itemId);
      //       }
    
      //       // Reset itemId after saving changes
      //       this.itemId = null;
    
      //       // Reset the form fields
      //       this.resetForm();
      //       this.isEditing = false;
    
      //       // Emit an event to notify the parent component about the data update
      //       this.$emit('data-saved');
    
      //       // ... handle other responses or actions as needed
      //   } catch (error) {
      //       console.error(error);
      //   }
      
    
      methods: {
        
        async saveee() {
            const q = await axios.post('saveee', {
          name: this.name,
          email: this.email,
        
        });
        }

    
    },
    
    
    
    async updateItem() {
        try {
          // console.log(this.itemId);
            const formData = this.createFormData();
            console.log(formData);
            // Update operation
            const response = await axios.post(`updateItem/${this.sid}`,{
              'name': this.name,
              'email': this.email,
            },
            {
                headers: {
                    'Content-Type': 'multipart/form-data',
                },
            });
    
            console.log(response.data);
    
            // Reset the form fields
            this.resetForm();
            this.isEditing = false;
    
            // Emit an event to notify the parent component about the data update
            this.$emit('data-save');
    
            // ... handle other responses or actions as needed
        } catch (error) {
            console.error(error);
        }
    },
    
    cancelEdit() {
          this.resetForm();
          this.isEditing = false;
        },
    
    
        editItem(info) {
          // Clear the form fields and reset editing status
          this.resetForm();
          this.isEditing = false;
        },
        createFormData() {
          const formData = new FormData();
          name: this.name;
          email: this.email;
          
        
    
          return formData;
        },
        resetForm() {
          // Reset your form fields
          name: this.name;
          email: this.email;
          
        },
      };
    </script>
      
      <style scoped>
      .bg-dark-blue {
      background-color: rgb(74, 94, 106)}
      .sidebar {
        height: 100%;
      }
      
      @media (min-width: 768px) {
        /* Adjust the height for larger screens */
        .sidebar {
          height: 80vh;
        }
      }
      .sidebar h3 {
        margin-bottom: 20px;
      }
      
      .sidebar label {
        margin-bottom: 5px;
      }
      
      .sidebar input {
        margin-bottom: 15px;
      }
      
      .sidebar button {
        margin-top: 10px;
      }
      .sidebar-container {
      height: 0vh; /* 100% of the viewport height */
      display: flex;
      flex-direction: column;
    }
    
    .sidebar {
      height: 100%; /* Occupy full height of the container */
    }
      
      </style>