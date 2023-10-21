<?php

namespace App\Services;

use App\Http\Resources\User\UserPaymentMethodSingleResource;
use App\Repositories\Interfaces\UserPaymentMethodRepositoryInterface;
use App\Services\Interfaces\UserPaymentMethodServiceInterface;
use App\Traits\ResponseTrait;
use Illuminate\Support\Str;

class UserPaymentMethodService implements UserPaymentMethodServiceInterface
{
    use ResponseTrait;

    private $userPaymentMethodRepository;

    public function __construct(UserPaymentMethodRepositoryInterface $userPaymentMethodRepository)
    {
        $this->userPaymentMethodRepository = $userPaymentMethodRepository;
    }

    /**
     * Display the specified resource.
     */
    public function list(int $user_id)
    {
        return $this->success200(UserPaymentMethodSingleResource::collection($this->userPaymentMethodRepository->list($user_id)));
    }

  
    public function listActive(int $user_id)
    {
        return $this->success200(UserPaymentMethodSingleResource::collection($this->userPaymentMethodRepository->listActive($user_id)));
    }
  /**
     * Store a newly created resource in storage.
     */
    public function create(array $data)
    {
        $data['user_id'] = auth('sanctum')->id();
        $data['card_holder_name'] = Str::upper($data['card_holder_name']);
        $data['card_type'] = $this->handleCardType($data['card_number']);
        $data['is_default'] == 1 ? $this->handleDefaultFlag($data['user_id']) : null;
        $row = $this->userPaymentMethodRepository->create($data);
        return $this->success200(new UserPaymentMethodSingleResource($row));
        // return $this->success200($this->userPaymentMethodRepository->list($data['user_id']));
    }

    /**
     * Display the specified resource.
     */
    public function show(int $id)
    {
        return $this->success200($this->userPaymentMethodRepository->show($id));
    }


    private function handleDefaultFlag(int $user_id)
    {
        $this->userPaymentMethodRepository->updateWhere(['user_id' => $user_id, 'is_default' => 1], ['is_default' => 0]);
    }

    private function handleCardType(string $card_number)
    {
        if (Str::startsWith($card_number, 4)) {
            return 'visa';
        }
        return 'master_card';
    }

    public function update(int $id, array $data)
    {
        $data['user_id'] = auth('sanctum')->id();
        $this->userPaymentMethodRepository->updateWhere(['id' => $id], $data);


        return $this->success202();
    }


    public function setDefault(int $id)
    {
        $data['user_id'] = auth('sanctum')->id();
        $this->userPaymentMethodRepository->updateWhere(['id' => $id], ['is_default' => true]);


        return $this->success202();
    }

    public function destroy(int $id)
    {

        $this->userPaymentMethodRepository->destroy($id);



        return $this->success202();
    }
 
}
