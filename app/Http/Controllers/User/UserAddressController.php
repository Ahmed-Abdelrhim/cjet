<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use App\Http\Requests\User\UserAddressValidateIDRequest;
use App\Http\Requests\User\UserAddressAddRequest;
use App\Services\Interfaces\UserAddressServiceInterface;
use Illuminate\Http\Request;

class UserAddressController extends Controller
{

    private $userAddressService;

    public function __construct(UserAddressServiceInterface $userAddressService)
    {
        $this->userAddressService = $userAddressService;
    }


    public function index()
    {
        return $this->userAddressService->list(auth('sanctum')->id());
    }
    public function listActive()
    {
        return $this->userAddressService->listActive(auth('sanctum')->id());
    }
    public function store(UserAddressAddRequest $request)
    {
        return $this->userAddressService->create($request->validated());
    }

    public function show(UserAddressValidateIDRequest $request,$id)
    {
        return $this->userAddressService->show($id);
    }

    public function update( Request  $data,$id)
    {
        return $this->userAddressService->update($id, $data->all() );
    }

    public function destroy(Request $request, int $id)
    {
        return $this->userAddressService->destroy($id);
    }

    public function setInactive(Request $request, int $id)
    {
        return $this->userAddressService->update($id, ['is_active'=>0] );
    }
    public function setDefault(Request $request, int $id)
    {
        return $this->userAddressService->setDefault($id);
    }
}
