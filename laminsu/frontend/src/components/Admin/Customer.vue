<template>
  <div class="container">
    <div class="col-md-12" style="margin-top: 6rem;">
      <div class="card">
        <div class="card-header d-flex justify-content-between align-items-center">
          <h4>Customer Management</h4>
          <a class="btn btn-primary ms-auto" @click="openModal()" data-bs-toggle="modal" data-bs-target="#editModal"
            data-bs-placement="top" title="Add">
            Add Customer
          </a>
        </div>

        <div class="card-body">
          <table class="table table-bordered table-hover display" id="example" style="width:100%" ref="dataTable">
            <thead>
              <tr>
                <th data-priority="1">#</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Mobile</th>
                <th>Email</th>
                <th class="text-center">Action</th>
              </tr>
            </thead>
            <tbody>
              <tr v-for="(staff, index) in staffs" :key="index">
                <td>{{ index + 1 }}</td>
                <td>{{ staff.first_name }}</td>
                <td>{{ staff.last_name }}</td>
                <td>{{ staff.mobile }}</td>
                <td>{{ staff.email }}</td>
                <td class="text-center">
                  <a class="btn btn-primary me-2" @click="openModal(staff.user_id)" data-bs-toggle="modal"
                    data-bs-target="#editModal" data-bs-placement="top" title="Edit">
                    <i class="fas fa-edit"></i>
                  </a>
                  <a class="btn btn-danger ms-2" @click="staffDelete(staff.user_id)" data-bs-toggle="tooltip"
                    data-bs-placement="top" title="Delete">
                    <i class="fas fa-trash-alt"></i>
                  </a>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
  <div class="modal fade" id="editModal" tabindex="-1" aria-labelledby="editModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content  p-4 rounded m-4">
        <h5 class="card-title text-center mb-5 fw-light fs-5">{{ modalTitle }}</h5>
        <form @submit.prevent="register">
          <input type="hidden" v-model="user_type">
          <!-- Email -->
          <div class="form-floating mb-3">
            <input type="email" @input="clearError" class="form-control" id="floatingInput" placeholder="name@example.com"
              v-model="username" required pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$">
            <label for="floatingInput">Email address</label>
          </div>
          <div v-if="emailError" class="text-white text-center mb-3 p-2 bg-danger rounded small">
            {{ emailError }}
          </div>
          <!-- Last Name -->
          <div class="form-floating mb-3">
            <input type="text" class="form-control" id="floatingInput" placeholder="Last Name" v-model="last_name"
              required>
            <label for="floatingInput">Last Name</label>
          </div>

          <!-- First Name -->
          <div class="form-floating mb-3">
            <input type="text" class="form-control" id="floatingInput" placeholder="First Name" v-model="first_name"
              required>
            <label for="floatingInput">First Name</label>
          </div>

          <!-- Mobile Number -->
          <div class="form-floating mb-3">
            <input type="tel" class="form-control" id="floatingInput" placeholder="Mobile Number" v-model="mobile"
              required pattern="[0-9]{11}" maxlength="11">
            <label for="floatingInput">Mobile Number</label>
          </div>
          <!-- Password -->
          <div v-if="!isUpdate" class="form-floating mb-3">
            <input type="password" @input="clearError" class="form-control" id="floatingPassword" placeholder="Password"
              v-model="password" required minlength="8">
            <label for="floatingPassword">Password</label>
          </div>
          <div v-if="!isUpdate && passError" class="text-white text-center mb-3 p-2 bg-danger rounded small">
            {{ passError }}
          </div>

          <!-- Confirm Password -->
          <div v-if="!isUpdate" class="form-floating mb-3">
            <input type="password" class="form-control" placeholder="Confirm Password" v-model="confirmpassword"
              @input="checkPasswordMatch" required minlength="8" />
            <span v-if="confirmpassword.length > 0" id="password-status"
              style="font-size: 16px; position: absolute; top: 50%; transform: translateY(-50%); right: 5px;">
              <i :class="passwordStatusIcon"></i>
            </span>
            <label for="floatingPassword">Confirm Password</label>
          </div>

          <!-- Submit Button -->
          <div class="d-grid">
            <button class="btn btn-primary btn-login text-uppercase fw-bold" type="submit">{{ submitButtonText }}</button>
          </div>

          <hr class="my-4">
        </form>
      </div>
    </div>
  </div>
  <!-- Modal for Confirmation -->
  <div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="deleteModalLabel">Confirm Deletion</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          Are you sure you want to delete this user?
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
          <button type="button" class="btn btn-danger" @click="deleteConfirmed">Delete</button>
        </div>
      </div>
    </div>
  </div>
  <Notification ref="notification" />
</template>
  
<script>
import Notification from "@/components/Notification.vue";
import ReusableModal from '@/components/User/Modal.vue';
import axios from "axios";

export default {
  name: "Staff",
  components: {
    Notification, ReusableModal
  },
  data() {
    return {
      staffs: [],
      username: '',
      last_name: '',
      first_name: '',
      mobile: '',
      password: '',
      confirmpassword: '',
      showMessage: false,
      emailError: '',
      passError: '',
      user_type: 'customer',
      isUpdate: false,
      modalTitle: 'Add Customer',
      submitButtonText: 'Add',
    };
  },
  computed: {
    passwordStatusIcon() {
      return this.confirmpassword === this.password
        ? 'fas fa-check text-success'
        : 'fas fa-times text-danger';
    }
  },
  mounted() {
    this.getData();
    this.getStaff();
  },
  methods: {
    async getStaff() {
      const staff = await axios.get("getCustomer");
      this.staffs = staff.data;
    },
    async getData() {
      const staff = await axios.get("getCustomer");
      this.staffs = staff.data;
      this.$nextTick(() => {
        $(this.$refs.dataTable).DataTable({
          dom: "Bfrtip",
          responsive: true,
          pageLength: 5,
          buttons: ["csv", "excel", "print"],
        });
      });
    },
    async openModal(id = null) {
      if (id) {
        try {
          const response = await axios.get(`fetchCustomer/${id}`);
          const employeeData = response.data;

          this.isUpdate = true;
          this.modalTitle = 'Edit Customer';
          this.submitButtonText = 'Save Changes';
          this.employeeId = id;
          this.username = employeeData.email;
          this.last_name = employeeData.last_name;
          this.first_name = employeeData.first_name;
          this.mobile = employeeData.mobile;

          this.$router.push({ name: 'customer', params: { id: id } });
        } catch (error) {
          console.error('Error fetching customer data:', error);
        }
      } else {
        this.isUpdate = false;
        this.modalTitle = 'Add Customer';
        this.submitButtonText = 'Add';
        this.employeeId = null;

        this.$router.push({ name: 'customer' });
      }
    },

    async register() {
      if (this.isUpdate) {
        try {
          await axios.put(`updateCustomer/${this.$route.params.id}`, {
            username: this.username,
            last_name: this.last_name,
            first_name: this.first_name,
            mobile: this.mobile,
            user_type: this.user_type,
          });
          this.closeModal();
          this.$refs.notification.open("Customer info updated.", 'success');
        } catch (error) {
          console.log(error);
        }
      } else {
        try {
          const response = await axios.post('register', {
            username: this.username,
            last_name: this.last_name,
            first_name: this.first_name,
            mobile: this.mobile,
            password: this.password,
            user_type: this.user_type,
          });

          console.log(response.data);
          this.showMessage = false;
          this.closeModal();
          this.$refs.notification.open("Customer added.", 'success');
        } catch (error) {
          console.error(error);
          if (error.response && error.response.status === 400) {
            const errorData = error.response.data;
            if (errorData.error === 'Email already exists') {
              this.emailError = errorData.error;
            } else if (errorData.error === 'Password must contain at least one letter, one number and one special character') {
              this.passError = errorData.error;
            }
            else {
              this.emailError = '';
            }
          }
        }

      }
      this.getStaff();

    },
    closeModal() {
      this.$router.push({ name: 'customer' });
      $('#editModal').modal('hide');
    },
    clearError() {
      this.emailError = '';
      this.passErrorError = '';
    },
    staffDelete(userId) {
      this.DeleteId = userId;

      $('#deleteModal').modal('show');
    },
    deleteConfirmed() {
      this.deleteStaff(this.DeleteId);

      $('#deleteModal').modal('hide');
    },
    async deleteStaff(userId) {
      try {
        await axios.delete(`deleteCustomer/${userId}`);
        this.$refs.notification.open("Deleted successfully.", 'success');
        this.getStaff();
      } catch (error) {
        console.log(error);
      }
      this.$router.push({ name: 'customer' });
    }
  },

};
</script>
  
<style></style>
  