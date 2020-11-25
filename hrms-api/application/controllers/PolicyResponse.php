<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class PolicyResponse extends CI_Controller {
	
	 public function __construct() {
        parent::__construct();
        $this->load->model('Questionnaire_model');
        
    }
    public function index()
    {
        $data['id'] = $this->input->post('employee_id');
        $ques1 =  $this->input->post('q_id_1');
        $ques2 = $this->input->post('q_id_2');
        $ques3 = $this->input->post('q_id_3');
        // $ques4 = $this->input->post('q_id_4');
        // $ques5 = $this->input->post('q_id_5');
        // $ques6 = $this->input->post('q_id_6');
        // $ques7 = $this->input->post('q_id_7');
        // $ques8 = $this->input->post('q_id_8');
        // $ques9 = $this->input->post('q_id_9');
        // $ques10 = $this->input->post('q_id_10');
        // $ques11 = $this->input->post('q_id_11');
        // $ques12 = $this->input->post('q_id_12');
        // $ques13 = $this->input->post('q_id_13');
        // $ques14 = $this->input->post('q_id_14');
        // $ques15 = $this->input->post('q_id_15');
        // $ques16 = $this->input->post('q_id_16');
        // $ques17 = $this->input->post('q_id_17');
        // $ques18 = $this->input->post('q_id_18');
        // $ques19 = $this->input->post('q_id_19');
        // $ques20 = $this->input->post('q_id_20');
        // $ques21 = $this->input->post('q_id_21');
        // $ques22 = $this->input->post('q_id_22');
        // $ques23 = $this->input->post('q_id_23');
        // $ques24 = $this->input->post('q_id_24');
        // $ques25 = $this->input->post('q_id_25');
        // $ques26 = $this->input->post('q_id_26');
        // $ques27 = $this->input->post('q_id_27');
        // $ques28 = $this->input->post('q_id_28');
        // $ques29 = $this->input->post('q_id_29');
        // $ques30 = $this->input->post('q_id_30');
        // $ques31 = $this->input->post('q_id_31');
        // $ques32 = $this->input->post('q_id_32');
        // $ques33 = $this->input->post('q_id_33');
        // $ques34 = $this->input->post('q_id_34');
        // $ques35 = $this->input->post('q_id_35');
        // $ques36 = $this->input->post('q_id_36');
        // $ques37 = $this->input->post('q_id_37');
        // $ques38 = $this->input->post('q_id_38');
        // $ques39 = $this->input->post('q_id_39');
        // $ques40 = $this->input->post('q_id_40');
        // $ques41 = $this->input->post('q_id_41');
        // $ques42 = $this->input->post('q_id_42');
        // $ques43 = $this->input->post('q_id_43');
        // $ques44 = $this->input->post('q_id_44');
        // $ques45 = $this->input->post('q_id_45');
        // $ques46 = $this->input->post('q_id_46');
        // $ques47 = $this->input->post('q_id_47');
        // $ques48 = $this->input->post('q_id_48');
        // $ques49 = $this->input->post('q_id_49');
        // $ques50 = $this->input->post('q_id_50');


        $response = array(
            $ques1 => $this->input->post('answer_1'),
            $ques2 => $this->input->post('answer_2'),
            $ques3 => $this->input->post('answer_3'),
            // $ques4 => $this->input->post('answer_4'),
            // $ques5 => $this->input->post('answer_5'),
            // $ques6 => $this->input->post('answer_6'),
            // $ques7 => $this->input->post('answer_7'),
            // $ques8 => $this->input->post('answer_8'),
            // $ques9 => $this->input->post('answer_9'),
            // $ques10 => $this->input->post('answer_10'),
            // $ques11 => $this->input->post('answer_11'),
            // $ques12 => $this->input->post('answer_12'),
            // $ques13 => $this->input->post('answer_13'),
            // $ques14 => $this->input->post('answer_14'),
            // $ques15 => $this->input->post('answer_15'),
            // $ques16 => $this->input->post('answer_16'),
            // $ques17 => $this->input->post('answer_17'),
            // $ques18 => $this->input->post('answer_18'),
            // $ques19 => $this->input->post('answer_19'),
            // $ques20 => $this->input->post('answer_20'),
            // $ques21 => $this->input->post('answer_21'),
            // $ques22 => $this->input->post('answer_22'),
            // $ques23 => $this->input->post('answer_23'),
            // $ques24 => $this->input->post('answer_24'),
            // $ques25 => $this->input->post('answer_25'),
            // $ques26 => $this->input->post('answer_26'),
            // $ques27 => $this->input->post('answer_27'),
            // $ques28 => $this->input->post('answer_28'),
            // $ques29 => $this->input->post('answer_29'),
            // $ques30 => $this->input->post('answer_30'),
            // $ques31 => $this->input->post('answer_31'),
            // $ques32 => $this->input->post('answer_32'),
            // $ques33 => $this->input->post('answer_33'),
            // $ques34 => $this->input->post('answer_34'),
            // $ques35 => $this->input->post('answer_35'),
            // $ques36 => $this->input->post('answer_36'),
            // $ques37 => $this->input->post('answer_37'),
            // $ques38 => $this->input->post('answer_38'),
            // $ques39 => $this->input->post('answer_39'),
            // $ques40 => $this->input->post('answer_40'),
            // $ques41 => $this->input->post('answer_41'),
            // $ques42 => $this->input->post('answer_42'),
            // $ques43 => $this->input->post('answer_43'),
            // $ques44 => $this->input->post('answer_44'),
            // $ques45 => $this->input->post('answer_45'),
            // $ques46 => $this->input->post('answer_46'),
            // $ques47 => $this->input->post('answer_47'),
            // $ques48 => $this->input->post('answer_48'),
            // $ques49 => $this->input->post('answer_49'),
            // $ques50 => $this->input->post('answer_50')
        );
        $length = $this->Questionnaire_model->fetchAllQuestions();
        $length = end($length);
        //echo json_encode($response);
        $data['response'] = $response;
        $data['length'] = $length->question_id;
        $this->load->view('resultPolicy', $data);
    }
}
?>