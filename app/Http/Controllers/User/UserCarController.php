<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use App\Http\Requests\User\UserCarValidateIDRequest;
use App\Http\Requests\User\UserCarAddRequest;
use App\Models\User;
use App\Notifications\PackageSubscriptionEnded;
use App\Notifications\TestEmailNotification;
use App\Services\Interfaces\UserCarServiceInterface;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;

use App\Models\UserPurchaseRequest;

use App\Notifications\BookingAppointment;


class UserCarController extends Controller
{

    private $userCarService;

    public function __construct(UserCarServiceInterface $userCarService)
    {
        $this->userCarService = $userCarService;
    }


    public function index()
    {
        return $this->userCarService->list(auth('sanctum')->id());
    }

    public function listActive()
    {
        return $this->userCarService->listActive(auth('sanctum')->id());
    }

    public function show(UserCarValidateIDRequest $request, $id)
    {
        return $this->userCarService->show($id);
    }


    public function store(UserCarAddRequest $request)
    {
        return $this->userCarService->create($request->validated());
    }

    public function update(Request $data, $id)
    {
        return $this->userCarService->update($id, $data->all());
    }

    public function destroy(Request $request, int $id)
    {
        return $this->userCarService->destroy($id);
    }

    public function setDefault(Request $request, int $id)
    {
        return $this->userCarService->setDefault($id);
    }

    public function setInactive(Request $request, int $id)
    {
        return $this->userCarService->update($id, ['is_active' => 0]);
    }

    public function sendEmailTesting()
    {
        $purchaseRequest = UserPurchaseRequest::find(92);

//        return response()->json([
//            'data' => $purchaseRequest->user,
//            'message' => 'DONE',
//            'status' => '200',
//        ], 200);

        if (isset($purchaseRequest->user->email) and !empty($purchaseRequest->user->email)) {
            $purchaseRequest->user->notify(new PackageSubscriptionEnded($purchaseRequest));
            return response()->json([
                'message' => 'DONE',
                'status' => '200',
            ], 200);
        }
        return response()->json([
            'message' => 'NOT DONE',
            'status' => '200',
        ], 200);

    }

    public function createQueueTable()
    {
        if (!Schema::hasTable('jobs')) {
            Schema::create('jobs', function (Blueprint $table) {
                $table->bigIncrements('id');
                $table->string('queue')->index();
                $table->longText('payload');
                $table->unsignedTinyInteger('attempts');
                $table->unsignedInteger('reserved_at')->nullable();
                $table->unsignedInteger('available_at');
                $table->unsignedInteger('created_at');
                $table->timestamps();
            });

            return 'JOBS Table created successfully!';
        }
        return 'JOBS Table already exists.';
    }

}

//; MAIL_MAILER=smtp
//; MAIL_HOST=mailpit
//; MAIL_PORT=1025
//; MAIL_USERNAME=6c8c09529ad49d
//; MAIL_PASSWORD=5a7f957cca1e75
//; MAIL_ENCRYPTION=null
//
//; MAIL_FROM_ADDRESS="hello@example.com"
//; MAIL_FROM_NAME="${APP_NAME}"
