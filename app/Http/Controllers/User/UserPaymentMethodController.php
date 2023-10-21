<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use App\Http\Requests\User\UserPaymentMethodValidateIDRequest;
use App\Http\Requests\User\UserPaymentMethodAddRequest;
use App\Services\Interfaces\UserPaymentMethodServiceInterface;
use Illuminate\Http\Request;

class UserPaymentMethodController extends Controller
{

    private $userPaymentMethodService;

    public function __construct(UserPaymentMethodServiceInterface $userPaymentMethodService)
    {
        $this->userPaymentMethodService = $userPaymentMethodService;
    }

    public function index()
    {
        return $this->userPaymentMethodService->list(auth('sanctum')->id());
    }
    public function listActive()
    {
        return $this->userPaymentMethodService->listActive(auth('sanctum')->id());
    }
    public function store(UserPaymentMethodAddRequest $request)
    {
        return $this->userPaymentMethodService->create($request->validated());
    }

    public function show(UserPaymentMethodValidateIDRequest $request,$id)
    {
        return $this->userPaymentMethodService->show($id);
    }

    public function update( Request  $data,$id)
    {
        return $this->userPaymentMethodService->update($id, $data->all() );
    }

    public function destroy(Request $request, int $id)
    {
        return $this->userPaymentMethodService->destroy($id);
    }

    public function setDefault(Request $request, int $id)
    {
        return $this->userPaymentMethodService->setDefault($id);
    }

    public function setInactive(Request $request, int $id)
    {
        return $this->userPaymentMethodService->update($id, ['is_active'=>0] );
    }
  
    


}
