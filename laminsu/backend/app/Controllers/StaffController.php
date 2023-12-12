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
use App\Models\InvoiceModel;
use App\Models\DiscountModel;


class StaffController extends ResourceController
{
    protected $db;
    protected $staffs;
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
    public function getStaff()
    {
        $this->staffs = new MainModel();
        $data = $this->staffs->where('user_type', 'staff')->findAll();
        return $this->respond($data, 200);
    }

    public function update($id = null)
    {
        $json = $this->request->getJSON();
        $data = [
            'first_name' => $json->first_name,
            'last_name' => $json->last_name,
            'mobile' => $json->mobile,
            'email' => $json->username,
            'user_type' => $json->user_type,
            'position' => $json->position,
        ];
        $model = new MainModel();
        $findById = $model->find(['id' => $id]);
        if (!$findById) return $this->fail('No Data Found', 404);
        $product = $model->update($id, $data);
        if (!$product) return $this->fail('Update failed', 400);
        return $this->respond($product);
    }
    public function deleteStaff($id = null)
    {
        $model = new MainModel();
        $findById = $model->find(['user_id' => $id]);
        if (!$findById) return $this->fail('No Data Found', 404);
        $product = $model->delete($id);
        if (!$product) return $this->fail('Failed Deleted', 400);
        return $this->respondDeleted('Deleted Successfully');
    }
}
