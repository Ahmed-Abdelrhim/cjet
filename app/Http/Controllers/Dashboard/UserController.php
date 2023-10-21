<?php

namespace App\Http\Controllers\Dashboard;

use App\Http\Controllers\Controller;
use App\Http\Requests\Dashboard\UserExcelExportRequest;
use App\Http\Requests\Dashboard\UserSearchRequest;
use App\Http\Requests\Dashboard\UserSchedulesSearchRequest;
use App\Http\Requests\Dashboard\UserValidateIDRequest;
use App\Services\Interfaces\UserDashboardServiceInterface;
use App\Services\Interfaces\UserPurchaseScheduleDashboardServiceInterface;

class UserController extends Controller
{

    private $userService;
    private $userPurchaseScheduleDashboardService;

    public function __construct(
        UserDashboardServiceInterface $userService,
        UserPurchaseScheduleDashboardServiceInterface $userPurchaseScheduleDashboardService
    ) {
        $this->userService = $userService;
        $this->userPurchaseScheduleDashboardService = $userPurchaseScheduleDashboardService;
    }



    public function index()
    {
        return $this->userService->index();
    }


    public function paginate()
    {
        return $this->userService->paginate();
    }


    public function show(UserValidateIDRequest $request, $id)
    {
        return $this->userService->show($id);
    }


    public function search(UserSearchRequest $request)
    {
        return $this->userService->search($request->from . ' 00:00:00', $request->to . ' 23:59:59', $request->sort, $request->filter, $request->paginate);
    }


    public function searchSchedules(UserSchedulesSearchRequest $request)
    {
        return $this->userService->searchSchedules($request->user_id, $request->from . ' 00:00:00', $request->to . ' 23:59:59', $request->filter, $request->paginate);
    }





    public function export(UserExcelExportRequest $request)
    {
        $filter_array = $this->handleExcelFilterData($request);
        return $this->userService->export($request->ids, $filter_array);
    }


    private function handleExcelFilterData($request)
    {
        if (is_null($request->from) && is_null($request->to) && is_null($request->sort) && is_null($request->filter)) {
            return null;
        } else {
            return [
                'from' => (is_null($request->from)) ? '2023-01-01' . ' 00:00:00' : $request->from. ' 00:00:00',
                'to' => (is_null($request->to)) ? date('Y-m-d', strtotime('+3 months')) . ' 23:59:59' : $request->to. ' 23:59:59',
                'sort' => $request->sort,
                'filter' => $request->filter,
            ];
        }
    }
}
