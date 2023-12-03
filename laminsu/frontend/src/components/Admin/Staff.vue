<template>
  <div class="container">
    <div class="col-md-12" style="margin-top: 6rem;">
      <div class="card">
        <div class="card-header">
          <h4>Staff Management</h4>
        </div>
        <div class="card-body">
          <table class="table table-bordered table-hover display" id="example" style="width:100%" ref="dataTable">
            <thead>
              <tr>
                <th data-priority="1">#</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Mobile</th>
                <th data-priority="2">Position</th>
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
                <td>Staff</td>
                <td>{{ staff.email }}</td>
                <td class="text-center">
                  <a  class="btn btn-primary me-2" @click="updateStaff(staff.user_id)" data-bs-toggle="tooltip" data-bs-placement="top" title="Edit">
                    <i class="fas fa-edit"></i>
                  </a>
                  <a  class="btn btn-danger ms-2" data-bs-toggle="tooltip" data-bs-placement="top" title="Delete">
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
</template>
  
<script>
import Notification from "@/components/Notification.vue";
import axios from "axios";

export default {
  name: "Staff",
  components: {
    Notification,
  },
  data() {
    return {
      staffs: [],
    };
  },
  mounted() {
    this.getData();
  },
  methods: {
    async getData() {
      const staff = await axios.get("getData");
      this.staffs = staff.data;

      this.$nextTick(() => {
        $(this.$refs.dataTable).DataTable({
          dom: "Bfrtip",
          responsive: true,
          pageLength: 25,
          buttons: ["csv", "excel", "pdf", "print"],
        });
      });
    },
  },
};
</script>
  
<style></style>
  