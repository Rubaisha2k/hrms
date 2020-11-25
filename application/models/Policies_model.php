<?php 


class Policies_model extends CI_Model{
    public function __construct()
    {
        parent::__construct();
        $this->load->helper('json_output_helper');
        $this->load->database();
    }
    public function fetchPolicies(){
        $this->db->select('*');
        $policies = $this->db->get('xin_company_policy');
        return $policies->result();
    }
}
?>