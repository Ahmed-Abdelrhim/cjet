<?php

return [
    'general_error' => 'Something went wrong. Please try again later.',

    // VALIDATION
    'not_active' => 'Selected request is not active.',
    'name_regex_validation' => 'Please enter a valid name.',
    'name_length_validation' => 'The name must not be greater than 50 characters.',
    'phone_regex_validation' => 'Phone should be an Egypt mobile number.',
    'phone_unique_validation' => 'The phone has already been used.',
    'phone_exists_validation' => 'The phone does not exist.',
    'phone_password_error'   =>  'Mobile Number/Password incorrect.',
    'reschedule_to_error_exceed'   =>  'New reschedule date must be before or equal.',
    'reschedule_to_error_less'  =>  'New reschedule date must be after today date. ',
    'reschedule_to_error_has_schedule' => 'You already have a package schedule on this day.',


    'price_incorrect_validation' => 'The price is incorrect. It should be ',

    'date_after_validation' => 'The start date must start from minimum tomorrow.',
    'date_before_validation' => 'The date must be within the next 4 weeks.',

    'service_rate_validation' => 'You already rated this service.',

    'user_car_active_package_validation' => 'You already have an active package on the same car.',
    
    'user_car_active_service_validation' => 'You have already booked service for the same car on the same day.',

    'service_date_duplicate_cart_validation' => 'You have already added  service with same date to your cart.',

    // OTP VALIDATION MESSAGES
    'otp_sent' => 'A 6-digit verification code has been sent',
    'otp_just_created' => 'Please wait 1 minute to generate new OTP',
    'otp_block_session' => 'Your request cannot be processed at this time. Please try again later ',
    'otp_not_resend_session' => 'Your reached maximum number of send trials. Try again later.',
    'otp_maximum_send' => 'Maximum number of resend attempts reached. please try again after 30 minutes. ',
    'otp_incorrect' => 'Verification code is incorrect',
    'otp_expired' => 'OTP Code expired',



    'invalid_old_password' => 'Invalid Old Password',
    'password_changed' => 'Password Changed Successfully',
    'notification_settings_updated_successfully'=>'Notifications Settings Updated Successfully',

    // OTP CONTENT
    'otp_sms_content_one' => 'Welcome to C.JET Mobile Car Services! To verify your account, please enter the following OTP:  ',
    // 'otp_sms_content_two' => '. This code is valid for 5 minutes. Please keep it confidential.'
    'otp_sms_content_two' => ' ',



    // You reached maximum number of trials | تم الوصول لأقصي عدد من المحاولات


    'action_triggered.request_confirmed.notification.title'=>'Request Confirmed',
    'action_triggered.request_confirmed.notification.message'=>'Your request with ID #:invoice_reference_number has been confirmed',
    'action_triggered.request_confirmed.sms.message'=>'Your request has been successfully confirmed. You can now review the invoice from our C.JET app. Thank you for using our services!',


    'action_triggered.booking_appointment.notification.title'=>'Booking Scheduled',
    'action_triggered.booking_appointment.notification.message'=>'Your Booking ID: :booking_number, is confirmed to :date',
    'action_triggered.booking_appointment.sms.message'=>'Your :service_title booking on :date is scheduled. Our team will arrive at :address between :current_working_hours to provide you with the best service. Thank you for choosing C.JET!',
    
    'action_triggered.booking_rescheduled.notification.title'=>'Booking Rescheduled',
    'action_triggered.booking_rescheduled.notification.message'=>'Your Booking ID: :booking_number, is rescheduled to :new_date',
    'action_triggered.booking_rescheduled.sms.message'=>'Your :service_title appointment on :previous_date has been rescheduled to :new_date at :address. Got a question? Contact us through our app or on our support number :customer_phone_number.',


    'action_triggered.booking_refunded.notification.title'=>'Service Booking Cancelled',
    'action_triggered.booking_refunded.notification.message'=>'Your booking :booking_number, has been cancelled. The amount has been refunded.',
    'action_triggered.booking_refunded.sms.message'=>'Your :service_title appointment on :date at :address has been cancelled. The paid amount has been refunded and the invoice can be viewed through our app, got a question? Contact us through our app or support number :customer_phone_number.', 
    
    'action_triggered.package_subscription_activated.notification.title'=>'Package Subscription Activated',
    'action_triggered.package_subscription_activated.notification.message'=>'Your Subscription plan with ID #:invoice_reference_number is now activated.',
    'action_triggered.package_subscription_activated.sms.message'=>'Your car cleaning package subscription has been successfully activated. Enjoy hassle-free car care with C.JET. Need assistance? Contact us through our app or support number :customer_support_number.',

    'action_triggered.package_subscription_cancelled.notification.title'=>'Package Subscription Cancelled',
    'action_triggered.package_subscription_cancelled.notification.message'=>'Your Subscription plan with ID #:invoice_reference_number has been cancelled.',
    'action_triggered.package_subscription_cancelled.sms.message'=>'Your car cleaning package subscription has been cancelled. You can enjoy the rest of your scheduled bookings till :date. Need assistance? Contact us through our app or support number :customer_support_number.',

    'action_triggered.package_subscription_ended.notification.title'=>'Package Subscription Ended',
    'action_triggered.package_subscription_ended.notification.message'=>'Your Subscription plan with ID #:invoice_reference_number has ended.',
    'action_triggered.package_subscription_ended.sms.message'=>'Your car cleaning package subscription has expired. To continue enjoying our services, renew your subscription through the C.JET app. Need assistance? Contact us through our app or support number :customer_support_number.',

    
    'action_triggered.package_subscription_renewed.notification.title'=>'Package Subscription Renewed',
    'action_triggered.package_subscription_renewed.notification.message'=>'Your Subscription plan has been renewed. Here is your invoice #:invoice_reference_number.',
    'action_triggered.package_subscription_renewed.sms.message'=>'Great news! Your car cleaning package subscription has been successfully renewed. Continue enjoying our services hassle-free. Need assistance? Contact us through our app or support number :customer_support_number.',  
    
    'action_triggered.upcoming_booking_reminder.notification.title'=>'You have an upcoming booking',
    'action_triggered.upcoming_booking_reminder.notification.message'=>'Your booking :booking_number on :date is today.',
    'action_triggered.upcoming_booking_reminder.sms.message'=>'Don\'t forget your :service_title appointment scheduled for :date at :address. We\'ll be there to give your car the care it deserves. Need to reschedule? You can reschedule through our app or contact us at :customer_support_number.',  

    'action_triggered.package_booking_cancelled.notification.title'=>'Package Booking Cancelled',
    'action_triggered.package_booking_cancelled.notification.message'=>'Your package booking with ID :booking_number has been cancelled.',
    'action_triggered.package_booking_cancelled.sms.message'=>'Your request has been successfully confirmed. You can now review the invoice from our C.JET app. Thank you for using our services!',



 
    'action_triggered.new_assigned_task.sms.message'=>'You\'ve been assigned the task of :service_title at :address on :date. Need assistance? Contact us at :customer_support_number.',
    
    
 
    'action_triggered.task_appointment_reminder.sms.message'=>'You have a :service_title task scheduled for tomorrow at :date for :customer_name, :car_model at :address. Please be prepared & don\'t forget to contact client :customer_phone_number on the day of service. Need assistance? Contact us at :customer_support_number.',

 
    'action_triggered.new_package_assigned_task.sms.message'=>'You\'ve been assigned to a package appointment subscription for :customer_name. Your recurring appointments for their :car_model are scheduled for :frequency starting from :date. The first appointment is on :date at :address. Need assistance? Contact us at :customer_support_number.',

    

];
