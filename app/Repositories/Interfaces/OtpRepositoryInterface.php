<?php

namespace App\Repositories\Interfaces;


interface OtpRepositoryInterface
{
    // public function getWhere(array $data);
    // public function updateWhere(array $data_where,array $data_new);
    // public function delete();


    public function create(array $data);

    public function update(array $data, int $id);
    // public function updateWhere(array $data, array $dataWhere);

    public function updateIsSuccess(int $user_id);
    public function updateIsSendCount(int $user_id);
    public function updateAttemptsCount(int $user_id);

    public function getWhereLast(array $data);

    public function delete($id);
    public function deleteAllWhere(array $data);

    public function isExist(array $data);
}
