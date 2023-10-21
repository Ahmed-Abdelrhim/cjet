<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;

class NewPackageSubscriptionAssigned extends Notification implements ShouldQueue
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
        $this->title='custom.action_triggered.request_confirmed.notification.title';
        $this->notification='custom.action_triggered.request_confirmed.notification.message';
        $this->notification_paramaters=['invoice_reference_number'=>$entity->invoice_reference_number];
        $this->sms='custom.action_triggered.request_confirmed.sms.message';
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
        return ['database'];
    }
    /**
     * Get the mail representation of the notification.
     */
    // public function toMail(object $notifiable): MailMessage
    // {
    //     return (new MailMessage)
    //                 ->line('The introduction to the notification.')
    //                 ->action('Notification Action', url('/'))
    //                 ->line('Thank you for using our application!');
    // }

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
    public function toFirebase($notifiable)
    {
        return (new FirebaseMessage)
            ->withTitle($this->title)
            ->withBody($this->message)
            ->withPriority('high')->asMessage($this->fcmTokens);
    }
}
