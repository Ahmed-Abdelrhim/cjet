<?php

namespace App\Exports;

use App\Models\User;
use Maatwebsite\Excel\Concerns\Exportable;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\ShouldAutoSize;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithMapping;

class UserPurchaseSchedulesCompletedExport implements FromCollection, ShouldAutoSize, WithHeadings
{
    use Exportable;

    private $data;

    public function __construct( $data)
    {
        $this->data = $data;
    }

    /**
     * @return \Illuminate\Support\Collection
     */
    public function collection()
    {
        return $this->data;
    }


    public function headings(): array
    {
        return [
            'id',
            'booking id',
            'scheduled on', 
            'type' ,
            'requester name',
            'mobile no',
            'address',
            'requested on',
            'status',
            'service rate',
        ];
    }
}
