<template>
    <div class="container">
        <div class="col-md-12" style="margin-top: 6rem;">
            <div class="card">
                <div class="card-header d-flex justify-content-between align-items-center">
                    <h4>Payed Reservations</h4>
                </div>

                <div class="card-body">
                    <table class="table table-bordered table-hover display" id="example" style="width:100%" ref="dataTable">
                        <thead>
                            <tr>
                                <th data-priority="1">#</th>
                                <th>Table Number</th>
                                <th>Name</th>
                                <th>Mobile</th>
                                <th>Time</th>
                                <th>Date</th>
                                <th>Email</th>
                                <th>Request</th>
                                <th>Amount Payed</th>
                                <th class="text-center">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr v-for="(res, index) in reservations" :key="index">
                                <td>{{ index + 1 }}</td>
                                <td>{{ res.table_number }}</td>
                                <td>{{ res.first_name }} {{ res.last_name }}</td>
                                <td>{{ res.mobile }}</td>
                                <td>{{ res.booktime }}</td>
                                <td>{{ res.bookdate }}</td>
                                <td>{{ res.email }}</td>
                                <td>{{ res.message }}</td>
                                <td>₱ {{ res.price }}</td>

                                <td class="text-center">
                                    <a class="btn btn-danger btn-sm ms-2" @click="cancelRes(res.booking_id)"
                                        data-bs-toggle="tooltip" data-bs-placement="top" title="Cancel Payment">
                                        <i class="fas fa-times"></i> Cancel
                                    </a>

                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
   
    <!-- Modal for Confirmation -->
    <div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="deleteModalLabel">Confirm Cancellation</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    Are you sure you want to cancel this payment?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="button" class="btn btn-danger" @click="cancelConfirmed">Confirm</button>
                </div>
            </div>
        </div>
    </div>
     <!-- Modal for Confirmation -->
    <Notification ref="notification" />
</template>
    
<script>
import Notification from "@/components/Notification.vue";
import ReusableModal from '@/components/User/Modal.vue';
import axios from "axios";

export default {
    name: "Reservations",
    components: {
        Notification, ReusableModal
    },
    data() {
        return {
            reservations: [],
            rtime: '',
            rdate: '',
            people: '',
            isModalOpenT: false,
            selectedTable: '',
            response: ''
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
        this.getReservations();
        this.getData();

    },
    methods: {
        async getReservations() {
            const reservation = await axios.get("getPayed");
            this.reservations = reservation.data;

            console.log(this.reservations);

        },
        async getData() {
            const reservation = await axios.get("getPayed");
            this.reservations = reservation.data;
            this.$nextTick(() => {
                $(this.$refs.dataTable).DataTable({
                    dom: "Bfrtip",
                    responsive: true,
                    pageLength: 5,
                    buttons: ["csv", "excel", "print"],
                });
            });

        },
        
        cancelRes(Id) {
            this.CancelId = Id;

            $('#deleteModal').modal('show');
        },
        cancelConfirmed() {
            this.cancelReserv(this.CancelId);

            $('#deleteModal').modal('hide');
        },
        async cancelReserv(Id) {
            try {
                await axios.post(`cancelRes/${Id}`);
                this.$refs.notification.open("Cancelled successfully.", 'warning');
                this.getReservations();
            } catch (error) {
                console.log(error);
            }
        },
        

        handleResize() {
            this.isLargeScreen = window.innerWidth >= 1024;
        },
        openModal() {
            this.isModalOpen = true;
        },
        openModalT() {
            this.isModalOpenT = true;
        },
        closeModal() {
            this.isModalOpenT = false;
        },
        closeModall() {
            $('#editModal').modal('hide');
        },
        
    },
};
</script>
  
  
<style scoped>
.card-hover:hover {
    background-color: #f8f9fa;
    cursor: pointer;
}

.card-selected {
    background-color: #f8f9fa;
    color: #000;
}
</style>