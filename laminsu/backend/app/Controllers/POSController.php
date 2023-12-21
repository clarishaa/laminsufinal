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
use App\Models\ReceiptModel;
use App\Models\SalesModel;


class POSController extends ResourceController
{
    protected $carts;
    protected $db;
    protected $orders;
    protected $invoice;
    protected $orderitems;

    protected $discount;
    protected $items;
    protected $audit;
    protected $receipt;

    public function __construct()
    {
        $this->db = \Config\Database::connect();
    }
    public function index()
    {
    }
    public function pay()
    {
        $this->invoice = new InvoiceModel();
        $this->receipt = new ReceiptModel();
        $this->orderitems = new OrderItemsModel();
        $this->orders = new OrderModel();
        $this->items = new MenuModel();
        $this->carts = new CartModel();
        $this->audit = new SalesModel();

        $json = $this->request->getJSON();
        $user_id = $json->user_id;

        $order = [
            'user_id' => $user_id,
            'order_type' => $json->order_type,
            'order_details' => $json->order_details,
            'status' => $json->status,
            'total_amount' => $json->total_amount,
        ];

        $this->orders->save($order);
        $order_id = $this->orders->insertID();

        foreach ($json->items as $item) {
            $orderitem = [
                'user_id' => $user_id,
                'item_id' => $item->item_id,
                'quantity' => $item->quantity,
                'total_price' => $item->total_price,
                'order_id' => $order_id,
            ];

            $this->orderitems->save($orderitem);

            $product = $this->items->find($item->item_id);
            if ($product) {
                $newQuantity = $product['quantity'] - $item->quantity;
                $this->items->update($item->item_id, ['quantity' => $newQuantity]);

                $auditM = new SalesModel();
                $auditdata = [
                    'item_id' => $item->item_id,
                    'oldQuantity' => $product['quantity'],
                    'quantity' => $newQuantity,
                    'type' => 'sold'
                ];
                $auditM->save($auditdata);
            }

            $this->carts->where('user_id', $user_id)->where('item_id', $item->item_id)->delete();
        }

        $prefix = 'LMCC';
        $randomNumber = mt_rand(1000, 9999);
        $timestamp = time();
        $invoiceNum = $prefix . $randomNumber . $timestamp;

        $inv = [
            'user_id' => $user_id,
            'order_id' => $order_id,
            'invoice_number' => $invoiceNum,
        ];
        $this->invoice->save($inv);
        $invoice_id = $this->invoice->insertID();

        $rec = [
            'user_id' => $user_id,
            'order_id' => $order_id,
            'receipt_number' => $invoiceNum,
        ];
        $this->invoice->save($rec);

        if ($this->orders->affectedRows() > 0 && $this->orderitems->affectedRows() > 0 && $this->invoice->affectedRows() > 0) {
            return $this->respond(['message' => 'Checkout successful', 'invoice_id' => $invoice_id], 200);
        } else {
            return $this->respond(['message' => 'Checkout failed'], 500);
        }
    }


    public function getMenu()
    {
        $menuModel = new MenuModel();
        $categoryModel = new CategoryModel();

        $menuData = $menuModel->where('quantity >', 0)->findAll();

        $categoryData = $categoryModel->findAll();

        $combinedData = [
            'menu' => $menuData,
            'categories' => $categoryData,
        ];

        return $this->respond($combinedData, 200);
    }
    public function getCart($user_id)
    {
        $cart = new CartModel();
        $builder = $this->db->table('cart');
        $builder->select('cart.*, items.*, items.name AS item_name, categories.name AS category_name, cart.quantity AS cart_quantity, items.quantity AS item_quantity');
        $builder->join('items', 'items.item_id = cart.item_id', 'left');
        $builder->join('categories', 'categories.category_id = items.category_id', 'left');
        $builder->where('cart.user_id', $user_id);
        $data = $builder->get()->getResult();



        return $this->respond($data, 200);
    }


    public function payment()
    {
        $this->invoice = new InvoiceModel();
        $this->orderitems = new OrderItemsModel();
        $this->items = new MenuModel();
        $this->orders = new OrderModel();

        try {
            $json = $this->request->getJSON();

            $invoice_number =  $json->invoice_id;

            $invoice = $this->invoice->where('invoice_number', $invoice_number)->first();

            if (!$invoice) {
                return $this->respond(['message' => 'Invoice not found'], 404);
            }

            $orderItems = $this->orderitems->where('order_id', $invoice['order_id'])->findAll();
            $processedItemIds = [];

            foreach ($orderItems as $item) {
                if (in_array($item['item_id'], $processedItemIds)) {
                    continue;
                }

                var_dump($item);

                $product = $this->items->find($item['item_id']);

                var_dump($product);

                if ($product) {
                    $newQuantity = $product['quantity'] - $item['quantity'];

                    $this->items->update($item['item_id'], ['quantity' => $newQuantity]);

                    $auditM = new SalesModel();
                    $auditdata = [
                        'item_id' => $item['item_id'],
                        'oldQuantity' => $product['quantity'],
                        'quantity' => $newQuantity,
                        'type' => 'sold'
                    ];

                    var_dump($auditdata);

                    $auditM->save($auditdata);

                    $processedItemIds[] = $item['item_id'];
                }
            }
            $this->orders->update($invoice['order_id'], ['status' => 'completed']);

            return $this->respond(['message' => 'Payment successful'], 200);
        } catch (\Exception $e) {
            return $this->respond(['message' => 'Error during payment', 'error' => $e->getMessage()], 500);
        }
    }
    public function cancelOrder()
    {
    }

    public function deleteCart($id = null)
    {
        $model = new CartModel();
        $findById = $model->find(['cart_id' => $id]);
        if (!$findById) return $this->fail('No Data Found', 404);
        $product = $model->delete($id);
        if (!$product) return $this->fail('Failed Deleted', 400);
        return $this->respondDeleted('Deleted Successfully');
    }
}
