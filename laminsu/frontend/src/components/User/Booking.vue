<template>
    <!-- Booking Start -->
    <div class="container-fluid quote my-5 py-5" data-parallax="scroll"
        :data-image-src="isLargeScreen ? require('@/assets/img/carousel-2.jpg/') : null">
        <div class="container py-5">
            <div class="row justify-content-center">
                <div class="col-lg-7">
                    <div class="bg-white rounded p-4 p-sm-5 wow fadeIn" data-wow-delay="0.5s">
                        <h1 class="display-5 text-center mb-5">Book A Table</h1>
                        <form @submit.prevent="book" ref="book">
                            <div class="row g-3">
                                <div class="col-sm-4">
                                    <div class="form-floating">
                                        <input type="time" class="form-control bg-light border-0"
                                            placeholder="Reservation Time" v-model="rtime" required>
                                        <label for="time">Reservation Time</label>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-floating">
                                        <input type="date" class="form-control bg-light border-0"
                                            placeholder="Reservation Date" v-model="rdate" required>
                                        <label for="date">Reservation Date</label>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-floating">
                                        <input type="button" class="form-control bg-light border-0"
                                            placeholder="Choose Table" @click="openModal" v-model="selectedTable" />
                                        <label for="e">Table</label>

                                        <ReusableModal :show="isModalOpen" @close="closeModal">
                                            <div class="row">
                                                <div class="col-md-6" v-for="table in tables" :key="table.table_id">
                                                    <div class="card mb-1 card-hover" @click="selectTable(table)">
                                                        <div class="card-body"
                                                            :class="{ 'card-selected': isSelected(table) }">
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
                                        <textarea class="form-control bg-light border-0"
                                            placeholder="Special Requests or Message" style="height: 100px"
                                            v-model="message"></textarea>
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
        </div>
        <Notification ref="notification" />
    </div>
    <!-- Booking End -->
</template>
<script>
import Notification from '@/components/Notification.vue';
import ReusableModal from '@/components/User/Modal.vue';

import axios from 'axios';
export default {
    name: 'Booking',
    components: {
        Notification, ReusableModal
    },
    data() {
        return {
            isLargeScreen: window.innerWidth >= 1024,
            rtime: '',
            rdate: '',
            people: '',
            isModalOpen: false,
            selectedTable: '',
            response: ''
        };
    },
    mounted() {
        window.addEventListener('resize', this.handleResize);
        this.getTable();
    },
    destroyed() {
        window.removeEventListener('resize', this.handleResize);
    },
    methods: {
        async getTable() {
            const table = await axios.get("getTable");
            this.tables = table.data;
        },
        async book() {
            try {
                const user_id = sessionStorage.getItem("user_id");
                const response = await axios.post("book", {
                    rtime: this.rtime,
                    rdate: this.rdate,
                    message: this.message,
                    table: this.selectedTable,
                    user_id: user_id
                });

                this.$refs.notification.open(response.data.message, 'success');
                this.$refs.book.reset();
            } catch (error) {
                this.$refs.notification.error(error.response.data.message, 'error');
            }
        },

        handleResize() {
            this.isLargeScreen = window.innerWidth >= 1024;
        },
        openModal() {
            this.isModalOpen = true;
        },
        closeModal() {
            this.isModalOpen = false;
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
    background-color: #007bff;
    color: #fff;
}
</style>