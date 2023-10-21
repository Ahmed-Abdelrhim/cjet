<?php

namespace App\Services;

use App\Exports\UsersExport;
use App\Http\Requests\Dashboard\UserValidateIDRequest;
use App\Http\Resources\Dashboard\UserExportListResource;
use App\Http\Resources\Dashboard\UserListResource;
use App\Http\Resources\Dashboard\UserScheduleListResource;
use App\Http\Resources\Dashboard\UserSingleResource;
use App\Repositories\Interfaces\UserPurchaseScheduleRepositoryInterface;
use App\Repositories\Interfaces\UserRepositoryInterface;
use App\Services\Interfaces\UserDashboardServiceInterface;
use App\Traits\ResponseTrait;
use Maatwebsite\Excel\Excel;

class UserDashboardService implements UserDashboardServiceInterface
{
    use  ResponseTrait;

    private $userRepository;
    private $userPurchaseScheduleRepository;

    public function __construct(UserRepositoryInterface $userRepository, UserPurchaseScheduleRepositoryInterface $userPurchaseScheduleRepository)
    {
        $this->userRepository = $userRepository;
        $this->userPurchaseScheduleRepository = $userPurchaseScheduleRepository;
    }

    public function index()
    {
        return $this->success200(UserListResource::collection($this->userRepository->all())
            ->response()
            ->getData(true));
    }

    public function paginate()
    {
        return $this->success200(UserListResource::collection($this->userRepository->paginate())
            ->response()
            ->getData(true));
    }

    public function show(int $id)
    {
        return $this->success200(new UserSingleResource($this->userRepository->getWithDetails($id)));
    }

    public function search($from, $to, $sort = null, $filter = null, $paginate = 1)
    {
        return $this->success200(UserListResource::collection($this->userRepository
            ->search($from, $to, $sort, $filter, $paginate))
            ->response()
            ->getData(true));
    }


    public function searchSchedules(int $user_id, $from, $to, $filter, $paginate = 1)
    {
        return $this->success200(UserScheduleListResource::collection($this->userPurchaseScheduleRepository
            ->searchUserSchedules($user_id, $from, $to, $filter, $paginate))
            ->response()
            ->getData(true));
    }


    public function export(array $ids = null, array $filter_array = null)
    {
        $file_data = $this->getExcelData($ids, $filter_array);
        // return Excel::download(new UsersExport, 'users.xlsx');
        ob_end_clean(); //for generating excel XLSX
        ob_start(); //for generating excel XLSX
        return (new UsersExport(UserExportListResource::collection($file_data)))->download('users.xlsx', Excel::XLSX);
    }

    private function getExcelData(array $ids = null, array $filter_array = null)
    {
        if ($ids) {
            return $this->userRepository->getWhereInIDs($ids);
        } else if ($filter_array) {
            return $this->userRepository->search($filter_array['from'], $filter_array['to'], $filter_array['sort'], $filter_array['filter'], 0);
        } else {
            return $this->userRepository->all();
        }
    }
}
