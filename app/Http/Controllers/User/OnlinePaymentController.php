<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\UserPurchaseRequest;
use App\Traits\ResponseTrait;
use Carbon\Carbon;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Schema;
use App\Models\Payment;


class OnlinePaymentController extends Controller
{
    use ResponseTrait;
//    private $userPurchaseRequestService;

//    public function __construct()
//    {
//
//    }



    public function payment(Request $request)
    {
        $token = $this->getToken();
        // =================================================================================================
        // $userId = auth('sanctum')->id();
        $userId = 23;
        $user = User::find($userId);
        if (!$user) {
            return response()->json([
                'status' => 400,
                'message' => 'User was not found',
            ], 400);
        }

        //$userPurchaseRequestId = $request->get('user_purchase_request_id');
        $userPurchaseRequestId = 81;

        $userPurchaseRequest = UserPurchaseRequest::find($userPurchaseRequestId);
        if (!$userPurchaseRequest) {
            return response()->json([
                'status' => 400,
                'message' => 'Purchase request was not found',
            ], 400);
        }
        $amount = $userPurchaseRequest->price;
        // =================================================================================================


        $order = $this->createOrder($token, $userPurchaseRequest);


        $orderId = $order->id;
        Payment::create([
            'order_id' => $orderId,
            'user_id' => $userId,
            'user_purchase_request_id' => $userPurchaseRequestId,
            'amount' => $userPurchaseRequest->price,
            'currency' => 'EGP',
            'created_at' => Carbon::now(),
        ]);

        // store the $order->id
        // 4987654321098769  5123456789012346
        // Test Account
        // 12/25
        // 123


        $paymentToken = $this->getPaymentToken($order, $token, $user, $amount);
        return \Redirect::away('https://portal.weaccept.co/api/acceptance/iframes/' . config('app.PAYMENT_IFRAME_ID') . '?payment_token=' . $paymentToken); // Todo :: string

    }

    public function getToken()
    {
        $response = Http::post('https://accept.paymob.com/api/auth/tokens', [
            'api_key' => config('app.PAYMENT_API_KEY'),
        ]);
        return $response->object()->token;
    }

    public function createOrder($token, $purchaseRequest, $currency = 'EGP')
    {
        $items = [
            [
                "name" => !empty($purchaseRequest->title_en) ? $purchaseRequest->title_en : 'Title Should Be Here',
                "amount_cents" => $purchaseRequest->price,
                "description" => !empty($purchaseRequest->description_en) ? $purchaseRequest->description_en : 'description Should Be Here',
                "quantity" => "1"
            ]
        ];

        $data = [
            "auth_token" => $token,
            "delivery_needed" => "false",
            "amount_cents" => $purchaseRequest->price,
            "currency" => "EGP",
            "items" => $items,
        ];

        $response = Http::post('https://accept.paymob.com/api/ecommerce/orders', $data);
        return $response->object();
    }

    public function getPaymentToken($order, $token, $user, $amount)
    {
        $fullName = $user->name;
        $nameParts = explode(' ', $fullName, 2);
        if (count($nameParts) === 2) {
            list($firstName, $lastName) = $nameParts;
            $first_name = $nameParts[0];
            $last_name = $nameParts[1];
        } else {
            $firstName = $user->name;
            $last_name = $user->name;
        }

        $billingData = [
            "apartment" => "NA",
            "email" => $user->email ? $user->email : 'user@mail.com',
            "floor" => "NA",
            "first_name" => $first_name,
            "street" => "NA",
            "building" => "NA",
            // "phone_number" => "+86(8)9135210487",
            "phone_number" => "+20" . $user->phone ? $user->phone : '01111111111',
            "shipping_method" => "NA",
            "postal_code" => "NA",
            "city" => "NA",
            "country" => "EGYPT",
            "last_name" => $last_name,
            "state" => "NA"
        ];
        $data = [
            "auth_token" => $token,
            "amount_cents" => $amount,
            "expiration" => 3600,
            "order_id" => $order->id,
            "billing_data" => $billingData,
            "currency" => "EGP",
            "integration_id" => config('app.PAYMENT_INTEGRATION_ID'),
        ];
        $response = Http::post('https://accept.paymob.com/api/acceptance/payment_keys', $data);
        return $response->object()->token;
    }


    public function successPayment(Request $request)
    {
        $data = $request->all();
        ksort($data);
        $hmac = $data['hmac'];
        $array = [
            'amount_cents',
            'created_at',
            'currency',
            'error_occured',
            'has_parent_transaction',
            'id',
            'integration_id',
            'is_3d_secure',
            'is_auth',
            'is_capture',
            'is_refunded',
            'is_standalone_payment',
            'is_voided',
            'order',
            'owner',
            'pending',
            'source_data_pan',
            'source_data_sub_type',
            'source_data_type',
            'success',
        ];
        $connectedString = '';
        foreach ($data as $key => $element) {
            if (in_array($key, $array)) {
                $connectedString .= $element;
            }
        }
        $secret = config('app.PAYMENT_HMAC');
        $hased = hash_hmac('sha512', $connectedString, $secret);
        if ($hased == $hmac) {
            $orderId = $data['order'];
            $transactionId = $data['id'];

            if (empty($orderId)) {
                return response()->json([
                    'message' => 'Something went wrong : OrderId was not found ',
                    'success' => 'failed',
                ], 400);
            }

            $order = Payment::where('order_id', $orderId)->with('user')->latest()->first();
            if (!$order) {
                return response()->json([
                    'message' => 'Something went wrong : ',
                    'success' => 'failed',
                ], 400);
            }
            // PAYMENT is secure and successful
            if (!$data['pending'] and $data['success']) {
                $order->payment_status = 'SUCCESS';
                $order->payment_pending = 'FALSE';
                $order->paymob_transaction_id = $transactionId;
                $order->paid_at = Carbon::now();
                $order->save();
                return response()->json([
                    'message' => 'Payment successful',
                    'success' => 'true',
                ], 200);
            }
            // PAYMENT is secure but was not successful
            $order->payment_status = 'FAILED';
            $order->payment_pending = !$data['pending'] ? 'FALSE' : $data['pending'];
            $order->paymob_transaction_id = $transactionId;
            $order->paid_at = Carbon::now();
            $order->save();
            return $data;
        }


        // PAYMENT is not secure
        return $data;
    }

    public function success(Request $request)
    {
        // here check if payment was success or not
        // return $data = $request->all();
    }

    public function createPaymentTable()
    {
        if (!Schema::hasTable('payments')) {
            Schema::create('payments', function (Blueprint $table) {
                $table->id();
                $table->bigInteger('order_id');
                $table->bigInteger('user_id');
                 $table->bigInteger('user_purchase_request_id');
//                $table->enum('type', ['service', 'package']);
//                $table->json('reference_id');

                $table->string('payment_status')->nullable();
                $table->string('payment_pending')->nullable();
                $table->string('amount')->nullable();
                $table->string('currency')->nullable();
                $table->bigInteger('paymob_transaction_id')->nullable();
                $table->dateTime('paid_at')->nullable();
                $table->timestamps();
            });
            return 'Payments Table created successfully!';
        }
        return 'Payments Table already exists.';
    }


}
