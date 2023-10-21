<?php

namespace App\Services;

use App\Http\Resources\User\UserAddressesSingleResource;
use App\Models\User;
use App\Repositories\Interfaces\UserAddressRepositoryInterface;
use App\Services\Interfaces\UserAddressServiceInterface;
use App\Traits\ResponseTrait;


class UserAddressService implements UserAddressServiceInterface
{
    use ResponseTrait;

    private $userAddressRepository;

    public function __construct(UserAddressRepositoryInterface $userAddressRepository)
    {
        $this->userAddressRepository = $userAddressRepository;
    }


    /**
     * Display the specified resource.
     */
    public function list(int $user_id)
    {
        return $this->success200(UserAddressesSingleResource::collection($this->userAddressRepository->list($user_id)));
    }

    public function listActive(int $user_id)
    {
        return $this->success200(UserAddressesSingleResource::collection($this->userAddressRepository->listActive($user_id)));
    }
    /**
     * Store a newly created resource in storage.
     */
    public function create(array $data)
    {
        $data['user_id'] = auth('sanctum')->id();
        $data['is_default'] == 1 ? $this->handleDefaultFlag($data['user_id']) : null;
        $row = $this->userAddressRepository->create($data);
        return $this->success200(new UserAddressesSingleResource($row));
    }


    /**
     * Display the specified resource.
     */
    public function show(int $user_id)
    {
        return $this->success200(new UserAddressesSingleResource($this->userAddressRepository->show($user_id)));
    }

    private function handleDefaultFlag(int $user_id)
    {
        $this->userAddressRepository->updateWhere(['user_id' => $user_id, 'is_default' => 1], ['is_default' => 0]);
    }


    public function update(int $id, array $data)
    {
        $data['user_id'] = auth('sanctum')->id();

        // MAKING: HANDLE Update address if there is no in progress schedules or service ***
        $checkAddressForUpdate = $this->updateAddressCheck($data['user_id']);
        if ($checkAddressForUpdate) {
            $this->userAddressRepository->updateWhere(['id' => $id], $data);
            return $this->success202();
        }
        return $this->error400(null ,'can not update address while there is an in progress schedules or services');
    }

    public function updateAddressCheck($user_id): bool
    {
        $user = User::where('id',$user_id)
            // ->withCount(['user_active_requests_schedules' , 'user_active_purchase_requests'])
            ->withCount(['user_active_purchase_requests'])
            ->first();
        if ($user) {
            // if ($user->user_active_purchase_requests_count == 0 and $user->user_active_requests_schedules_count == 0) {
            if ($user->user_active_purchase_requests_count == 0){
                return true;
            }
        //            if ($user->user_purchase_requests_count == 0 and $user->user_requests_schedules_count == 0) {
        //                return true;
        //            }

        }
        return false;
    }


    public function setDefault(int $id)
    {
        $data['user_id'] = auth('sanctum')->id();
        $this->userAddressRepository->updateWhere(['id' => $id], ['is_default' => true]);


        return $this->success202();
    }

    public function destroy(int $id)
    {

        $this->userAddressRepository->destroy($id);



        return $this->success202();
    }


}
