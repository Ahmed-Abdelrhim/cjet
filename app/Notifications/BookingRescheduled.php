<?php

namespace App\Notifications;

use App\Models\Setting;
use App\Models\UserPurchaseRequest;
use App\Models\UserPurchaseSchedule;
use Carbon\Carbon;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;

class BookingRescheduled extends Notification implements ShouldQueue
{
    use Queueable;
    private $title;
    private $notification;
    private $notification_paramaters;

    private $sms;
    private $sms_paramaters;
    private $entity;
    private $type;
/**
     * Create a new notification instance.
     */
    public function __construct(UserPurchaseSchedule $entity)
    {
        $this->title='custom.action_triggered.booking_rescheduled.notification.title';
        $this->notification='custom.action_triggered.booking_rescheduled.notification.message';
        $this->notification_paramaters=['booking_number'=>$entity->user_purchase_reference,'new_date'=>$entity->rescheduled_at];
        $this->sms='custom.action_triggered.booking_rescheduled.sms.message';
        $this->sms_paramaters=['service_title'=>$entity->title_en,'current_working_hours'=>Setting::where('type','working_hours')->first()->value];
        $this->entity=$entity;
         $this->type='request';
    }

    /**
     * Get the notification's delivery channels.
     *
     * @return array<int, string>
     */
     public function via(object $notifiable): array
    {
        return ['mail', 'database'];
    }

    public function toMail($notifiable)
    {
        $user = $notifiable;
        return (new MailMessage)->view('emails.booking-appointment', ['data' => $this->entity ,'user' => $user]);
    }


    /**
     * Get the array representation of the notification.
     *
     * @return array<string, mixed>
     */
  public function toArray(object $notifiable): array
    {
        return [
            'date'=>Carbon::now(),
            'title'=>$this->title,
            'notification'=>$this->notification,
            'notification_paramaters'=>$this->notification_paramaters,
            'id'=>$this->entity->id,
            'type'=>$this->type
        ];
    }
}
