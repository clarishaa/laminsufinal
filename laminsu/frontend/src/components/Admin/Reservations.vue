<template>
    <div class="container">
        <div class="col-md-12" style="margin-top: 6rem;">
            <div class="card">
                <div class="card-header d-flex justify-content-between align-items-center">
                    <h4>Pending Reservations</h4>
                    <a class="btn btn-primary ms-auto" @click="openModal()" data-bs-toggle="modal"
                        data-bs-target="#editModal" data-bs-placement="top" title="Add">
                        Add reservation
                    </a>
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
                                <th>Amount Due</th>
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
                                    <a class="btn btn-primary btn-sm me-2" @click="confirmRes(res.booking_id)"
                                        title="Confirm">
                                        <i class="fas fa-check"></i>
                                    </a>
                                    <a class="btn btn-danger btn-sm ms-2" @click="cancelRes(res.booking_id)"
                                        data-bs-toggle="tooltip" data-bs-placement="top" title="Cancel">
                                        <i class="fas fa-times"></i>
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
                <h5 class="card-title text-center mb-5 fw-light fs-5">Add Reservation</h5>
                <form @submit.prevent="book" ref="book">
                    <div class="row g-3">
                        <div class="col-sm-12">
                            <div class="form-floating">
                                <select class="form-select bg-light border-0" v-model="user" required>
                                    <option value="" disabled selected>Select Customer</option>
                                    <option v-for="customer in users" :value="customer.user_id">
                                        {{ customer.first_name }} {{ customer.last_name }}
                                    </option>
                                </select>

                                <label for="time">Reservation Time</label>
                            </div>
                        </div>

                        <div class="col-sm-4">
                            <div class="form-floating">
                                <input type="time" class="form-control bg-light border-0" placeholder="Reservation Time"
                                    v-model="rtime" required>
                                <label for="time">Reservation Time</label>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="form-floating">
                                <input type="date" class="form-control bg-light border-0" placeholder="Reservation Date"
                                    v-model="rdate" required>
                                <label for="date">Reservation Date</label>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="form-floating">
                                <input type="button" class="form-control bg-light border-0" placeholder="Choose Table"
                                    @click="openModalT" v-model="selectedTable" />
                                <label for="e">Table</label>

                                <ReusableModal :show="isModalOpenT" @close="closeModal">
                                    <div class="row">
                                        <div class="col-md-6" v-for="table in tables" :key="table.table_id">
                                            <div class="card mb-1 card-hover" @click="selectTable(table)">
                                                <div class="card-body" :class="{ 'card-selected': isSelected(table) }">
                                                    <h5 class="card-title text-center">Table {{ table.table_number
                                                    }}</h5>
                                                    <p class="card-text text-center">{{ table.description }}</p>
                                                    <p class="card-text text-center">Capacity: {{ table.capacity }}
                                                        People</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </ReusableModal>
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="form-floating">
                                <textarea class="form-control bg-light border-0" placeholder="Special Requests or Message"
                                    style="height: 100px" v-model="message"></textarea>
                                <label for="message">Special Requests or Message</label>
                            </div>
                        </div>
                        <div class="col-12 text-center">
                            <button class="btn btn-primary py-3 px-4" type="submit">Book a Table</button>
                        </div>
                    </div>
                </form>
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
                    Are you sure you want to cancel this reservation?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="button" class="btn btn-danger" @click="cancelConfirmed">Confirm</button>
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
    name: "Reservations",
    components: {
        Notification, ReusableModal
    },
    data() {
        return {
            users: [],
            reservations: [],
            rtime: '',
            rdate: '',
            people: '',
            isModalOpenT: false,
            selectedTable: '',
            response: '',
            user: ''
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
        this.getTable();
        this.getData();

    },
    methods: {
        async getReservations() {
            try {
                const response = await axios.get("getReservations");
                const reservationData = response.data;

                this.reservations = reservationData.pending_reservations;
                this.users = reservationData.customers;

                console.log(this.reservations);
            } catch (error) {
                console.error(error);
            }
        },

        async getData() {
            const response = await axios.get("getReservations");
            const reservationData = response.data;

            this.reservations = reservationData.pending_reservations;
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
        async confirmRes(Id) {
            try {
                await axios.post(`confirmRes/${Id}`);
                this.getReservations();
                this.$refs.notification.open("Reservation Confirmed.", 'warning');
            } catch (error) {
                console.log(error);
            }
        },
        async getTable() {
            const table = await axios.get("getTable");
            this.tables = table.data;
        },
        async book() {
            try {
                const response = await axios.post("book", {
                    rtime: this.rtime,
                    rdate: this.rdate,
                    message: this.message,
                    table: this.selectedTable,
                    user_id: this.user,
                });

                this.$refs.notification.open(response.data.message, 'success');
                this.$refs.book.reset();
            } catch (error) {
                this.$refs.notification.error(error.response.data.message, 'error');
            }
            this.getReservations();
            this.closeModall();
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
        selectTable(table) {
            console.log('Selected Table:', table);
            if (this.isTableSelectable(table)) {
                this.selectedTable = table.table_id;
                this.closeModal();
            } else {
                console.log('Table is not selectable:', table);
                this.$refs.notification.error("Selected table is unavailable.", 'error');
            }
        }
        ,
        isTableSelectable(table) {
            return table.is_available === '1' && parseInt(table.quantity, 10) > 0;

        },

        isSelected(table) {
            return this.selectedTable === table.table_id;
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