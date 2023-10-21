<?php

return [

    'general_error'  => 'هناك خطأ ما. الرجاء معاودة المحاولة في وقت لاحق.',
    
    // VALIDATION
    'not_active' => 'الطلب المختار غير مفعل',
    'name_regex_validation' => 'من فضلك أدخل اسمًا صحيحًا',
    'name_length_validation' => 'يجب أن لا يتجاوز طول نص الاسم 50  حروفٍ/حرفًا',
    'phone_regex_validation' => ' يجب أن يكون الهاتف رقم هاتف محمول في مصر ',
    'phone_unique_validation' => 'تم استخدام الهاتف',
    'phone_exists_validation' => 'الهاتف غير موجود',
    'phone_password_error'   => ' رقم الموبيل/كلمة المرور غير صحيحة',
    'reschedule_to_error_exceed'   =>  ' يجب أن يكون تاريخ إعادة الجدولة الجديد قبل أو يساوي ',
    'reschedule_to_error_less' => ' يجب أن يكون تاريخ إعادة الجدولة الجديد بعد تاريخ اليوم',
    'reschedule_to_error_has_schedule' => 'لديك بالفعل جدول زمني في هذا اليوم',

    'price_incorrect_validation' => 'السعر غير صحيح. السعر يجب ان يكون',


    'date_after_validation' => 'التاريخ يجب أن يكون البدايه من الغد',
    'date_before_validation' => 'التاريخ يجب أن يكون خلال الأسابيع الأربعة القادمة.',

    'service_rate_validation' => 'تم تقييم الخدمة من قبل',

    'user_car_active_package_validation' => 'انت مشترك بالفعل في باقه علي نفس السيارة',
    'user_car_active_service_validation' => 'لقد قمت بحجز هذه الخدمة بالفعل لنفس السيارة في نفس اليوم.',

    'service_date_duplicate_cart_validation' => 'لقد قمت بالفعل بإضافة الخدمة بنفس التاريخ إلى سلة التسوق الخاصة بك',

    // OTP VALIDATION MESSAGES
    'otp_sent' => ' تم إرسال رمز التحقق المكون من 6 أرقام',
    'otp_just_created' => 'من فضلك انتظر دقيقة لأرسال رمز جديد',
    'otp_block_session' => 'لا يمكن معالجة طلبك في الوقت الحالي. يرجى المحاولة مرة أخرى لاحقًا',
    'otp_not_resend_session' => 'تجاوزت الحد الأقصى لمحاولات إعادة إرسال رمز التحقق. يرجى المحاولة مرة أخرى بعد 30 دقيقة',
    'otp_maximum_send' => 'لقد وصلت لأقصي عدد محاولاتز برجاء النتظار و المحاولة لاحقاً',
    'otp_incorrect' =>  'الرمز التحقق غير صحيح',
    'otp_expired' =>  'رمز التحقق غير صالح ',


    'invalid_old_password' => 'كلمة المرور القديمة غير صحيحه',
    'password_changed' => 'تم تغيير كلمة المرور بنجاح',
    'notification_settings_updated_successfully' => 'تم تغيير الاعدادات بنجاح',



    // OTP CONTENT
    'otp_sms_content_one' => 'مرحباً بك في سي جت لخدمات السيارات المتنقلة لتأكيد حسابك, يرجي إدخال الكود: ',
    // 'otp_sms_content_two' => '.هذا الكود صالح ل5 دقائق. يرجي عدم مشاركته',
    'otp_sms_content_two' => ' ',
    

    'action_triggered.request_confirmed.notification.title'=>'تم تأكيد طلبك',
    'action_triggered.request_confirmed.notification.message'=>'تم تأكيد طلبك برقم #:invoice_reference_number',
    'action_triggered.request_confirmed.sms.message'=>'تم تأكيد الطلب الخاصة بك بنجاح. يمكنك الآن مراجعة  الفاتورة من تطبيق C.JET الخاص بنا. شكرًا لاستخدام خدماتنا!',


    'action_triggered.booking_appointment.notification.title'=>'تم تأكيد الحجز',
    'action_triggered.booking_appointment.notification.message'=>'حجزك :booking_number تم تأكيده ليوم :date',
    'action_triggered.booking_appointment.sms.message'=>'تم جدولة موعد :service_title في :date. سيصل فريقنا إلى :address بين :current_working_hours لتقديم أفضل خدمة لك. شكرًا لاختيارك C.JET!',
    
    'action_triggered.booking_rescheduled.notification.title'=>'تأجيل الحجز',
    'action_triggered.booking_rescheduled.notification.message'=>'حجزك :booking_number تم تأجيله ليوم :new_date',
    'action_triggered.booking_rescheduled.sms.message'=>'تم تأجيل حجزك :service_title من :previous_date إلي :date علي عنوان :address . لديك أسئلة؟ تواصل معنا عبر الأبليكشن أو علي رقم خدمة العملاء :customer_phone_number',


    'action_triggered.booking_refunded.notification.title'=>'الغاء الحجز',
    'action_triggered.booking_refunded.notification.message'=>'حجزك :booking_number تم إلغائه. تم رد قيمة الخدمة',
    'action_triggered.booking_refunded.sms.message'=>'تم إلغاء موعد غسيل سيارتك في :date في :address. تم استرداد المبلغ المدفوع ويمكن مشاهدته من خلال تطبيق C.JET. لديك أسئلة؟ تواصل معنا عبر الأبليكشن أو علي رقم خدمة العملاء :customer_phone_number', 
    
    'action_triggered.package_subscription_activated.notification.title'=>'تم تفعيل الأشتراك',
    'action_triggered.package_subscription_activated.notification.message'=>'أشتراكك برقم :invoice_reference_number تم تفعيله.',
    'action_triggered.package_subscription_activated.sms.message'=>'تم تنشيط اشتراك حزمة تنظيف السيارات الخاص بك بنجاح. استمتع بالعناية بسيارتك بسهولة مع C.JET. هل تحتاج إلى مساعدة؟ تواصل معنا من خلال التطبيق أو اتصل بنا على :customer_support_number',

    'action_triggered.package_subscription_cancelled.notification.title'=>'تم الغاء الأشتراك',
    'action_triggered.package_subscription_cancelled.notification.message'=>'أشتراكك برقم :invoice_reference_number تم إلغائه.',
    'action_triggered.package_subscription_cancelled.sms.message'=>'إلغاء اشتراك حزمة تنظيف سيارتك تم بنجاح. يمكنك الاستمتاع بالحجوزات المجدولة الباقية حتى [تاريخ الأنتهاء]. هل تحتاج إلى مساعدة؟ اتصل بنا من خلال تطبيقنا أو عبر رقم الدعم الخاص بنا :customer_support_number.',

    'action_triggered.package_subscription_ended.notification.title'=>'تم أنتهاء الأشتراك',
    'action_triggered.package_subscription_ended.notification.message'=>'أشتراكك برقم :invoice_reference_number أنتهي.',
    'action_triggered.package_subscription_ended.sms.message'=>'انتهى اشتراك حزمة تنظيف سيارتك. للاستمرار في الاستفادة من خدماتنا، قم بتجديد اشتراكك من خلال تطبيق C.JET. هل تحتاج إلى مساعدة؟ اتصل بنا من خلال تطبيقنا أو عبر رقم الدعم الخاص بنا :customer_support_number.',

    
    'action_triggered.package_subscription_renewed.notification.title'=>'تم تجديد الأشتراك',
    'action_triggered.package_subscription_renewed.notification.message'=>'تم تجديد أشتراكك. يمكنك رؤية الفاتورة  :invoice_reference_number',
    'action_triggered.package_subscription_renewed.sms.message'=>'أخبار رائعة! تم تجديد اشتراك حزمة تنظيف سيارتك بنجاح. استمتع بخدماتنا بسهولة ومن دون أي عناء. خلال تطبيق C.JET. هل تحتاج إلى مساعدة؟ اتصل بنا من خلال تطبيقنا أو عبر رقم الدعم الخاص بنا :customer_support_number.',  
    
    'action_triggered.upcoming_booking_reminder.notification.title'=>'لديك حجز اليوم',
    'action_triggered.upcoming_booking_reminder.notification.message'=>' حجزك :booking_number بتاريخ :date اليوم',
    'action_triggered.upcoming_booking_reminder.sms.message'=>'لا تنس موعد :service_title المجدول في :date في :address. سنكون هناك لنقدم لسيارتك العناية التي تستحقها. هل تحتاج إلى إعادة جدولة؟ يمكنك تغيير الموعد من خلال التطبيق أو اتصل بنا على :customer_support_number."',  

    'action_triggered.package_booking_cancelled.notification.title'=>'تم إلغاء الحجز',
    'action_triggered.package_booking_cancelled.notification.message'=>'تم إلغاء الحجز الجدول في باقتك برقم :booking_number.',
    'action_triggered.package_booking_cancelled.sms.message'=>'تم تأكيد الطلب الخاصة بك بنجاح. يمكنك الآن مراجعة  الفاتورة من تطبيق C.JET الخاص بنا. شكرًا لاستخدام خدماتنا!',


 
    'action_triggered.new_assigned_task.sms.message'=>'تم تكليفك بمهمة تنظيف :service_title في :address في :date. هل تحتاج إلى مساعدة؟ اتصل بنا على :customer_support_number.',
    
    
 
    'action_triggered.task_appointment_reminder.sms.message'=>'لديك مهمة [عنوان الخدمة] مجدولة للغد في :date لصالح العميل :customer_name، :car_model في :address. يرجى الاستعداد ولا تنسى الاتصال بالعميل على [رقم العميل] في يوم الخدمة. هل تحتاج إلى مساعدة؟ اتصل بنا على [رقم الدعم].',
 
    'action_triggered.new_package_assigned_task.sms.message'=>'تم تكليفك بحجز اشتراك في مواعيد متكررة للعميل :customer_name. المواعيد المتكررة لسيارتهم من طراز :car_model مجدولة بتردد :frequency ابتداءً من [تاريخ البداية]. الموعد الأول هو في [التاريخ والوقت] في :address. هل تحتاج إلى مساعدة؟ اتصل بنا على :customer_support_number.',

    
 


 


];
