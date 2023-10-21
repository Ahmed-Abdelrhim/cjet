<?php

namespace App\Repositories\Eloquent;

use App\Models\Package;
use App\Models\Service;
use App\Models\UserPurchaseRequest;
use App\Repositories\Interfaces\UserPurchaseRequestRepositoryInterface;

class UserPurchaseRequestRepository implements UserPurchaseRequestRepositoryInterface
{

    /**
     * @var Model
     */
    protected $model;
    private $paginate;

    /**
     * Repository constructor.
     *
     * @param  $model
     */
    public function __construct(UserPurchaseRequest $model)
    {
        $this->model = $model;
        $this->paginate = 10;
    }


    public function all()
    {
        return $this->model
            ->with([
                'user:id,name,phone',
                'address.compound:id,title_en'
            ])
            ->get();
    }

    public function create(array $data)
    {
        return $this->model
            ->create($data);
    }


    public function show(int $id)
    {
        return $this->model
            ->find($id);
    }

    public function getWithDetails(int $id)
    {
        return $this->model
            ->where('id', $id)
            ->with(['user:id,name,phone,image', 'address', 'car', 'user_purchase_schedules', 'service_provider:id,name,phone,image'])
            ->first();
    }

    public function getWhereInIDs(array $ids)
    {
        return $this->model
            ->whereIn('id', $ids)
            ->with([
                'user:id,name,phone',
                'address.compound:id,title_en'
            ])
            ->get();
    }
    public function getUserActivePackageSubscriptionWhere(int $user_id, int $user_car_id)
    {
        return $this->model
            ->where('user_id', $user_id)
            ->where('user_car_id', $user_car_id)
            ->where('purchaseable_type',Package::class )
            ->whereIn('status',['pending','inprogress'] )
            ->whereDate('end_date', '>=', now())
            ->get();
    }

    public function getUserActiveServiceSubscriptionWhere(int $user_id, int $user_car_id, int $service_id,  $start_date)
    {
        return $this->model
            ->where('user_id', $user_id)
            ->where('user_car_id', $user_car_id)
            ->where('purchaseable_type',Service::class )
            ->whereIn('status',['pending','inprogress'] )
            ->whereDate('start_date', '=', $start_date)
            ->get();
    }
    /**
     * Update the specified resource in storage.
     */
    public function update(array $data, int $id)
    {
        return $this->model
            ->where('id', $id)
            ->update($data);
    }


    public function updateWhereAll(array $condition, array $data)
    {
        return $this->model
            ->where($condition)
            ->update($data);
    }

    public function isExist(array $data)
    {
        return $this->model
            ->where($data)
            ->exists();
    }

    public function getWhereFirst(array $data, array $status = ['pending', 'inprogress'])
    {
        return $this->model
            ->where($data)
            ->whereIn('status', $status)
            ->first();
    }

    public function getWhereAll(array $data, array $status = ['pending', 'inprogress'])
    {
        return $this->model
            ->where($data)
            ->whereIn('status', $status)
            ->get();
    }

    private function handleSearchFilterFilter($filter, $query)
    {
        if ($filter == 'service') {
            return $query->where('purchaseable_type', Service::class);
        }
        return $query->where('purchaseable_type', Package::class);
    }

    private function handleSearchFilterSort($sort, $status, $query)
    {
        if (is_null($sort)) {
            return in_array('inprogress', $status) || in_array('rescheduled', $status)  ? $query->orderBy('start_date', 'asc') : $query->orderBy('start_date', 'desc');
        }

        switch ($sort) {
            case 'old_request':
                return $query->orderBy('created_at', 'asc');
                break;
            case 'new_request':
                return $query->orderBy('created_at', 'desc');
                break;
            case 'old_schedule':
                return $query->orderBy('start_date', 'asc');
                break;
            case 'new_schedule':
                return $query->orderBy('start_date', 'desc');
                break;
            default:
                return $query->orderBy('start_date', 'asc');
                break;
        }
    }

    public function searchFilter($from,  $to, array $status = ['pending', 'inprogress', 'completed', 'cancelled', 'rescheduled'],  $filter = null,  $sort = null,  $paginate = 1)
    {
        $query = $this->model->whereBetween('start_date', [$from, $to]);

        is_null($status) ? $query : $query->whereIn('status', $status);

        is_null($filter) ? $query : $this->handleSearchFilterFilter($filter, $query);

        is_null($sort) ? $query : $this->handleSearchFilterSort($sort, $status, $query);

        $query->with([
            'user:id,name,phone',
            'address.compound:id,title_en'
        ]);



        return $paginate == 1 ?  $query->paginate($this->paginate) : $query->get();
    }

    private function handleSearchBookingID(string $booking_id, array $status = ['pending', 'inprogress', 'completed'], $user_id = null, $service_provider_id = null, $paginate = 1)
    {
        $query = $this->model
            ->where('user_purchase_reference', 'like', '%' . $booking_id . '%')
            ->whereIn('status', $status);

        is_null($user_id) ? $query  : $query->where('user_id', $user_id);

        is_null($service_provider_id) ? $query  : $query->where('service_provider_id', $service_provider_id);

        $query->with([
            'user:id,name,phone',
            'address.compound:id,title_en'
        ]);


        return $paginate == 1 ?  $query->paginate($this->paginate) : $query->get();
    }

    public function searchBookingID(string $booking_id,  array $status = ['pending', 'inprogress', 'completed', 'cancelled', 'rescheduled'], $paginate = 1)
    {
        return $this->handleSearchBookingID($booking_id, $status, null, null, $paginate);
    }
}
