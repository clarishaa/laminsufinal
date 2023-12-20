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
use App\Models\TestimonialModel;

class MainController extends ResourceController
{
    protected $main;
    protected $book;
    protected $cart;
    protected $testimonial;
    protected $category;
    protected $table;
    protected $items;

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
    public function getTable()
    {
        $this->table = new TableModel();
        $data = $this->table->findAll();
        return $this->respond($data, 200);
    }

    public function getTestimonial()
    {
        $this->testimonial = new TestimonialModel();
        $data = $this->testimonial->findAll();
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
            'table_id' => $json->table
        ];

        $book = $this->book->save($data);
        if ($book) {
            return $this->respond(['message' => 'Booking successful'], 200);
        } else {
            return $this->respond(['message' => 'Booking failed'], 500);
        }
    }

    public function testimonial()
    {
        $this->testimonial = new TestimonialModel();
        $json = $this->request->getJSON();

        $data = [
            'user_id' => $json->user_id,
            'content' => $json->testimonial,
        ];

        $book = $this->testimonial->save($data);
        if ($book) {
            return $this->respond(['message' => 'Testimonial submitted'], 200);
        } else {
            return $this->respond(['message' => 'Testimonial submission failed'], 500);
        }
    }

    public function register()
    {
        $json = $this->request->getJSON();
        $email = $json->username;
        $userModel = new MainModel();
        $token = $this->verification(50);
        $exUser = $userModel->where('email', $email)->first();

        if ($exUser) {
            return $this->respond(["error" => "Email already exists"], 400);
        } else {
            $password = $json->password;

            if (!preg_match('/[A-Za-z]/', $password) || !preg_match('/[0-9]/', $password)) {
                return $this->respond(["error" => "Password must contain at least one letter, one number and one special character"], 400);
            }

            $data = [
                'first_name' => $json->first_name,
                'last_name' => $json->last_name,
                'mobile' => $json->mobile,
                'email' => $email,
                'user_type' => $json->user_type,
                'position' => $json->position,
                'password' => password_hash($password, PASSWORD_BCRYPT),
                'token' => $token,
            ];

            $u = $userModel->save($data);
            if ($u) {
                return $this->respond(['msg' => 'Registered Successfully', 'token' => $token]);
            } else {
                return $this->respond(['msg' => 'Error occurred']);
            }
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
        $this->items = new MenuModel();
        $this->cart = new CartModel();
        $json = $this->request->getJSON();

        $item_id = $json->item_id;
        $user = $json->user_id;

        $existing = $this->cart->where(['user_id' => $user, 'item_id' => $item_id])->first();
        $available = $this->items->where('item_id', $item_id)->get()->getRowArray()['quantity'];

        $addQuantity = ($existing) ? $existing['quantity'] + 1 : 1;

        if ($addQuantity <= $available) {
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
        } else {
            return $this->respond(['message' => 'Requested quantity exceeds available stock'], 400);
        }
    }



    public function addQuantity()
    {
        $this->items = new MenuModel();
        $this->cart = new CartModel();
        $json = $this->request->getJSON();

        $item_id = $json->item_id;
        $user = $json->user_id;

        $existing = $this->cart->where(['user_id' => $user, 'item_id' => $item_id])->first();
        $available = $this->items->where('item_id', $item_id)->get()->getRowArray()['quantity'];

        if ($existing) {
            $addQuantity = $existing['quantity'] + 1;

            if ($addQuantity <= $available) {
                $existing['quantity']++;
                $updateResult = $this->cart->update($existing['cart_id'], $existing);

                if ($updateResult) {
                    return $this->respond(['message' => 'Item quantity updated in the cart'], 200);
                } else {
                    return $this->respond(['message' => 'Failed to update item quantity in the cart'], 500);
                }
            } else {
                return $this->respond(['message' => 'Requested quantity exceeds available stock'], 400);
            }
        } else {
            return $this->respond(['message' => 'Item not found in the cart'], 404);
        }
    }

    public function decQuantity()
    {
        $this->cart = new CartModel();
        $json = $this->request->getJSON();

        $item_id = $json->item_id;
        $user = $json->user_id;

        $existing = $this->cart->where(['user_id' => $user, 'item_id' => $item_id])->first();

        if ($existing) {
            if ($existing['quantity'] > 1) {
                $existing['quantity']--;
                $updateResult = $this->cart->update($existing['cart_id'], $existing);

                if ($updateResult) {
                    return $this->respond(['message' => 'Item quantity updated in the cart'], 200);
                } else {
                    return $this->respond(['message' => 'Failed to update item quantity in the cart'], 500);
                }
            } else {
                return $this->respond(['message' => 'Item quantity cannot be less than 1'], 400);
            }
        } else {
            return $this->respond(['message' => 'Item not found in the cart'], 404);
        }
    }

    public function getMenu()
    {
        $menu = new MenuModel();
        $data = $menu->where('quantity >', 0)->findAll();
        return $this->respond($data, 200);
    }

    public function getCategory()
    {
        $category = new CategoryModel();
        $data = $category->findAll();
        return $this->respond($data, 200);
    }
    public function getCart($user_id)
    {
        $cart = new CartModel();
        $data = $cart->where('user_id', $user_id)->findAll();
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
                    $_SESSION['user_type'] = $data['user_type'];

                    return $this->respond([
                        'message' => 'Login successful',
                        'token' => $data['token'],
                        'user_id' => $data['user_id'],
                        'user_type' => $data['user_type'],
                    ], 200);
                } else {
                    return $this->respond(['error' => 'Invalid email or password'], 401);
                }
            } else {
                return $this->respond(['error' => 'Invalid email or password'], 401);
            }
        } else {
            return $this->respond(['message' => 'Invalid JSON data'], 400);
        }
    }

    public function logout()
    {
        session_destroy();
        return $this->response->setStatusCode(200)->setJSON(['message' => 'Logout successful']);
    }
}
