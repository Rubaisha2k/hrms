<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Questionnaire extends MY_Controller {
	
	 public function __construct() {
        parent::__construct();
		//load the model
        $this->load->model("Policy_model");
        $this->load->model('Questionnaire_model');
        $this->load->library('form_validation');
	}
    public function index()
    {
        $session = $this->session->userdata('username');
		if(empty($session)){ 
            redirect('admin/');
        }
        $data['questions'] = $this->Questionnaire_model->fetchAllQuestions();
        $data['title'] = 'Questionnaire | '.$this->Xin_model->site_title();
        $data['all_companies'] = $this->Xin_model->get_companies();
        $data['breadcrumbs'] = "Questionnaire";
        $role_resources_ids = $this->Xin_model->user_role_resource();
        if(in_array('9',$role_resources_ids)) {
            $data['subview'] = $this->load->view("admin/questionnaire", $data, TRUE);
        $this->load->view('admin/layout/layout_main', $data); //page load	
        }	
    }
    public function addQuestion()
    {
        $this->form_validation->set_rules('question', 'Question', 'required');
        $this->form_validation->set_rules('answer', 'Answer', 'required');
        $this->form_validation->set_rules('options', 'Options', 'required');

        if($this->form_validation->run()==true)
        {
        $data['question']= $this->input->post('question');
        $data['answers'] = $this->input->post('answer');
        $data['options'] = $this->input->post('options');
        $row['data'] = $this->Questionnaire_model->addQuestion($data);
        $response['data'] = $this->load->view('check', $row, true);
         $response['status'] = 1;
         //redirect($this->uri->uri_string());
        }
        else
        {
            $response['status'] = 0;
            $response['question'] = form_error('question');
            $response['answer'] = form_error('answer');
            $response['options'] = form_error('options');
    }
    echo json_encode($response); 
    return json_encode($response);

}
    public function editQuestion($id)
    {
        $question['row'] = $this->Questionnaire_model->fetchQuestion($id);
        $response['modal_body'] = $this->load->view('admin/employees/dialog_edit', $question,true);
        echo json_encode($response);
        return json_encode($response);
    }
    public function saveEditQ()
    {
        $id = $this->input->post('Qid');
        $question = $this->input->post('question');
        $answer = $this->input->post('answer');
        $options = $this->input->post('options');
        $this->form_validation->set_rules('question', 'Question', 'required');
        $this->form_validation->set_rules('answer', 'Answer', 'required');
        $this->form_validation->set_rules('options', 'Options', 'required');
        if($this->form_validation->run()==false)
        {
            $response['status'] = 0;
            $response['question'] = form_error('question');
            $response['answer'] = form_error('answer');
            $response['options'] = form_error('options');
        }
        else
        {
            $data['id'] = $id;
            $data['question'] = $question;
            $data['answers'] = $answer;
            $data['options'] = $options;
            $row = $this->Questionnaire_model->editQues($data, $id);
            $response['status'] = 1;
            //$response['data'] = $this->load->view('check');
        }
        echo json_encode($row);
    }
}
?>