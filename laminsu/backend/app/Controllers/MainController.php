<?php

namespace App\Controllers;

use App\Controllers\BaseController;
use CodeIgniter\RESTful\ResourceController;
use CodeIgniter\API\ResponseTrait;
use App\Models\MainModel;
class MainController extends ResourceController
{
    protected $main;

    public function __construct()
    {
        $this->main = new MainModel();
    }

    public function index()
    {
        //
    }
    public function getData(){
        $data = $this->main->findAll();
        return $this->respond($data, 200);
    }
    public function signup() {
        $json = $this->request->getJSON();

        $data = [
            'username' => $json->username,
            'last_name' => $json->lastname,
            'first_name' => $json->firstname,
            'gender' => $json->selectedGender,
            'birthdate' => $json->bdate,
            'phone_number' => $json->phone,
            'email' => $json->email,
            'password' => password_hash($json->password, PASSWORD_DEFAULT),
        ];
    
        $register = $this->main->save($data);
    }

}