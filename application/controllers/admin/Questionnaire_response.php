<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Questionnaire_response extends MY_Controller {
	
	 public function __construct() {
        parent::__construct();
		//load the model
        $this->load->model("Policy_model");
        $this->load->model('Questionnaire_model');
        $this->load->library('form_validation');
	}
public function index(){
    $session = $this->session->userdata('username');
    if(empty($session)){ 
        redirect('admin/');
    }
    $data['records'] = $this->Questionnaire_model->fetchAllRecords();
    $data['title'] = 'Questionnaire Response | '.$this->Xin_model->site_title();
    $data['all_companies'] = $this->Xin_model->get_companies();
    $data['breadcrumbs'] = "Questionnaire Response";
    $role_resources_ids = $this->Xin_model->user_role_resource();
    if(in_array('9',$role_resources_ids)) {
        $data['subview'] = $this->load->view("admin/response", $data, TRUE);
    $this->load->view('admin/layout/layout_main', $data); //page load	
    }	}
    public function showRec($id)
    {
        $session = $this->session->userdata('username');
        if(empty($session))
        {
            redirect('admin/');
        }
        else{
        $data = $this->Questionnaire_model->showRec($id);
        $result = $data;
        $this->load->view('response_table', $result);  
        }      
    }
}
?>