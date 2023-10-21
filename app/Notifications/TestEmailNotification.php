<?php


namespace App\Notifications;

use App\Models\Setting;
use App\Models\UserPurchaseRequest;
use Carbon\Carbon;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;

class TestEmailNotification extends Notification implements ShouldQueue // Implement ShouldQueue
{
    use Queueable;

    public function via(object $notifiable): array
    {
        return ['mail'];
    }

    public function toArray(object $notifiable): array
    {
        return [
            'date' => Carbon::now(),
            'title' => $this->title,
            'notification' => $this->notification,
            'notification_paramaters' => $this->notification_paramaters,
            'id' => $this->entity->id,
            'type' => $this->type
        ];
    }

    public function toMail($notifiable)
    {
        return (new MailMessage)
            ->greeting('greeting hi ahmed ')
            ->line('message content')
            ->action('Notification Action', url('/'))
            ->line('message thanks');
    }
}

