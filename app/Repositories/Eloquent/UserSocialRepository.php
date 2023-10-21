<?php

namespace App\Repositories\Eloquent;

use App\Models\Admin;
use App\Models\SocialAccount;
use App\Models\User;
use App\Repositories\Interfaces\UserSocialRepositoryInterface;

class UserSocialRepository implements UserSocialRepositoryInterface
{


    /**
     * @var Model
     */
    protected $model;

    /**
     * Repository constructor.
     *
     * @param  $model
     */
    // public function __construct(SocialAccount $model)
    public function __construct(User $model)
    {
        $this->model = $model;
    }

    public function create(array $data)
    {
        return $this->model
            ->create($data);
    }


    public function show(int $id)
    {
        return $this->model
            ->find($id);
    }


    public function getWhereFirst(array $data)
    {
        return $this->model
            ->where($data)
            ->first();
    }

    public function getWhereAll(array $data)
    {
        return $this->model
            ->where($data)
            ->get();
    }

    public function getWhereOrWhere($phone,  $email)
    {
        if ($phone) {
            return $this->getWhereFirst(['phone' => $phone]);
        }

        return $this->getWhereFirst(['email' => $email]);
    }


    public function update(array $data, int $id)
    {
        return $this->model
            ->where('id', $id)
            ->update($data);
    }
}
