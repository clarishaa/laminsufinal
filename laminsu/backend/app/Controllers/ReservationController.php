<?php

namespace App\Controllers;

use App\Controllers\BaseController;
use CodeIgniter\RESTful\ResourceController;
use CodeIgniter\API\ResponseTrait;
use App\Models\MainModel;
use App\Models\MenuModel;
use App\Models\CategoryModel;
use App\Models\CartModel;
use App\Models\BookModel;
use App\Models\TableModel;
use App\Models\OrderItemsModel;
use App\Models\OrderModel;
use App\Models\NotificationModel;


class ReservationController extends ResourceController
{
    protected $db;
    protected $reservations;
    public function __construct()
    {
        $this->db = \Config\Database::connect();
    }
    public function fetchEmployee($id)
    {
        $model = new MainModel();

        $data = $model->find(['id' => $id]);
        if (!$data) return $this->failNotFound('No Data Found');
        return $this->respond($data[0]);
    }
    public function getReservations()
{
    $this->reservations = new BookModel();
    
    $pendingRes = $this->db->table('table_book')
        ->select()
        ->join('users', 'table_book.user_id = users.user_id')
        ->join('tables', 'table_book.table_id = tables.table_id')
        ->where('table_book.status', 'pending')
        ->get()
        ->getResult();

    $customers = $this->db->table('users')
        ->select()
        ->where('user_type', 'customer')
        ->get()
        ->getResult();

    $data = [
        'pending_reservations' => $pendingRes,
        'customers' => $customers,
    ];

    return $this->respond($data, 200);
}

    public function getCancelled()
    {
        $this->reservations = new BookModel();
        $data = $this->db->table('table_book')
            ->select()
            ->join('users', 'table_book.user_id = users.user_id')
            ->join('tables', 'table_book.table_id = tables.table_id')
            ->where('table_book.status', 'cancelled')
            ->get()
            ->getResult();

        return $this->respond($data, 200);
    }
    public function getPayed()
    {
        $this->reservations = new BookModel();
        $data = $this->db->table('table_book')
            ->select()
            ->join('users', 'table_book.user_id = users.user_id')
            ->join('tables', 'table_book.table_id = tables.table_id')
            ->where('table_book.status', 'payed')
            ->get()
            ->getResult();

        return $this->respond($data, 200);
    }
    public function getConfirmed()
    {
        $this->reservations = new BookModel();
        $data = $this->db->table('table_book')
            ->select()
            ->join('users', 'table_book.user_id = users.user_id')
            ->join('tables', 'table_book.table_id = tables.table_id')
            ->where('table_book.status', 'booked')
            ->get()
            ->getResult();

        return $this->respond($data, 200);
    }


    public function cancelRes($id = null)
    {
        $model = new BookModel();

        try {
            $booking = $model->find(['booking_id' => $id]);
            if (!$booking) {
                return $this->fail('No Data Found for Update', 404);
            }
            $result = $model->update(['booking_id' => $id], ['status' => 'cancelled']);

            if (!$result) {
                return $this->fail('Failed to Cancel', 500);
            }

            return $this->respond(['message' => 'Reservation cancelled successfully']);
        } catch (\Exception $e) {
            return $this->fail('Internal Server Error: ' . $e->getMessage(), 500);
        }
    }

    public function confirmRes($id = null)
    {
        $model = new BookModel();
        $notifModel = new NotificationModel();
    
        try {
            $booking = $model->find($id);
    
            if (!$booking) {
                return $this->fail('No Data Found for Update', 404);
            }
    
            if ($booking['status'] === 'booked') {
                return $this->respond(['message' => 'Reservation is already confirmed']);
            }
    
            $model->update($id, ['status' => 'booked']);
    
            $user_id = $booking['user_id'];
            $notificationData = [
                'user_id' => $user_id,
                'message' => 'Your reservation has been confirmed.',
                'link' => '',
            ];
    
            $notifModel->insert($notificationData);
    
            return $this->respond(['message' => 'Reservation confirmed successfully']);
        } catch (\Exception $e) {
            return $this->fail('Internal Server Error: ' . $e->getMessage(), 500);
        }
    }
    
    public function payRes($id = null)
    {
        $model = new BookModel();

        try {
            $booking = $model->find(['booking_id' => $id]);
            if (!$booking) {
                return $this->fail('No Data Found for Update', 404);
            }
            $result = $model->update(['booking_id' => $id], ['status' => 'payed']);

            if (!$result) {
                return $this->fail('Failed to Cancel', 500);
            }

            return $this->respond(['message' => 'Reservation cancelled successfully']);
        } catch (\Exception $e) {
            return $this->fail('Internal Server Error: ' . $e->getMessage(), 500);
        }
    }

   

}
