<?php

namespace App\Repositories\Eloquent;

use App\Models\Otp;
use App\Repositories\Interfaces\OtpRepositoryInterface;

class OtpRepository implements OtpRepositoryInterface
{
    /**
     * @var Model
     */
    protected $model;

    /**
     * OtpRepository constructor.
     *
     * @param Otp $model
     */
    public function __construct(Otp $model)
    {
        $this->model = $model;
    }

    public function create(array $data)
    {
        return $this->model
            ->create($data);
    }

    public function update(array $data, int $id)
    {
        return $this->model
        ->find($id)
        ->update($data);
    }


    public function updateIsSuccess(int $user_id)
    {
        $row = $this->getWhereLast(['user_id' => $user_id]);
        $row->is_success = 1;
        $row->update();
    }


    public function updateIsSendCount(int $user_id)
    {
        $row = $this->getWhereLast(['user_id' => $user_id]);
        $row->is_send_count++;
        $row->update();
    }


    public function updateAttemptsCount(int $user_id)
    {
        $row = $this->getWhereLast(['user_id' => $user_id]);
        $row->attempts_count++;
        $row->update();
    }


    public function isExist(array $data)
    {
        return $this->model
            ->where($data)
            ->exists();
    }

    public function getWhereLast(array $data)
    {
        return $this->model->where($data)
            ->get()
            ->last();
    }




    public function delete($id)
    {
        $otp = $this->model->whereId($id)->delete();
        return $otp;
    }

    public function deleteAllWhere(array $data)
    {
        return $this->model
        ->where($data)
            ->delete();
            
    }
}
