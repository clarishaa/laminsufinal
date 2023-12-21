<?php

namespace App\Controllers;

use App\Controllers\BaseController;
use CodeIgniter\RESTful\ResourceController;
use CodeIgniter\API\ResponseTrait;

use App\Models\CrudModel;


class CrudController extends ResourceController
{
    protected $crud;

    public function __construct()
    {
        session_start();
    }

    public function getDataa()
    {
        $main = new CrudModel();
        $data = $main->findAll();
        return $this->respond($data, 200);
    }


    // public function save()
    // {
    //
    //     $data = $this->request->getPost();
    //
    //
    //     $image = $this->request->getFile('image');
    //     $imageName = $image->getRandomName();
    //     $image->move(WRITEPATH . 'uploads', $imageName);
    //
    //     $data['image'] = $imageName;
    //
    //     $main = new MainModel();
    //     $result = $main->save($data);
    //
    //     if ($result) {
    //         return $this->respond(['message' => 'Product saved successfully.'], 201);
    //     } else {
    //         return $this->respond(['error' => 'Unable to save product.'], 500);
    //     }
    // }

    public function saveee()
    {
        $this->crud = new CrudModel();
        $json = $this->request->getJSON();


        $data = [
            'name' => $json->name,
            'email' => $json->email,
            
        ];

        $book = $this->crud->save($data);
        if ($book) {
            return $this->respond(['message' => 'Booking successful'], 200);
        } else {
            return $this->respond(['message' => 'Booking failed'], 500);
        }
    }
//     $this->crud = new crudModel();
   

    public function updateItem($id)
  {
      $main = new CrudModel();
      $data = $main->find($id);

      if (!$data) {
          return $this->respond(['error' => 'Item not found.'], 404);
      }

      // Get the new data from the request
      // $newData = $this->request->getRawInput();
      $data = [
          'name' => $this->request->getVar('name'),
          'email' => $this->request->getVar('email'),
          
      ];
      // Use the where clause to update the existing data
      $main->set($data)->where('id', $id)->update();
      //
      // if ($main->affectedRows() > 0) {
      //     return $this->respond(['message' => 'Item updated successfully.'], 200);
      // } else {
      //     return $this->respond(['error' => 'Unable to update item.'], 500);
      // }

  }

    public function del()
    {
        $json = $this->request->getJSON();
        $id = $json->id;
        $mainn = new CrudModel();
        $r = $mainn->delete($id);
        return $this->respond($r, 200);
    }
}
