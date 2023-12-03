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


class CheckoutController extends ResourceController
{
    protected $carts;
    protected $db;
    protected $orders;
    protected $invoice;
    protected $orderitems;

    protected $discount;
    protected $items;

    public function __construct()
    {
        $this->db = \Config\Database::connect();
    }
    public function index()
    {
    }

    public function checkout()
    {
        $this->invoice = new InvoiceModel();
        $this->orderitems = new OrderItemsModel();
        $this->orders = new OrderModel();
        $this->items = new MenuModel();
        $this->carts = new CartModel();

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

        if ($this->orders->affectedRows() > 0 && $this->orderitems->affectedRows() > 0 && $this->invoice->affectedRows() > 0) {
            return $this->respond(['message' => 'Checkout successful', 'invoice_id' => $invoice_id], 200);
        } else {
            return $this->respond(['message' => 'Checkout failed'], 500);
        }
    }


    public function invoice($invoice_id)
    {
        $data = $this->db->table('invoices')
            ->select('invoices.*, orders.*, order_items.*, items.*,users.*, users.status as user_status, orders.status as order_status')
            ->join('orders', 'orders.order_id = invoices.order_id')
            ->join('order_items', 'order_items.order_id = orders.order_id')
            ->join('items', 'items.item_id = order_items.item_id')
            ->join('users', 'users.user_id = orders.user_id')
            ->where('invoices.invoice_id', $invoice_id)
            ->get()
            ->getResult();


        $items = $this->db->table('items')
            ->select(
                'invoices.invoice_id,
                invoices.user_id as invoice_user_id,
                invoices.order_id as invoice_order_id,
                invoices.invoice_number,
                orders.user_id as order_user_id,
                orders.order_id,
                orders.order_type,
                orders.order_details,
                orders.status,
                orders.total_amount,
                order_items.user_id as order_item_user_id,
                order_items.item_id,
                order_items.quantity as order_item_quantity,
                order_items.total_price,
                items.quantity as item_quantity,
                items.*'
            )
            ->join('order_items', 'order_items.item_id = items.item_id')
            ->join('orders', 'orders.order_id = order_items.order_id')
            ->join('invoices', 'invoices.order_id = orders.order_id')
            ->where('invoices.invoice_id', $invoice_id)
            ->get()
            ->getResult();

        return $this->respond(['invoice_details' => $data, 'items' => $items], 200);
    }

    public function payment($invoice_id)
    {
        $invoice = $this->invoice->find($invoice_id);

        if (!$invoice) {
            return $this->respond(['message' => 'Invoice not found'], 404);
        }

        $orderItems = $this->orderitems->where('order_id', $invoice['order_id'])->findAll();


        foreach ($orderItems as $item) {
            $this->items->set('quantity', 'quantity - ' . $item['quantity'], false);
            $this->items->where('item_id', $item['item_id'])->update();
        }
        $this->carts->where('item_id', $item['item_id'])->delete();

        return $this->respond(['message' => 'Payment successful'], 200);
    }
}
