<?php

namespace App\Http\Controllers\User;

use App\Services\Interfaces\CityServiceInterface;
use App\Services\Interfaces\UserDataServiceInterface;

class UserDataController
{

    private $userDataService;
    private $cityService;

    public function __construct(UserDataServiceInterface $userDataService,
    CityServiceInterface $cityService
    )
    {
        $this->userDataService = $userDataService;
        $this->cityService = $cityService;
    }


    public function details()
    {
        return $this->userDataService->details(auth('sanctum')->id());
    }

    public function citiesCompounds()
    {
        // return $this->cityService->allActiveWithDetails();
        return $this->cityService->allActiveWhereHasActiveCompoundsWithDetails();
    }
}
