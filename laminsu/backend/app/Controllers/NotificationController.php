<?php

namespace App\Controllers;

use App\Controllers\BaseController;
use CodeIgniter\RESTful\ResourceController;
use CodeIgniter\API\ResponseTrait;
use App\Models\NotificationModel;


class NotificationController extends ResourceController
{
    public function notif($user_id)
    {
        $notif = new NotificationModel();
        $data = $notif->where('user_id', $user_id)->findAll();

        return $this->respond($data, 200);
    }
}
