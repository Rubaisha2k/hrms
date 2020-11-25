<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Salary_template extends CI_Controller {
    public function __construct()
    {
        parent::__construct();
        $this->load->helper('json_output_helper.php');
        $this->load->database();
        $this->load->model('SalaryTemplate_model');
        $this->load->helper('text');
    }
    public function output($Return=array()){
		/*Set response header*/
		header("Access-Control-Allow-Origin: *");
		header("Content-Type: application/json; charset=UTF-8");
		/*Final JSON response*/
		exit(json_encode($Return));
	}
    public function saveTemplate()
    {
        $data['basic_salary'] = $this->input->post('basic_salary');
        $data['house_rent_allowance'] = $this->input->post('house_rent');
        $data['medical_allowance'] = $this->input->post('medical');
        $data['travelling_allowance'] = $this->input->post('transport');
        $data['dearness_allowance'] = $this->input->post('utilities');
        $data['provident_fund'] = $this->input->post('provident');
        $saved = $this->SalaryTemplate_model->saveTemplate($data);
        $eobi['eobi_amount'] = $this->input->post('eobi');
        $eobi['eobi_employer_amount'] = $this->input->post('eobi_employer');
        $saved = $this->SalaryTemplate_model->saveEOBI($eobi);
        if($saved == 0)
        {
            $Return['error'] = "Record Not Saved!";
        }
        else
        {
            $Return['success'] = "Record Saved Successfully!";
        }
    }
}