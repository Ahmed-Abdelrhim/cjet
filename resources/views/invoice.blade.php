<!DOCTYPE html>
<html>

<head>
    <title>CJet Invoice</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Raleway:wght@300;600;700;800;900&family=Space+Grotesk:wght@300;400;500;700&display=swap');
    </style>


</head>
<style type="text/css">
    * {
        margin: 0;
        padding: 0;
        font-family: 'Raleway', sans-serif;
        font-family: 'Space Grotesk', sans-serif;
    }

    body {
        background-color: #EFF9FE;
        padding: 2.5rem;
        font-size: 14px;
    }

    .m-0 {
        margin: 0px;
    }

    .p-0 {
        padding: 0px;
    }

    .pt-5 {
        padding-top: 5px;
    }

    .mt-10 {
        margin-top: 10px;
    }

    .text-center {
        text-align: center !important;
    }

    .text-right {
        text-align: right !important;
    }

    .text-left {
        text-align: left !important;
    }

    .w-100 {
        width: 100%;
    }

    .w-50 {
        width: 50%;
    }

    .w-85 {
        width: 85%;
    }

    .w-15 {
        width: 15%;
    }

    .w-40 {
        width: 40%;
    }

    /* .logo img{
        width:200px;
        height:60px;
    } */
    .gray-color {
        color: #5D5D5D;
    }

    .text-bold {
        font-weight: bold;
    }

    /* .border{
        border:1px solid black;
    }
    table tr,th,td{
        border: 1px solid #d2d2d2;
        border-collapse:collapse;
        padding:7px 8px;
    } */
    table tr th {
        /* background: #F4F4F4;
        font-size:15px; */
        border-bottom: 1px solid #9397A0;
        border-top: 1px solid #9397A0;
        color: #58595B;
        font-weight: 300;
    }

    /* table tr td{
        font-size:13px;
    } */
    tr td,
    tr th {
        padding: 1rem 0;
    }

    table {
        width: 100%;
        margin-bottom: 1rem;
        color: #212529;
        vertical-align: top;
        border-color: #dee2e6;
        caption-side: bottom;
        border-collapse: collapse;
    }

    .box-text p {
        line-height: 10px;
    }

    .float-left {
        float: left;
    }

    .total-part {
        font-size: 14px;
        line-height: 12px;
    }

    /* .total-right p{
        padding-right:20px;
    } */
    .clr-active {
        color: #2266E1;
    }

    .d-inline-block {
        display: inline-block;
    }

    .head-title h1 {
        font-size: 48px;
    }

    .calculate {
        border-top: 1px solid #9397A0;
        padding: 1rem 0;
        margin-left: auto;
    }

    .calculate * {
        font-weight: 300;
    }

    .calculate:last-child * {
        font-weight: 700;
    }

    .footer {
        border-top: 1px solid #9397A0;
    }

    .h6,
    h6 {
        font-size: 14px;
        font-weight: 300;
    }

    .fw-bold {
        font-weight: 700;
    }

    .fw-medium {
        font-weight: 500;
    }

    .col-count {
        column-count: 2;
    }

    .font-18 {
        font-size: 18px;
    }

    .my-4 {
        margin-top: 1.5rem;
        margin-bottom: 1.5rem;
    }

    .mb-2 {
        margin-bottom: 0.5rem !important;
    }

    .mb-1 {
        margin-bottom: 0.25rem !important;
    }

    .mt-5 {
        margin-top: 3rem !important;
    }

    .pt-3 {
        padding-top: 1rem !important;
    }
    .fw-light {
        font-weight: 300
    }
</style>

<body>

    <div class="add-detail">
        <div class="w-50 float-left head-title">
            <h1 class="m-0 p-0 clr-active">
                <?= $invoice_data['invoice_type'] == 'purchase' ? 'Invoice' : 'Refund Receipt' ?>
            </h1>
        </div>
        <div class="w-50 float-left logo text-right">
            <!-- <img src="logo.png" alt="Logo"> -->
            <img src="https://social-nuts.tech/cjet/logo.png" alt="cjet logo">

        </div>
        <div style="clear: both;"></div>
    </div>
    <div class="add-detail my-4 pt-3">
        <div class="w-50 float-left">
            <p class="m-0 pt-5 text-bold w-100">
                <span class="clr-active w-40 d-inline-block">INVOICE ID</span>
                <span class="gray-color">{{ $invoice_data['invoice_id'] ?? null }}</span>
            </p>
            <p class="m-0 pt-5 text-bold w-100">
                <span class="clr-active w-40 d-inline-block">REQUEST ON</span>
                <span class="gray-color">{{ $invoice_data['request_on'] ?? null }}</span>
            </p>
        </div>
        <div style="clear: both;"></div>
    </div>
    <div class="add-detail my-4 pt-3">
        <div class="w-50 float-left text-bold ">
            <span class="clr-active w-40 d-inline-block text-bold mb-1">C.JET</span>
            <p class="mb-1 gray-color">{{ $setting_data['email'] ?? null }}</p>
            <p class="mb-1 gray-color">{{ $setting_data['phone'] ?? null }}</p>
        </div>
        <div class="w-50 float-left">
            <span class="clr-active w-40 d-inline-block text-bold mb-1">Bill To</span>

            <div class="col-count text-bold ">
                <p class="mb-1 gray-color">{{ $invoice_data['user']->name ?? null }}</p>
                <p class="mb-1 gray-color">{{ $invoice_data['user']->phone ?? null }}</p>
                <p class="mb-1 gray-color">{{ $invoice_data['user_address'] ?? null }}</p>
            </div>
        </div>
        <div style="clear: both;"></div>
    </div>

    <div class="table-section bill-tbl w-100  my-4 ">
        <table class="table w-100 mt-10">
            <tr align="left">
                <th>Description </th>
                <th style="width: 100px;">Amount</th>
            </tr>
            <?php $data_invoice_summary = $invoice_data['invoice_summary']->resolve(); ?>
            @if ($invoice_data['type'] == 'Package')
                <tr>
                    <td>
                        <h6 class="mb-0 fw-light">{{ $data_invoice_summary['title'] ?? ' ' }}</h6>
                        <p class="mb-0 fw-light">{{ date('F j, Y', strtotime($data_invoice_summary['start_date']))?? ' ' }} -
                            {{ $data_invoice_summary['end_date'] ?? ' ' }} </p>
                    </td>
                    <td>{{ $data_invoice_summary['price_number'] .' EGP'?? ' ' }}</td>
                </tr>
            @else
                @foreach ($data_invoice_summary as $invoice)
                    <tr>
                        <td>
                            <h6 class="mb-0 fw-light">{{ $invoice['title'] ?? ' ' }}</h6>
                            <p class="mb-0 fw-light">{{ date('F j, Y', strtotime($invoice['start_date'])) ?? ' ' }}
                            </p>
                        </td>
                        <td class="fw-light"">{{ $invoice['price_number'] . ' EGP' ?? ' ' }}</td>
                    </tr>
                @endforeach
            @endif
        </table>

        <div class="total-part calculate w-50">
            <div class="total-left w-50 float-left text-left">
                <p>
                    Total Amount
                    <?= $invoice_data['invoice_type'] == 'purchase' ? 'Paid' : 'Refuded' ?>
                </p>
            </div>
            <div class="total-right w-50 float-left text-bold" align="right">
                <p><?= $invoice_data['invoice_total'] ?></p>
            </div>
            <div style="clear: both;"></div>
        </div>
    </div>

</html>
