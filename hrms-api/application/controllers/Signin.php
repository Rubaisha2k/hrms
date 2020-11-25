<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Signin extends CI_Controller {
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
        $password = $params['password'];
        if($user_id == "")
        {
            json_output(200, array('code'=>00 , 'message'=>"Enter User_id"));
        }
        else if($password == "")
        {
            json_output(200, array('code'=>00 , 'message'=>"Enter Password"));
        }
        else{
        $response = $this->Signup_Model->login($user_id,$password);
         if($response == 0)
         {
             json_output(200 , array('code'=>00 , 'message'=> "User doesnot exist"));
         }   
         else{
            $response = (array) $response;
            json_output(200, array('code'=>01, 'message' => "LoggedIn Successfully",
            'user_id'=> $response[0]->user_id, 'full_name'=>$response[0]->first_name." ".$response[0]->last_name, 'email'=>$response[0]->email, 'designation'=>$response[0]->designation_name, 'profile'=>$response[0]->profile_picture));
         }
        }
    }
}

}
?>