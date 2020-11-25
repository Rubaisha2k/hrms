<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Policies extends MY_Controller {
	
	 public function __construct() {
        parent::__construct();
		//load the model
        $this->load->model("Policy_model");
        $this->load->model('Questionnaire_model');
        $this->load->library('form_validation');
        $this->load->model('Policies_model');
    }
    public function index()
    {
        $session = $this->session->userdata('username');
        $user = $this->Xin_model->read_user_info($session['user_id']);
		if(empty($session)){ 
            redirect('admin/');
        }
        $data['employee_id'] = $user[0]->user_id;
        $data['policies'] = $this->Policies_model->fetchPolicies();
        $data['title'] = 'Policies | '.$this->Xin_model->site_title();
        $data['all_companies'] = $this->Xin_model->get_companies();
        $data['breadcrumbs'] = "Policies";
        $role_resources_ids = $this->Xin_model->user_role_resource();
            $data['subview'] = $this->load->view("admin/employees/policies", $data, TRUE);
        $this->load->view('admin/layout/layout_main', $data); //page load	
    }
    public function policyreview($id)
    {
        $questions = array();
        $allQuestions = $this->Questionnaire_model->fetchAllQuestions();
        
        $allQuestions = end($allQuestions);
        $data['employee_id'] = $id;
        $data['title'] = 'Policy Review | '.$this->Xin_model->site_title();
        $data['breadcrumbs'] = "Policy Review";
        for($i = 0; $i<1; $i++)
        {
            $q_no = 2;
            //$q_no = rand(1,4);//$allQuestions->question_id);
            $questions[] = $this->Questionnaire_model->fetchQuestion($q_no);
        }
        $data['questions'] = $questions;
        $data['subview'] = $this->load->view("admin/employees/policyreview",$data, true);
        $this->load->view('admin/layout/layout_main', $data); //page load	
    }
}
?>