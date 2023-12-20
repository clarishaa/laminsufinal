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
use App\Models\SalesModel;


class InventoryController extends ResourceController
{
    protected $db;
    protected $cat;

    public function __construct()
    {
        $this->db = \Config\Database::connect();
    }
    public function getInv()
    {
        $data = $this->db->table('items')
            ->select('items.*, items.name as item_name, categories.*, categories.name as category_name')
            ->join('categories', 'categories.category_id = items.category_id')
            ->get()
            ->getResult();

        return $this->respond($data, 200);
    }
    public function getAud()
{
    $data = $this->db->table('audit')
        ->join('items', 'audit.item_id = items.item_id')
        ->select('audit.*, items.quantity as item_quantity, items.*, audit.quantity as audit_quantity') 
        ->get()
        ->getResult();

    return $this->respond($data, 200);
}


    public function getCat()
    {
        $this->cat = new CategoryModel();
        $data = $this->cat->findAll();

        return $this->respond($data, 200);
    }

    public function fetchProducts($id)
    {
        $model = new MenuModel();

        $data = $this->db->table('items')
            ->select('items.*, items.name as item_name, categories.*, categories.name as category_name')
            ->join('categories', 'categories.category_id = items.category_id')
            ->where('item_id', $id)
            ->get()
            ->getResult();
        if (!$data) return $this->failNotFound('No Data Found');
        return $this->respond($data[0]);
    }

    public function addProd()
{
    $request = $this->request;

    $data = [
        'name' => $request->getPost('name'),
        'category_id' => $request->getPost('category_id'),
        'description' => $request->getPost('description'),
        'price' => $request->getPost('price'),
        'quantity' => $request->getPost('quantity'),
    ];

    if ($request->getFile('image')->isValid()) {
        $image = $request->getFile('image');
        $imageName = $image->getName();

        $data['img_path'] = $this->handleImageUpload($image, $imageName);
    }

    $menuu = new MenuModel();

    try {
        $menuu->insert($data);

        $this->updateQ($menuu->getInsertID());

        return $this->respond(["message" => "Product data saved successfully"], 200);
    } catch (\Exception $e) {
        log_message('error', 'Error saving product: ' . $e->getMessage());
        return $this->respond(["message" => "Failed to save product. Check logs for details."], 500);
    }
}

public function updateProd($id = null)
{
    $request = $this->request;

    $data = [
        'name' => $request->getPost('name'),
        'category_id' => $request->getPost('category_id'),
        'description' => $request->getPost('description'),
        'price' => $request->getPost('price'),
        'quantity' => $request->getPost('quantity'),
    ];

    // Check if an image is provided and is valid
    if ($request->getFile('image') && $request->getFile('image')->isValid()) {
        $image = $request->getFile('image');
        $imageName = $image->getName();

        $data['img_path'] = $this->handleImageUpload($image, $imageName);
    }

    $menuModel = new MenuModel();

    try {
        if ($id !== null) {
            $menuModel->update($id, $data);
            return $this->respond(["message" => "Product data updated successfully"], 200);
        } else {
            $menuModel->insert($data);
            return $this->respond(["message" => "Product data saved successfully"], 200);
        }
    } catch (\Exception $e) {
        log_message('error', 'Error saving/updating product: ' . $e->getMessage());
        return $this->respond(["message" => "Failed to save/update product. Check logs for details."], 500);
    }
}


    public function handleImageUpload($image, $imageName)
    {
        $uploadPath = 'C:\laragon\www\laminsufinal\laminsu\frontend\src\assets\img';

        $image->move($uploadPath, $imageName);
        return $imageName;
    }



    public function deleteProd($id = null)
    {
        $model = new MenuModel();
        $findById = $model->find(['item_id' => $id]);
        if (!$findById) return $this->fail('No Data Found', 404);
        $product = $model->delete($id);
        if (!$product) return $this->fail('Failed Deleted', 400);
        return $this->respondDeleted('Deleted Successfully');
    }
    public function updateQ($id = null)
    {
        $json = $this->request->getJSON();
        $quantity = $json->quantity;
        $model = new MenuModel();
        $item = $model->find($id);
    
        if (!$item) {
            return $this->fail('No Data Found', 404);
        }
    
        $newQuantity = $item['quantity'] + $quantity;
    
        $model->update($id, ['quantity' => $newQuantity]);
    
        $auditModel = new SalesModel();
        $data = [
            'item_id' => $item['item_id'],
            'oldQuantity' => $item['quantity'],
            'quantity' => $newQuantity,
            'type' => 'inbound',
        ];
        $auditModel->save($data);
    
        return $this->respond(['message' => 'Quantity updated successfully'], 200);
    }
    
}
