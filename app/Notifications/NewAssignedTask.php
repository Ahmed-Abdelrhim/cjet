<?php

namespace App\Notifications;

use App\Models\UserPurchaseRequest;
use Carbon\Carbon;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;

class NewAssignedTask extends Notification implements ShouldQueue
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
    public function __construct(UserPurchaseRequest $entity)
    {
        $this->title='custom.action_triggered.new_assigned_task.notification.title';
        // $this->notification='custom.action_triggered.new_assigned_task.notification.message';
        // $this->notification_paramaters=['invoice_reference_number'=>$entity->invoice_reference_number];
        $this->sms='custom.action_triggered.new_assigned_task.sms.message';
        $this->sms_paramaters=[];
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
