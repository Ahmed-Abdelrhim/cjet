<?php

namespace App\Services;

use App\Http\Resources\User\UserSingleWithDetailsResource;

use App\Repositories\Interfaces\UserRepositoryInterface;
use App\Services\Interfaces\UserDataServiceInterface;
use App\Traits\ResponseTrait;


class UserDataService implements UserDataServiceInterface
{
    use ResponseTrait;

    private $userRepository;

    public function __construct(
        UserRepositoryInterface $userRepository
    ) {
        $this->userRepository = $userRepository;

    }


    /**
     * Display the specified resource.
     */
    public function details(int $id)
    {
        return $this->success200(new UserSingleWithDetailsResource($this->userRepository->getWithDetails($id)));


    }
}
