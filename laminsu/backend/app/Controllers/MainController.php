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

class MainController extends ResourceController
{
    protected $main;
    protected $book;
    protected $cart;

    public function __construct()
    {
        session_start();
    }

    public function index()
    {
        //
    }
    public function getData()
    {
        $this->main = new MainModel();
        $data = $this->main->findAll();
        return $this->respond($data, 200);
    }

    public function book()
    {
        $this->book = new BookModel();
        $json = $this->request->getJSON();

        $data = [
            'user_id' => $json->user_id,
            'booktime' => $json->rtime,
            'bookdate' => $json->rdate,
            'people' => $json->people,
            'message' => $json->message,
        ];

        $book = $this->book->save($data);
        if ($book) {
            return $this->respond(['message' => 'Booking successful'], 200);
        } else {
            return $this->respond(['message' => 'Booking failed'], 500);
        }
    }

    public function register()
    {
        $json = $this->request->getJSON();

        $existingUser = $this->main->where('email', $json->username)->first();

        if ($existingUser) {
            return $this->respond(['message' => 'Email already exists'], 400);
        }
        $token = $this->verification(50);
        $data = [
            'email' => $json->username,
            'last_name' => $json->lastname,
            'first_name' => $json->firstname,
            'mobile' => $json->mobile,
            'password' => password_hash($json->password, PASSWORD_DEFAULT),
            'token' => $token
        ];

        $register = $this->main->save($data);

        if ($register) {
            return $this->respond(['message' => 'Registration successful'], 200);
        } else {
            return $this->respond(['message' => 'Registration failed'], 500);
        }
    }

    public function verification($length)
    {


        $str_result = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
        return substr(
            str_shuffle($str_result),
            0,
            $length
        );
    }


    public function addCart()
    {
        $this->cart = new CartModel();
        $json = $this->request->getJSON();

        $item_id = $json->item_id;
        $user = $json->user_id;

        $existing = $this->cart->where(['user_id' => $user, 'item_id' => $item_id])->first();

        if ($existing) {
            $existing['quantity']++;
            $updateResult = $this->cart->update($existing['cart_id'], $existing);

            if ($updateResult) {
                return $this->respond(['message' => 'Item quantity updated in the cart'], 200);
            } else {
                return $this->respond(['message' => 'Failed to update item quantity in the cart'], 500);
            }
        } else {
            $data = [
                'user_id'  => $user,
                'item_id'  => $item_id,
                'quantity' => 1,
            ];

            $addcart = $this->cart->save($data);

            if ($addcart) {
                return $this->respond(['message' => 'Item added to cart successfully'], 200);
            } else {
                return $this->respond(['message' => 'Failed to add item to cart'], 500);
            }
        }
    }



    public function getMenu()
    {
        $menu = new MenuModel();
        $data = $menu->findAll();
        return $this->respond($data, 200);
    }
    public function getCategory()
    {
        $category = new CategoryModel();
        $data = $category->findAll();
        return $this->respond($data, 200);
    }
    public function getCart()
    {
        $cart = new CartModel();
        $data = $cart->findAll();
        return $this->respond($data, 200);
    }

    public function login()
    {
        $json = $this->request->getJSON();

        if (isset($json->username) && isset($json->password)) {
            $username = $json->username;
            $password = $json->password;

            $userModel = new MainModel();
            $data = $userModel->where('email', $username)->first();

            if ($data) {
                $pass = $data['password'];
                $auth = password_verify($password, $pass);

                if ($auth) {
                    return $this->respond(['message' => 'Login successful', 'token' => $data['token'], 'user_id' => $data['user_id']], 200);
                } else {
                    return $this->respond(['message' => 'Invalid email or password'], 401);
                }
            } else {
                return $this->respond(['message' => 'Invalid email or password'], 401);
            }
        } else {
            return $this->respond(['message' => 'Invalid JSON data'], 400);
        }
    }
}
