<?php

namespace App\Services;

use App\Models\Admin;
use App\Repositories\Interfaces\AdminRepositoryInterface;
use App\Services\Interfaces\AdminServiceInterface;
use App\Traits\ResponseTrait;
use App\Traits\UploadTrait;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class AdminService implements AdminServiceInterface
{
    use ResponseTrait,UploadTrait;

    private $adminRepository;

    public function __construct(AdminRepositoryInterface $adminRepository)
    {
        $this->adminRepository = $adminRepository;
    }

    public function login(string $email, string $password)
    {
        if (!Auth::guard('admin')->attempt(['email' => $email, 'password' => $password])) {
            $error_message = 'You have entered an invalid Email or password';
            return $this->error401($error_message, $error_message);
        }

        $admin = $this->adminRepository->getWhereFirst(['email' => $email]);

        return $this->success200([
            'admin' => $admin,
            'token' => $admin->createToken("API TOKEN", ['admin'])->plainTextToken,
        ], 'Admin Logged In Successfully');

    }


    public function register(array $data)
    {
        $data['image'] = $this->uploadWithResize($data['image'], Admin::IMAGE_PATH,240,240);
        $data['password'] = Hash::make($data['password'] );

        $admin = $this->adminRepository->create($data);

        return $this->success200([
            'admin' => $admin,
            'token' => $admin->createToken("API TOKEN", ['admin'])->plainTextToken,
        ], 'Admin Created Successfully');
    
    }

    public function update(array $data,int $id)
    {
        if(isset($data['image'])){
            $data['image'] = $this->uploadWithResize($data['image'], Admin::IMAGE_PATH,240,240);
        }

        $this->adminRepository->update($data,$id);
        $admin = $this->adminRepository->show($id);
        return $this->success200(['admin' => $admin]);

    }
    
    public function updatePassword(string $password,string $new_password)
    {
        $admin = auth('sanctum')->user();
        if (!Auth::guard('admin')->attempt(['email' => $admin->email, 'password' => $password])) {
            $error_message = 'Invalid Old Password.';
            return $this->error422(['password' => [$error_message]], $error_message);
        }

        $this->adminRepository->update(['password' => bcrypt($new_password)],  $admin->id);
        return $this->success202();
    }


}
