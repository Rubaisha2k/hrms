<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class SalaryTemplate_Model extends CI_Model {
	
	 public function __construct() {
		parent::__construct();
     }
     public function getTemplate()
     {
         $this->db->select('*');
         $this->db->where('company_id' , 1);
         $template = $this->db->get('xin_salary_templates');
         return $template->result_array();

     }
     public function getEOBI()
     {
         $this->db->select('eobi_amount, eobi_employer_amount');
         $this->db->where('company_id', 1);
         $eobi = $this->db->get('xin_eobi_amount');
         return $eobi->result_array();
     }
    }