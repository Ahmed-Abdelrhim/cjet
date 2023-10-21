<?php

namespace App\Repositories\Eloquent;

use App\Models\Package;
use App\Models\Service;
use App\Models\UserPurchaseSchedule;
use App\Repositories\Interfaces\UserPurchaseScheduleRepositoryInterface;

class UserPurchaseScheduleRepository implements UserPurchaseScheduleRepositoryInterface
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
    public function __construct(UserPurchaseSchedule $model)
    {
        $this->model = $model;
        $this->paginate = 10;
    }



    public function create(array $data)
    {
        return $this->model
            ->create($data);
    }


    public function insert(array $data)
    {
        return $this->model
            ->insert($data);
    }


    public function show(int $id)
    {
        return $this->model
            ->with(['user_purchase_request.address', 'user_purchase_request.car', 'user_purchase_request.user_purchase_price_options'])
            ->find($id);
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


    public function updateWhereInAll(array $ids, array $data)
    {
        return $this->model
            ->whereIn('id', $ids)
            ->update($data);
    }


    public function getWithDetails(int $id)
    {
        return $this->model
            ->where('id', $id)
            ->with([
                'user:id,name,phone,image',
                'service_provider:id,name,phone,image',
                'user_purchase_request.purchaseable',
                'user_purchase_request.car',
                'user_purchase_request.address.compound.city',

            ])
            ->first();
    }


    private function getUserSchedules(int $user_id, array $status,)
    {
        return $this->model
            ->where('user_id', $user_id)
            ->whereIn('status', $status)
            ->with('user_purchase_request')
            ->orderBy('scheduled_at', 'desc')
            ->get();
    }

    public function getUpcomingUserSchedules(int $user_id)
    {
        return $this->getUserSchedules($user_id, ['pending', 'inprogress']);
    }

    public function getPastUserSchedules(int $user_id)
    {
        return $this->getUserSchedules($user_id, ['completed', 'cancelled']);
    }

    public function getRescheduleUserSchedules(int $user_id)
    {
        return $this->model
        ->where('user_id', $user_id)
        ->where('status', 'rescheduled')
        ->whereNull('is_reschedule_handled')
        ->with('user_purchase_request')
        ->orderBy('scheduled_at', 'desc')
        ->get();
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

    public function getWhereInIDs(array $ids)
    {
        return $this->model
            ->whereIn('id', $ids)
            ->get();
    }

    public function getCompoundIDs(array $ids)
    {
        return $this->model
            ->whereIn('id', $ids)
            ->with('user_purchase_request.address')
            ->get()
            ->pluck('user_purchase_request.address.compound_id');
    }

    /**
     * Get service provider schedules
     */
    // public function getServiceProviderSchedules(int $service_provider_id, array $status = ['pending', 'inprogress', 'completed', 'cancelled', 'rescheduled'])
    public function getServiceProviderSchedules(int $service_provider_id, array $status = ['inprogress', 'completed'], $paginate = 0, $order_by = 'asc')
    {
        $query = $this->model
            ->where('service_provider_id', $service_provider_id)
            ->whereIn('status', $status)
            ->with([
                'user:id,name,phone',
                'user_purchase_request.address.compound:id,title_en'
            ])
            ->orderBy('scheduled_at', $order_by);
        // ->with(['user','user_purchase_request.address', 'user_purchase_request.car'])
        return $paginate == 1 ?  $query->paginate($this->paginate) : $query->get();
    }

    /**
     * Get service provider inprogress schedules
     */
    public function getServiceProviderActiveSchedules(int $service_provider_id, $paginate = 0)
    {
        return $this->getServiceProviderSchedules($service_provider_id, ['inprogress'], $paginate, 'asc');
    }

    /**
     * Get service provider active schedules count
     */
    public function getServiceProviderActiveSchedulesCount(int $service_provider_id)
    {
        return $this->getServiceProviderSchedules($service_provider_id, ['inprogress'])->count();
    }


    /**
     * Get service provider completed schedules
     */
    public function getServiceProviderCompletedSchedules(int $service_provider_id, $paginate = 0)
    {
        return $this->getServiceProviderSchedules($service_provider_id, ['completed'], $paginate, 'desc');
    }


    /**
     * Get service provider completed schedules count
     */
    public function getServiceProviderCompletedSchedulesCount(int $service_provider_id)
    {
        return $this->getServiceProviderSchedules($service_provider_id, ['completed'])->count();
    }

    public function calculateServiceProviderAverageRating(int $service_provider_id)
    {
        return $this->model
            ->where('service_provider_id', $service_provider_id)
            ->where('status', 'completed')
            ->avg('service_rate');
    }


    public function searchServiceProviderSchedules(int $service_provider_id, $from, $to, $status = 'inprogress', $compound_id = null, $paginate = 1)
    {
        $query = $this->model
            ->where('service_provider_id', $service_provider_id)
            ->whereBetween('scheduled_at', [$from, $to])
            ->where('status', $status)
            ->with([
                'user:id,name,phone',
                'user_purchase_request.address.compound:id,title_en'
            ]);

        $compound_id ? $query->whereHas('user_purchase_request.address', function ($q) use ($compound_id) {
            $q->where('compound_id', $compound_id);
        }) : null;

        $status == 'inprogress' ? $query->orderBy('scheduled_at', 'asc') : $query->orderBy('scheduled_at', 'desc');
        return $paginate == 1 ?  $query->paginate($this->paginate) : $query->get();
    }




    public function searchUserSchedules(int $user_id, $from, $to, $filter, $paginate = 1)
    {
        $query = $this->model->where('user_id', $user_id)->whereBetween('scheduled_at', [$from, $to]);

        (is_null($filter)) ? $query : $query->where('status', $filter);

        $query->with([
            'user:id,name,phone',
            'user_purchase_request.address.compound:id,title_en'
        ])->orderBy('scheduled_at', 'desc');

        return $paginate == 1 ?  $query->paginate($this->paginate) : $query->get();
    }



    private function handleSearchFilterFilter($filter, $query)
    {
        if ($filter == 'service') {
            return $query->whereHas('user_purchase_request', function ($q) {
                $q->where('purchaseable_type', Service::class);
            });
        }
        return $query->whereHas('user_purchase_request', function ($q) {
            $q->where('purchaseable_type', Package::class);
        });
    }

    private function handleSearchFilterSort($sort, $status, $query)
    {
        if (is_null($sort)) {
            return in_array('inprogress', $status) || in_array('rescheduled', $status)  ? $query->orderBy('scheduled_at', 'desc') : $query->orderBy('scheduled_at', 'asc');
        }

        switch ($sort) {
            case 'old_request':
                return $query->orderBy('created_at', 'asc');
                break;
            case 'new_request':
                return $query->orderBy('created_at', 'desc');
                break;
            case 'old_schedule':
                return $query->orderBy('scheduled_at', 'asc');
                break;
            case 'new_schedule':
                return $query->orderBy('scheduled_at', 'desc');
                break;
            default:
                return $query->orderBy('scheduled_at', 'asc');
                break;
        }
    }

    private function handleSearchFilterStatus($status, $query)
    {
        if (in_array('rescheduled', $status)) {
            $query->where('status', 'rescheduled')
                ->whereNull('is_reschedule_handled');
            $status = array_diff($status, ['rescheduled']);
        }
        empty($status) ?  $query :   $query->whereIn('status', $status);
        return $query;
    }

    public function searchFilter($from,  $to, array $status = ['pending', 'inprogress', 'completed', 'cancelled', 'rescheduled'],  $filter = null,  $sort = null,  $paginate = 1)
    {
        $query = $this->model->whereBetween('scheduled_at', [$from, $to]);
        // is_null($status) ? $query : $query->whereIn('status', $status);
        is_null($status) ? $query : $this->handleSearchFilterStatus($status, $query);
        is_null($filter) ? $query : $this->handleSearchFilterFilter($filter, $query);
        is_null($sort) ? $query : $this->handleSearchFilterSort($sort, $status, $query);
        $query
            ->with([
                'user:id,name,phone',
                'user_purchase_request.address.compound:id,title_en'
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
            'user_purchase_request.address.compound:id,title_en'
        ]);


        return $paginate == 1 ?  $query->paginate($this->paginate) : $query->get();
    }

    public function searchBookingID(string $booking_id,  array $status = ['pending', 'inprogress', 'completed', 'cancelled', 'rescheduled'], $paginate = 1)
    {
        return $this->handleSearchBookingID($booking_id, $status, null, null, $paginate);
    }

    public function searchServiceProviderBookingID(string $booking_id, int  $service_provider_id, array $status = ['inprogress', 'completed'], $paginate = 1)
    {
        return $this->handleSearchBookingID($booking_id, $status, null, $service_provider_id, $paginate);
    }

    public function searchUserBookingID(string $booking_id, int $user_id, array $status = ['pending', 'inprogress', 'completed', 'cancelled', 'rescheduled'], $paginate = 1)
    {
        return $this->handleSearchBookingID($booking_id, $status, $user_id, null, $paginate);
    }
}
