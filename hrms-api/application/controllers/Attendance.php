<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Attendance extends CI_Controller {

    function __construct()
    {
        // Construct the parent class
        parent::__construct();
        $this->load->helper('json_output_helper.php');
        $this->load->database();
        $this->load->model('Attendance_Model');
        $this->load->library('zktecolib');
    }
	/**
	 * Index Page for this controller.
	 *
	 * Maps to the following URL
	 * 		http://example.com/index.php/welcome
	 *	- or -
	 * 		http://example.com/index.php/welcome/index
	 *	- or -
	 * Since this controller is set as the default controller in
	 * config/routes.php, it's displayed at http://example.com/
	 *
	 * So any other public methods not prefixed with an underscore will
	 * map to /index.php/welcome/<method_name>
	 * @see https://codeigniter.com/user_guide/general/urls.html
	 */
    
	public function index()
	{
        $method = $this->input->server('REQUEST_METHOD');
        if($method!= "POST")
        {
            json_output(200, array('message'=>"Bad Request"));
        }
        else{
            $params = json_decode(file_get_contents('php://input'),true);
            $id = $params['id'];
            $getData = $this->Attendance_Model->attendance($id);
            if($getData == 0)
            json_output(200,$getData);
            else{
            $day = (new DateTime())->format('D');
            if($day == 'Mon')
            {
                $in_time = $getData[0]->monday_in_time;
                $out_time = $getData[0]->monday_out_time;
            }
            else if($day == 'Tue')
            {
                $in_time = $getData[0]->tuesday_in_time;
                $out_time = $getData[0]->tuesday_out_time;
            }
            else if($day == 'Wed')
            {
                $in_time = $getData[0]->wednesday_in_time;
                $out_time = $getData[0]->wednesday_out_time;
            }
            else if($day == 'Thu')
            {
                $in_time = $getData[0]->thursday_in_time;
                $out_time = $getData[0]->thursday_out_time;
            }
            else if($day == 'Fri')
            {
                $in_time = $getData[0]->friday_in_time;
                $out_time = $getData[0]->friday_out_time;
            }
            $office_attendance = $this->Attendance_Model->markattendance($getData, $in_time, $out_time);
            json_output(200, $office_attendance);
         }
        }
    }
    private function export_file()
    {
        
    } 
}