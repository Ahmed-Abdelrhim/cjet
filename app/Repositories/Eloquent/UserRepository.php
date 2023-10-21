<?php

namespace App\Repositories\Eloquent;

use App\Models\Package;
use App\Models\User;
use App\Repositories\Interfaces\UserRepositoryInterface;

class UserRepository implements UserRepositoryInterface
{

    /**
     * @var Model
     */
    protected $model;
    private $paginate;

    /**
     * UserRepository constructor.
     *
     * @param User $model
     */
    public function __construct(User $model)
    {
        $this->model = $model;
        $this->paginate = 10;
    }

    public function all()
    {
        return $this->model
        ->orderBy('id', 'desc')
        ->get();
    }

    public function paginate()
    {
        return $this->model
            ->orderBy('id', 'desc')
            ->paginate($this->paginate);
    }

    public function create(array $data)
    {
        return $this->model->create($data);
    }


    public function get(int $id)
    {
        return $this->model->find($id);
    }

    public function getUserByPhone(string $phone)
    {
        return $this->model
            ->where('phone', $phone)
            ->with(['social_accounts'])
            ->first();
    }


    public function getUserByEmail(string $email)
    {
        return $this->model
            ->where('email', $email)
            ->with(['social_accounts'])
            ->first();
    }

    public function getProfileDetails(int $id)
    {
        return $this->model
            ->where('id', $id)
            ->with(['user_purchase_requests'=>function($query){
                $query->where('purchaseable_type',Package::class );
                $query->whereIn('status',['pending','inprogress'] );
                $query->whereDate('end_date', '>=', now());
                $query->with('purchaseable');
            }])
            ->first();
    }


    public function updatePhoneVerifiedAt(int $id)
    {
        return $this->model
            ->where('id', $id)
            ->update([
                'phone_verified_at' => now(),
            ]);
    }

    public function update(array $data, int $id)
    {
        $this->model
            ->where('id', $id)
            ->update($data);

        return $this->get($id);
    }

    public function updateAttempts($id)
    {
        $current_otp = $this->model->find($id);
        $current_otp->update(['attempts' => $current_otp->attempts + 1]);
        return $current_otp;
    }

    public function updatePassword($id, $hash)
    {
        return $this->model
            ->where('id', $id)
            ->update([
                'password' => $hash,

            ]);
    }


    public function destroy(int $id)
    {
        return $this->model->destroy($id);
    }

    private function filterRegistrationType($query, $filter)
    {
        switch ($filter) {
            case 'google':
                return $query->whereNotNull('google_social_id');
            case 'facebook':
                return $query->whereNotNull('facebook_social_id');
            case 'apple':
                return $query->whereNotNull('apple_social_id');
            case 'normal':
                return $query->whereNotNull('password');
            default:
                return $query;
        }
    }

    private function sortBy($query, $sort)
    {
        switch ($sort) {
            case 'alphabetical':
                return $query->orderBy('name', 'asc');
            case 'oldest':
                return $query->orderBy('id', 'asc');
            default:
                return $query->orderBy('id', 'desc');
        }
    }

    public function search($from, $to, $sort = null, $filter = null, $paginate = 1)
    {
        $query = $this->model->whereBetween('created_at', [$from, $to]);
        $query = $this->filterRegistrationType($query, $filter);
        $query = $this->sortBy($query, $sort);
        return $paginate == 1 ?  $query->paginate($this->paginate) : $query->get();
    }

    public function getWithDetails(int $id)
    {
        return $this->model
        ->where('id',$id)
        // ->select('id','name','image','phone')
        ->with(['addresses','cars','payment_methods'])
        ->first();
    }

    public function getWhereInIDs(array $ids)
    {
        return $this->model
            ->whereIn('id', $ids)
            ->get();
    }
}
