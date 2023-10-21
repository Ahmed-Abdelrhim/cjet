<?php

namespace App\Repositories\Eloquent;

use App\Models\Package;
use App\Models\Service;
use App\Models\Invoice;
use App\Repositories\Interfaces\InvoiceRepositoryInterface;

class InvoiceRepository implements InvoiceRepositoryInterface
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
    public function __construct(Invoice $model)
    {
        $this->model = $model;
        $this->paginate = 10;
    }


    public function all()
    {
        return $this->model
            ->get();
    }



    public function allWithDetails()
    {
        return $this->model
            ->with(['invoice_user_purchase_request.user_purchase_request', 'user'])
            ->get();
    }

    public function paginate()
    {
        return $this->model
            ->with(['invoice_user_purchase_request.user_purchase_request', 'user'])
            ->paginate($this->paginate);
    }

    public function create(array $data)
    {
        return $this->model
            ->create($data);
    }


    public function show(int $id)
    {
        return $this->model
            ->with(['invoice_user_purchase_request.user_purchase_request', 'user'])
            ->find($id);
    }




    public function getWithDetails(int $id)
    {
        return $this->model
            ->where('id', $id)
            ->with([
                'user:id,name,phone,image',
                'invoice_user_purchase_request.user_purchase_request.address.compound:id,title_en'
            ])
            ->first();
    }



    public function getWhereInIDs(array $ids)
    {
        return $this->model
            ->whereIn('id', $ids)
            ->with([
                'user:id,name,phone,image',
                'invoice_user_purchase_request.user_purchase_request'
            ])
            ->get();
    }



    public function searchUserSchedules(int $user_id, $from, $to, $filter, $paginate = 1)
    {
        $query = $this->model->where('user_id', $user_id)->whereBetween('scheduled_at', [$from, $to]);

        (is_null($filter)) ? $query : $query->where('status', $filter);

        $query->with([
            'user:id,name,phone',
            'invoice_user_purchase_request.user_purchase_request.address.compound:id,title_en'
        ])->orderBy('scheduled_at', 'desc');

        return $paginate == 1 ?  $query->paginate($this->paginate) : $query->get();
    }



    private function handleSearchFilterFilter($filter, $query)
    {
        switch ($filter) {
            case 'service':
                return $query->where('purchaseable_type',  Service::class);
            case 'package':
                return $query->where('purchaseable_type',  Package::class);
            case 'purchase':
                return $query->where('invoice_type', 'purchase');
            case 'refund':
                return $query->where('invoice_type', 'refund');
            default:
                return $query;
        }
    }

    private function handleSearchFilterSort($sort, $query)
    {
        if ($sort == 'oldest') {
            return $query->orderBy('id', 'asc');
        }
        return $query->orderBy('id', 'desc');
    }


    public function searchFilter($from,  $to, $filter = null,  $sort = null,  $paginate = 1)
    {
        $query = $this->model->whereBetween('created_at', [$from, $to]);

        $this->handleSearchFilterFilter($filter, $query);

        $this->handleSearchFilterSort($sort, $query);

        $query
            ->with([
                'user:id,name,phone',
                'invoice_user_purchase_request.user_purchase_request'
            ]);

        return $paginate == 1 ?  $query->paginate($this->paginate) : $query->get();
    }



    public function searchInvoiceID(string $invoice_reference_number,  $paginate = 1)
    {
        $query = $this->model
            ->where('invoice_reference_number', 'like', '%' . $invoice_reference_number . '%')
            ->with([
                'user:id,name,phone',
                'invoice_user_purchase_request.user_purchase_request'
            ]);


        return $paginate == 1 ?  $query->paginate($this->paginate) : $query->get();
    }
    public function allInvoicesByUserId( int $id)
    {
        return $this->model->where('user_id',$id)
            ->get();
    }


    public function getWithDetailsWithSummaryArray(int $id)
    {
        return $this->model
            ->where('id', $id)
            ->with([
                'user:id,name,phone,image',
                'invoice_user_purchase_request.user_purchase_request.address.compound:id,title_en'
            ])
            ->first();
    }

}
