<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class SalaryTemplate_model extends CI_Model {
    public function __construct()
    {
        parent::__construct();
        $this->load->helper('json_output_helper.php');
    }
    public function saveTemplate($data)
    {
        $data['company_id'] = 1;
        print_r($data);
        $this->db->select('*');
        $this->db->where('company_id', 1);
        $template = $this->db->get('xin_salary_templates');
        if($template->num_rows() == 0)
        {
            $this->db->insert('xin_salary_templates', $data);
            return 1;
        }
        else{
            $this->db->where('company_id', 1);
            $this->db->update('xin_salary_templates', $data);
            return 1;
        }
        return 0;
    }
    public function saveEOBI($data)
    {
        $this->db->select('*');
        $this->db->where('company_id', 1);
        $template = $this->db->get('xin_eobi_amount');
        if($template->num_rows() == 0)
        {
            $this->db->insert('xin_eobi_amount', $data);
            return 1;
        }
        else{
            $this->db->where('company_id', 1);
            $this->db->update('xin_eobi_amount', $data);
            return 1;
        }
        return 0;
    }
}
