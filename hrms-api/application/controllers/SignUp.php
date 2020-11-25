<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class SignUp extends CI_Controller {
    public function __construct()
    {
        parent::__construct();
        $this->load->helper('json_output_helper.php');
        $this->load->database();
        $this->load->model('Signup_Model');

    }
	public function index()
	{
        $error = "";
        $method = $this->input->server('REQUEST_METHOD');
        if($method!="POST")
        {
            json_output(400,array('message'=>"BAD request"));
        }
    else{
        $password_hash= "";
        $params = json_decode(file_get_contents('php://input'),true);
        if($params['employee_id']==="")
        {
            $error = "Enter Valid Id";
        }
        else 
        {
            $already = $this->Signup_Model->checkId($params['employee_id']);
            if($already>0)
            {
                $error = "User Id already exists!";
            }

        }
        if($params['full_name']==='')
        {
            $error = "Enter Valid Name";
        }
        if($params['password']==='')
        {
            $error = "Enter Valid Password";
        }
        if($params['confirmPassword']==='')
        {
            $error = "Enter Valid Confirm Password";
        }
        if($params['Email']==='')
        {
            $error = "Enter Valid Email";
        }
        if (!filter_var($params['Email'], FILTER_VALIDATE_EMAIL)) {
            $error = "Enter Valid Email";
        }
        if($params['job_status']==='')
        {
            $error = "Enter Valid Job Status";
        }
        if($error != "")
        {
            json_output(200 , array('code'=>00 , 'message'=>$error));
        }
        else{
        $password = $params['password'];
        $password_confirm = $params['confirmPassword'];
        if($password == $password_confirm){
        $options = array('cost'=>12);
        $password_hash = password_hash($params['password'], PASSWORD_BCRYPT, $options);
        $data['password'] = $password_hash;
        $data['user_id'] = $params['employee_id'];
        $data['employee_id'] = $params['employee_id'];
        $data['username'] = $params['full_name'];
        $data['email'] = $params['Email'];
        $data['office_shift_id'] = 1;
        $data['user_role_id'] = 2;
        $data['department_id'] = $params['job_status'];
        $result = $this->Signup_Model->signup($data);
        if($result)
        {
            json_output(200, array('code'=>01 , 'message'=>"Processed OK"));
        }
        else
        json_output(200 , array('code'=>00 , 'message'=>"Not Registered Successfully"));
           }
        else
        {
        json_output(200, array('code'=>00 , 'message'=>"Password Doesnot Match"));
        }
    }
    }
}
}
