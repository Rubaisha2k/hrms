<?php

if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

class Pushnotification
{

    public $CI;

	//com.qdocs.smartschool
    public $API_ACCESS_KEY = "AAAAfjlbuHo:APA91bHT-tSzVmeCZgddUflhLkFxdD0vqKFdZOSusHLs0JSglGqvJZQcxUdKBLw-rmgvIR8ZKNDsNodNm8UxjGb-1pF6hbukoUWkUkRqV6X7e1O6s__8etJsdAZHuuE8oRWekwR7lrQK";
    public $fcmUrl         = "https://fcm.googleapis.com/fcm/send";

    public function __construct()
    {
        $this->CI = &get_instance();

    }

    public function send($tokens, $msg, $action = "")
    {

        
        $notificationData = [
            'title'  => $msg['title'],
            'body'   => $msg['body'],
            'action' => $action,
            'sound'  => 'mySound',
        ];

        $fcmNotification = [

            'to'          => $tokens, //single token
            'collapseKey' => "{$tokens}",
            'data'        => $notificationData,

        ];
        $headers = [
            'Authorization: key=' . $this->API_ACCESS_KEY,
            'Content-Type: application/json',
        ];

        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $this->fcmUrl);
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($fcmNotification));
        $result = curl_exec($ch);
        curl_close($ch);

        return true;

    }

}
