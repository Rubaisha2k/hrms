<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class SaveToken extends CI_Controller {
    public function __construct()
    {
        parent::__construct();
        $this->load->helper('json_output_helper.php');
        $this->load->database();
        $this->load->library('session');
        $this->load->model('Signup_Model');

    }
public function index()
{
    $method = $this->input->server("REQUEST_METHOD");
    if($method!= "POST")
    {
        json_output(400,array('code'=>400 , 'message'=>"BAD request"));
    }
    else
    {
        $params = json_decode(file_get_contents('php://input'),true);
        $user_id = $params['id'];
        $token = $params['device_token'];
        if($user_id == "")
        {
            json_output(200, array('code'=>00 , 'message'=>"Enter User_id"));
        }
        else if($token == "")
        {
            json_output(200, array('code'=>00 , 'message'=>"Enter Device Token"));
        }
        else{
        $response = $this->Signup_Model->saveDeviceToken($user_id,$token);
         if($response == 0)
         {
             json_output(200 , array('code'=>00 , 'message'=> "Invalid Id or Device Token"));
         }   
         else{
            $response = (array) $response;
            json_output(200, array('code'=>01, 'message' => "Saved Successfully"));
         }
        }
    }
}
}
?>