<?php

namespace App\Console\Commands;

use App\Services\Interfaces\UserPurchaseRenewRequestServiceInterface;
use App\Services\Interfaces\UserPurchaseRequestServiceInterface;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\Log;

class PackageRenewCommand extends Command
{
    private $userPurchaseRenewRequestService;
    
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'package:renew';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Package Subscription Renew Recurrence';


       /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct(UserPurchaseRenewRequestServiceInterface $userPurchaseRenewRequestService)
    {
        parent::__construct();
        $this->userPurchaseRenewRequestService = $userPurchaseRenewRequestService;
    }

    /**
     * Execute the console command.
     */
    public function handle()
    {
        // $this->userPurchaseRenewRequestService->renew();
        // Log::info($this->userPurchaseRenewRequestService->renew());
    }
}
