<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Questionnaire_model extends CI_Model {
	
	 public function __construct() {
        parent::__construct();
        $this->load->helper('json_output_helper');
        $this->load->database();
     }
     public function fetchAllQuestions()
     {
         $this->db->select('*');
         $questions = $this->db->get('xin_questions');
         return $questions->result();
     }
     public function addQuestion($data)
     {
         $this->db->insert('xin_questions', $data);
         $row = $this->db->insert_id();
         $this->db->select('*');
         $this->db->where('question_id',$row);
         $row = $this->db->get('xin_questions');
         return $row->result();
     }
     public function fetchAllRecords()
     {
        $this->db->select('*');
        $this->db->join('xin_employees','xin_policy_record.employee_id = xin_employees.employee_id');
        $questions = $this->db->get('xin_policy_record');
        return $questions->result();
     }
     public function fetchQuestion($id)
     {
         $this->db->where('question_id', $id);
         $this->db->select('*');
         $row = $this->db->get('xin_questions');
         return $row->result();
     }
     public function editQues($data, $id)
     {
         $this->db->where('question_id', $id);
         $this->db->update('xin_questions', $data);
         $this->db->select('*');
         $this->db->where('question_id', $id);
         $row = $this->db->get('xin_questions')->result();
         return $row;
     }
     public function deleteQuestion($id){
         $this->db->where('question_id', $id);
         $this->db->delete('xin_questions');
         return true;
     }
     public function saveResponse($data)
     {
         $this->db->insert('xin_policy_record',$data);
     }
     public function updateResponse($data)
     {
         $id = $data['employee_id'];
         $this->db->where('employee_id',$id);
         $this->db->update('xin_policy_record', $data);
     }
     public function fetchRecord($id)
     {
         $this->db->where('employee_id', $id);
         $this->db->select('*');
         $row = $this->db->get('xin_policy_record');
         return $row;
     }
    }
    ?>