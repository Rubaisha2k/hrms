<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Salary_template extends MY_Controller {
	
	 public function __construct() {
		parent::__construct();
		$this->load->model('SalaryTemplate_Model');
     }
     public function index()
     {
        $session = $this->session->userdata('username');
		if(empty($session)){ 
			redirect('admin/');
		}
		$data['title'] = "SalaryTemplate".' | '.$this->Xin_model->site_title();
		$data['all_companies'] = $this->Xin_model->get_companies();
		$data['breadcrumbs'] = "Salary Calculations";
		$data['path_url'] = 'salary_template';
		$data['salary_template'] = $this->SalaryTemplate_Model->getTemplate();
		$data['eobi'] = $this->SalaryTemplate_Model->getEOBI();
		$role_resources_ids = $this->Xin_model->user_role_resource();
			if(!empty($session)){
				$data['subview'] = $this->load->view("admin/salary_template", $data, TRUE);
				$this->load->view('admin/layout/layout_main', $data); //page load
			} else {
				redirect('admin/');
			}
	 }
	
    }
    ?>