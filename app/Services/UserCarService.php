<?php

namespace App\Services;

use App\Models\User;
use App\Repositories\Interfaces\UserCarRepositoryInterface;
use App\Services\Interfaces\UserCarServiceInterface;
use App\Traits\ResponseTrait;


class UserCarService implements UserCarServiceInterface
{
    use ResponseTrait;

    private $userCarRepository;

    public function __construct(UserCarRepositoryInterface $userCarRepository)
    {
        $this->userCarRepository = $userCarRepository;
    }


    /**
     * Display the specified resource.
     */
    public function list(int $user_id)
    {
        return $this->success200($this->userCarRepository->list($user_id));
    }


    public function listActive(int $user_id)
    {
        return $this->success200($this->userCarRepository->listActive($user_id));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function create(array $data)
    {
        $data['user_id'] = auth('sanctum')->id();
        $row = $this->userCarRepository->create($data);
        return $this->success200($row);
        // return $this->success200($this->userCarRepository->list($data['user_id']));
    }

    /**
     * Display the specified resource.
     */
    public function show(int $user_id)
    {
        return $this->success200($this->userCarRepository->show($user_id));
    }

    public function update(int $id, array $data)
    {
        $data['user_id'] = auth('sanctum')->id();
        // MAKE: check if there is a current subscription for the car
        $checkingCarForDeletion = $this->checkCarDeletion($data['user_id'], $id);
        if(!$checkingCarForDeletion){
            $this->userCarRepository->updateWhere(['id' => $id], $data);
            return $this->success202();
        }
        return $this->error400('Car Can not Be Deleted','Car can not be deleted because there is an current active subscription');
    }

    public function checkCarDeletion($userId, $carId): bool
    {
        $user = $user = User::where(['id' => $userId])
            ->withCount(['user_car_active_subscription' => function ($query) use ($carId) {
                $query->where('user_car_id', $carId);
            }])
            ->first();

        if($user){
            if($user->user_car_active_subscription_count >= 1) {
                return false;
            }
        }
        return true;
    }


    public function setDefault(int $id)
    {
        $data['user_id'] = auth('sanctum')->id();
        $this->userCarRepository->updateWhere(['id' => $id], ['is_default' => true]);


        return $this->success202();
    }

    public function destroy(int $id)
    {

        $this->userCarRepository->destroy($id);


        return $this->success202();
    }


}
