<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Dashboard extends CI_Controller {
    public function __construct()
    {
        parent::__construct();
        $this->load->helper('json_output_helper.php');
        $this->load->database();
        $this->load->model('Dashboard_Model');
        $this->load->helper('text');
    }
public function jobs()
{
    $method = $this->input->server("REQUEST_METHOD");
    if($method !="POST")
    {
        json_output(400, array('code'=>400 , 'message'=>"Bad Request"));
    }
    else{

    $jobs = $this->Dashboard_Model->getJobs();
    if($jobs == 0)
{
    json_output(200, array('code'=>00 , 'message'=>"No Jobs Present"));
}
else
    json_output(200, array('code'=>01 , 'message'=>$jobs));
}
}


public function UpcomingEvents(){
    $method = $this->input->server("REQUEST_METHOD");
    if($method !="POST")
    {
        json_output(400, array('code'=>400 , 'message'=>"Bad Request"));
    }
    else{

$events = $this->Dashboard_Model->getUpcomingEvents();
if($events == 0)
{
    json_output(200, array('code'=>00 , 'message'=>"No Events Present"));
}
else
json_output(200, array('code'=>01 , 'message'=> 'SuccessFully Fetched', 'object'=> $events));
    }
}


public function PresentEvents(){
    $method = $this->input->server("REQUEST_METHOD");
    if($method !="POST")
    {
        json_output(400, array('code'=>400 , 'message'=>"Bad Request"));
    }
    else{
    $events = $this->Dashboard_Model->getPresentEvents();
    if($events == 0)
    {
        json_output(200, array('code'=>00 , 'message'=>"No Events Present"));
    }
    else
    json_output(200, array('code'=>01 , 'message'=> 'SuccessFully Fetched', 'object'=> $events));
}
}
    public function PastEvents(){
        $method = $this->input->server("REQUEST_METHOD");
        if($method !="POST")
        {
            json_output(400, array('code'=>400 , 'message'=>"Bad Request"));
        }
        else{    
        $events = $this->Dashboard_Model->getPastEvents();
        if($events == 0)
        {
            json_output(200, array('code'=>00 , 'message'=>"No Events Present"));
        }
        else
        json_output(200, array('code'=>01 , 'message'=> 'SuccessFully Fetched', 'object'=> $events));
    }
    }
public function leaves()
{
    $method = $this->input->server("REQUEST_METHOD");
    if($method !="POST")
    {
        json_output(400, array('code'=>400 , 'message'=>"Bad Request"));
    }
    else{
        $params = json_decode(file_get_contents('php://input'),true);
        $id = $params['id'];
        if($id == "")
            {
                json_output(200, array('code'=>00 , 'message'=>"ID should not be null"));
            } 
            else if(is_numeric($id)){
        $leaves = $this->Dashboard_Model->getLeaves($id);
        if($leaves == 0)
        json_output(200, array('code'=>00 , 'message'=>"No Leave Applied"));
        else
        {
        json_output(200, array('code'=>01 , 'message'=>$leaves));
    }
}
else {
    json_output(200, array('code'=>00, 'message'=>"Invalid Id"));
}
}
}
public function attendance()
{
    $method = $this->input->server("REQUEST_METHOD");
    if($method != "POST")
    {
        json_output(400 , array('code'=>400 , 'message'=>"BAD REQUEST"));
    }
    else
    {
        $params = json_decode(file_get_contents('php://input'),true);
        $id = $params['id'];
        $this->db->select('days_per_year');
        $days_per_year = $this->db->get('xin_leave_type');
        $days_per_year = $days_per_year->result();
        $total_days = 0;
        for($i=0; $i<count($days_per_year); $i++)
        {
        $total_days = $total_days + $days_per_year[$i]->days_per_year;
        }
        $attendance['total_leaves'] = $total_days;
        $leaves_applied = $this->Dashboard_Model->getLeavesCount($id);
        $attendance['leaves_applied'] = $leaves_applied;
        $attendance['leaves_remaining'] = $total_days-$leaves_applied;
        if($id == ""){
            json_output(200, array('code'=>00 , 'message'=>"ID should not be null"));
        }
        else if(is_numeric($id)){
        $this->db->where('user_id' , $id);
        $this->db->select('user_id');
        $record = $this->db->get('xin_employees');
        if($record->num_rows()>0)
        {        
        $present = $this->Dashboard_Model->getPresents($id);
        $late = $this->Dashboard_Model->getLates($id);
        $absent = $this->Dashboard_Model->getAbsents($id);
            json_output(200, array('code'=>01 , 'message'=>$attendance, 'present'=>$present ,'absent'=>$absent,'late'=>$late));
        }
    }
    else 
    {
        json_output(200, array('code'=>00, 'message'=>"Invalid ID"));
    }
}
 }



public function applyLeaveCasual()
{
    $method = $this->input->server("REQUEST_METHOD");
    if($method != "POST")
    {
        json_output(400 , array('code'=>400 , 'message'=>"BAD REQUEST"));
    }
    else
    {
        $params = json_decode(file_get_contents('php://input'),true);
        $leavesEmployee = $this->Dashboard_Model->getLeavesCasualEmployee($params['id']);
        if($leavesEmployee == 0){
            json_output(200, array('code' => 00 , 'message' =>'Cannot apply for leave'));
        }
        else{
        if($params['from_date'] == "")
        {
            json_output(200, array('code' => 00 , 'message' =>'From Date Field Empty'));
        }
        else if($params['id'] == "")
        {
            json_output(200, array('code' => 00 , 'message' =>'ID should not be null'));
        }
        else if($params['to_date'] == "")
        {
            json_output(200, array('code' => 00 , 'message' =>'To Date Field Empty'));
        }
        else if($params['reason'] == "")
        {
            json_output(200, array('code' => 00 , 'message' =>'Reason Field Empty'));
        }
        else{
        $data['department_id'] = $this->Dashboard_Model->getDepartment($params['id']);
        $data['employee_id'] = $params['id'];
        $data['from_date'] = date('Y-m-d',strtotime($params['from_date']));
        $data['to_date'] = date('Y-m-d' , strtotime($params['to_date']));
        $data['reason'] = $params['reason'];
        $data['status'] = 1;
        $data['leave_type_id'] = 1;
        $data['applied_on'] = (new DateTime())->format('Y-m-d H:i:s');
        $data['created_at'] = (new DateTime())->format('Y-m-d H:i:s');
        if($data['employee_id'] == "")
        {
            json_output(200, array('code' => 00 , 'message' =>'First Login'));
        }
        else{
            $ok = $this->Dashboard_Model->addLeave($data);
            if($ok)
            json_output(200, array('code'=>01 , 'message'=>"Data Saved Successfully"));
            else
            {
                json_output(200, array('code'=>00, 'message'=>"Some Problem Occured"));
            }
    }
}
}
    }
}
public function applyLeaveAnnual()
{
    $method = $this->input->server("REQUEST_METHOD");
    if($method != "POST")
    {
        json_output(400 , array('code'=>400 , 'message'=>"BAD REQUEST"));
    }
    else
    {
        $params = json_decode(file_get_contents('php://input'),true);
        $leavesEmployee = $this->Dashboard_Model->getLeavesAnnualEmployee($params['id']);
        if($leavesEmployee == 0){
            json_output(200, array('code' => 00 , 'message' =>'Cannot apply for leave'));
        }
        else{
        if($params['from_date'] == "")
        {
            json_output(200, array('code' => 00 , 'message' =>'From Date Field Empty'));
        }
        else if($params['to_date'] == "")
        {
            json_output(200, array('code' => 00 , 'message' =>'To Date Field Empty'));
        }
        else if($params['reason'] == "")
        {
            json_output(200, array('code' => 00 , 'message' =>'Reason Field Empty'));
        }
        else{
        $data['department_id'] = $this->Dashboard_Model->getDepartment($params['id']);
        $data['employee_id'] = $params['id'];
        $data['from_date'] = date('Y-m-d',strtotime($params['from_date']));
        $data['to_date'] = date('Y-m-d' , strtotime($params['to_date']));
        $data['reason'] = $params['reason'];
        $data['status'] = 1;
        $data['leave_type_id'] = 3;
        $data['applied_on'] = (new DateTime())->format('Y-m-d H:i:s');
        $data['created_at'] = (new DateTime())->format('Y-m-d H:i:s');
        if($data['employee_id'] == "")
        {
            json_output(200, array('code' => 00 , 'message' =>'First Login'));
        }
        else{
            $ok = $this->Dashboard_Model->addLeave($data);
            if($ok)
            json_output(200, array('code'=>01 , 'message'=>"Data Saved Successfully"));
            else
            {
                json_output(200, array('code'=>00, 'message'=>"Some Problem Occured"));
            }
        }
    }
}
}
}

public function applyLeaveMedical()
{
    $method = $this->input->server("REQUEST_METHOD");
    if($method != "POST")
    {
        json_output(400 , array('code'=>400 , 'message'=>"BAD REQUEST"));
    }
    else
    {
        $params = json_decode(file_get_contents('php://input'),true);
        $data['employee_id'] = $params['id'];
        $leavesEmployee = $this->Dashboard_Model->getLeavesEmployee($params['id']);
        if($leavesEmployee == 0){
            json_output(200, array('code' => 00 , 'message' =>'Cannot apply for leave'));
        }
        else{
        if($params['from_date'] == "")
        {
            json_output(200, array('code' => 00 , 'message' =>'From Date Field Empty'));
        }
        else if($params['to_date'] == "")
        {
            json_output(200, array('code' => 00 , 'message' =>'To Date Field Empty'));
        }
        else if($params['reason'] == "")
        {
            json_output(200, array('code' => 00 , 'message' =>'Reason Field Empty'));
        }
        else if($params['attachment'] == "")
        {
            json_output(200, array('code' => 00 , 'message' =>'Attachment is required'));
        }
        else{
        $data['department_id'] = $this->Dashboard_Model->getDepartment($params['id']);
        $data['from_date'] = date('Y-m-d',strtotime($params['from_date']));
        $data['to_date'] = date('Y-m-d' , strtotime($params['to_date']));
        $data['reason'] = $params['reason'];
        $data['company_id'] = 1;
        $data['status'] = 1;
        $data['leave_type_id'] = 2;
        $data['applied_on'] = (new DateTime())->format('Y-m-d H:i:s');
        $data['created_at'] = (new DateTime())->format('Y-m-d H:i:s');
        $attachment = $this->upload_image($params['attachment']);
        if($attachment == 0)
        {
            json_output(200, array('code'=>00, 'message'=>"Image Not Saved"));
        }
        $data['leave_attachment'] = "hrms-api/uploads/leaves/".$attachment;
        if($data['employee_id'] == "")
        {
            json_output(200, array('code' => 00 , 'message' =>'First Login'));
        }
        else{
            $ok = $this->Dashboard_Model->addLeaveMedical($data);
            if($ok)
            json_output(200, array('code'=>01 , 'message'=>"Data Saved Successfully"));
            else
            {
                json_output(200, array('code'=>00, 'message'=>"Some Problem Occured"));
            }
        }
    }
}
}
}
public function upload_image($attachment)
{
    $file = md5(uniqid(rand(),true));
    $file_name = "leave_".$file.".png" ;
    if(file_put_contents(FCPATH."uploads/leaves/".$file_name, base64_decode($attachment)))
    return $file_name;
    else 
    return 0;
}
public function upload_imageEducation($attachment)
{
    $file = md5(uniqid(rand(),true));
    $file_name = "certificate_".$file.".png" ;
    if(file_put_contents(FCPATH."uploads/employee_document/".$file_name, base64_decode($attachment)))
    return $file_name;
    else 
    return 0;
}
public function upload_profileImage($attachment)
{
    $file = md5(uniqid(rand(),true));
    $file_name = "profile_".$file.".png" ;
    if(file_put_contents(FCPATH."uploads/profile/".$file_name, base64_decode($attachment)))
    {
    return $file_name;
    }
    else {
        return 0;
    }
}

public function to_do()
{
    $method = $this->input->server('REQUEST_METHOD');
    if($method != "POST")
    {
        json_output(400, array('code'=>400, 'message'=>"Bad Request"));   
    }
    else{
        $params = json_decode(file_get_contents('php://input'),true);
    $id = $params['id'] ;
    if($id == "")
    {
        json_output(200, array('code'=>00, 'message'=>"ID should not be null"));
    }
    else if(is_numeric($id)){
    $allTasks = $this->Dashboard_Model->allTasks($id);
    if($allTasks == 0)
    {
        json_output(200, array('code'=>00 , 'message'=>"No Task is Assigned to the User"));
    }
    else
    {
        json_output(200, array('code' => 01, 'message'=>$allTasks));
    }
    }
    else
    {
        json_output(200, array('code' => 00 , 'message' =>"Invalid ID"));
    }
    }
}
public function profile()
{
    $method = $this->input->server("REQUEST_METHOD");
    if($method != "POST")
    {
        json_output(400, array('code'=>400 , 'message' => "Bad Request"));
    }
    else
    {
        $error = "";
        $params = json_decode(file_get_contents('php://input'),true);
        $data['user_id'] = $params['id'];  
        if($data['user_id'] == "")
    {
        json_output(200, array('code'=>00, 'message'=>"ID should not be null"));
    }
    else if(is_numeric($data['user_id'])){      
        if(preg_match('/^[a-zA-Z]*$/',$params['first_name'])){
        $data['first_name'] = $params['first_name'];
        }
        else{
            $error = "Enter Valid First Name";
        }
        if(preg_match('/^[a-zA-Z]*$/',$params['last_name'])){
        $data['last_name'] = $params['last_name'];
        }
        else{
           $error = "Enter Valid Last Name";
        } 
        if(preg_match('/^[0-9]{11}$/', $params['contact_no']))
            $data['contact_no'] = $params['contact_no'];
        else
            $error = "Enter Valid 11 digits Phone Number";
        if (filter_var($params['email'], FILTER_VALIDATE_EMAIL)) {
            $data['email'] = $params['email'];
        }
        else
        {
            $error = "Enter Valid Email";
        }
        $data['date_of_birth'] = $params['dob'];
        $data['marital_status'] = $params['marital_status'];
        $data['blood_group'] = $params['blood_group'];
        $data['address'] = $params['address'];
        $cnic['employee_id'] = $params['id'];
        $cnic['cnic'] = $params['cnic'];
        
        $mac['employee_id'] = $params['id'];
        $mac['mac_address'] = $params['mac'];
        if(empty($error)){
            $response = $this->Dashboard_Model->editProfile($data, $cnic, $mac);
            if($response)
            {
                json_output(200 , array('code'=>01 , 'message'=>"Record Saved Successfully"));
            }
            else 
                json_output(200 , array('code'=>00 , 'message'=>"Some Problem Occurred"));
        }
        else
            json_output(200, array('code'=>00 , 'message'=>$error));  
    }
    else
        json_output(200, array('code'=>00 , 'message'=> "Invalid ID"));
}

}
    public function getImage(){
        $base64Image = "R0lGODlhPQBEAPeoAJosM//AwO/AwHVYZ/z595kzAP/s7P+goOXMv8+fhw/v739/f+8PD98fH/8mJl+fn/9ZWb8/PzWlwv///6wWGbImAPgTEMImIN9gUFCEm/gDALULDN8PAD6atYdCTX9gUNKlj8wZAKUsAOzZz+UMAOsJAP/Z2ccMDA8PD/95eX5NWvsJCOVNQPtfX/8zM8+QePLl38MGBr8JCP+zs9myn/8GBqwpAP/GxgwJCPny78lzYLgjAJ8vAP9fX/+MjMUcAN8zM/9wcM8ZGcATEL+QePdZWf/29uc/P9cmJu9MTDImIN+/r7+/vz8/P8VNQGNugV8AAF9fX8swMNgTAFlDOICAgPNSUnNWSMQ5MBAQEJE3QPIGAM9AQMqGcG9vb6MhJsEdGM8vLx8fH98AANIWAMuQeL8fABkTEPPQ0OM5OSYdGFl5jo+Pj/+pqcsTE78wMFNGQLYmID4dGPvd3UBAQJmTkP+8vH9QUK+vr8ZWSHpzcJMmILdwcLOGcHRQUHxwcK9PT9DQ0O/v70w5MLypoG8wKOuwsP/g4P/Q0IcwKEswKMl8aJ9fX2xjdOtGRs/Pz+Dg4GImIP8gIH0sKEAwKKmTiKZ8aB/f39Wsl+LFt8dgUE9PT5x5aHBwcP+AgP+WltdgYMyZfyywz78AAAAAAAD///8AAP9mZv///wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACH5BAEAAKgALAAAAAA9AEQAAAj/AFEJHEiwoMGDCBMqXMiwocAbBww4nEhxoYkUpzJGrMixogkfGUNqlNixJEIDB0SqHGmyJSojM1bKZOmyop0gM3Oe2liTISKMOoPy7GnwY9CjIYcSRYm0aVKSLmE6nfq05QycVLPuhDrxBlCtYJUqNAq2bNWEBj6ZXRuyxZyDRtqwnXvkhACDV+euTeJm1Ki7A73qNWtFiF+/gA95Gly2CJLDhwEHMOUAAuOpLYDEgBxZ4GRTlC1fDnpkM+fOqD6DDj1aZpITp0dtGCDhr+fVuCu3zlg49ijaokTZTo27uG7Gjn2P+hI8+PDPERoUB318bWbfAJ5sUNFcuGRTYUqV/3ogfXp1rWlMc6awJjiAAd2fm4ogXjz56aypOoIde4OE5u/F9x199dlXnnGiHZWEYbGpsAEA3QXYnHwEFliKAgswgJ8LPeiUXGwedCAKABACCN+EA1pYIIYaFlcDhytd51sGAJbo3onOpajiihlO92KHGaUXGwWjUBChjSPiWJuOO/LYIm4v1tXfE6J4gCSJEZ7YgRYUNrkji9P55sF/ogxw5ZkSqIDaZBV6aSGYq/lGZplndkckZ98xoICbTcIJGQAZcNmdmUc210hs35nCyJ58fgmIKX5RQGOZowxaZwYA+JaoKQwswGijBV4C6SiTUmpphMspJx9unX4KaimjDv9aaXOEBteBqmuuxgEHoLX6Kqx+yXqqBANsgCtit4FWQAEkrNbpq7HSOmtwag5w57GrmlJBASEU18ADjUYb3ADTinIttsgSB1oJFfA63bduimuqKB1keqwUhoCSK374wbujvOSu4QG6UvxBRydcpKsav++Ca6G8A6Pr1x2kVMyHwsVxUALDq/krnrhPSOzXG1lUTIoffqGR7Goi2MAxbv6O2kEG56I7CSlRsEFKFVyovDJoIRTg7sugNRDGqCJzJgcKE0ywc0ELm6KBCCJo8DIPFeCWNGcyqNFE06ToAfV0HBRgxsvLThHn1oddQMrXj5DyAQgjEHSAJMWZwS3HPxT/QMbabI/iBCliMLEJKX2EEkomBAUCxRi42VDADxyTYDVogV+wSChqmKxEKCDAYFDFj4OmwbY7bDGdBhtrnTQYOigeChUmc1K3QTnAUfEgGFgAWt88hKA6aCRIXhxnQ1yg3BCayK44EWdkUQcBByEQChFXfCB776aQsG0BIlQgQgE8qO26X1h8cEUep8ngRBnOy74E9QgRgEAC8SvOfQkh7FDBDmS43PmGoIiKUUEGkMEC/PJHgxw0xH74yx/3XnaYRJgMB8obxQW6kL9QYEJ0FIFgByfIL7/IQAlvQwEpnAC7DtLNJCKUoO/w45c44GwCXiAFB/OXAATQryUxdN4LfFiwgjCNYg+kYMIEFkCKDs6PKAIJouyGWMS1FSKJOMRB/BoIxYJIUXFUxNwoIkEKPAgCBZSQHQ1A2EWDfDEUVLyADj5AChSIQW6gu10bE/JG2VnCZGfo4R4d0sdQoBAHhPjhIB94v/wRoRKQWGRHgrhGSQJxCS+0pCZbEhAAOw==";
        file_put_contents(FCPATH."/uploads/leaves/images.png", base64_decode($base64Image));
    }
    public function messagesAdmin()
    {
        $method = $this->input->server("REQUEST_METHOD");
        if($method != "POST")
        {
            json_output(400, "Bad Request");
        }
        else
        {
            $params = json_decode(file_get_contents('php://input'),true);
            $employee_id = $params['id'];
            $messages = $this->Dashboard_Model->adminMessages($employee_id);
            if($messages == 0)
            {
                json_output(200, array('code'=>00 , 'message'=>'Empty Inbox'));
            }
            else{
                json_output(200, array('code'=>01 , 'message'=>$messages));
            }
        }
    }
    public function notifications()
    {
        $method = $this->input->server("REQUEST_METHOD");
        if($method != "POST")
        {
            json_output(400, "Bad Request");
        }
        else
        {
            $params = json_decode(file_get_contents('php://input'),true);
            $id = $params['id'];
            if($id == "")
            {
                json_output(200, array('code'=> 00 , 'message'=>"ID should not be null"));
                
            }
            else if(is_numeric($id)){
        $getNotifications = $this->Dashboard_Model->notifications($id);
        //print_r($getNotifications);
        if(empty($getNotifications))
        {
            json_output(200, array('code'=>00 , 'message'=>"No New Notifications"));
        }
        else
        {
            //$this->Notifications();
            json_output(200, array('code'=>01 , 'message'=>$getNotifications));
        }
    }
    else
    {
    json_output(200, array('code' =>00, 'message'=>"Invalid ID"));
    }
        }
    }
    public function attendanceCheckIn()
    {
        $method = $this->input->server('REQUEST_METHOD');
        if($method != 'POST')
        {
            json_output(400 , array('code'=>400 , 'message'=>"Bad Request"));
        }
        else
        {
            $params = json_decode(file_get_contents('php://input'),true);
            $data['id'] = $params['id'];
           
            $data['mac_address'] = $params['mac'];
            $data['in_time'] = date('Y-m-d H:i:s');
            if($data['id'] == "")
            {
                json_output(200, array('code'=>00 , 'message'=>"ID should not be null"));
            }
            
            else if($data['mac_address'] == "")
            {
                json_output(200, array('code'=>00 , 'message'=>"Mac Address should not be null"));
            }
            else if(is_numeric($data['id'])){
            $credentials = $this->Dashboard_Model->markAttendanceCheckIn($data);
            if(!empty($credentials))
            {
                json_output(200, array('code'=>01 , 'message' =>"Attendance Recorded" , 'time'=>$credentials));
            }
            else
            {
                json_output(200, array('code'=>01 , 'message' =>$credentials));
            }
        }
        }
    }
    public function attendanceCheckOut()
    {
        $method = $this->input->server('REQUEST_METHOD');
        if($method != 'POST')
        {
            json_output(400 , array('code'=>400 , 'message'=>"Bad Request"));
        }
        else
        {
            $params = json_decode(file_get_contents('php://input'),true);
            $data['id'] = $params['id'];
            $data['mac_address'] = $params['mac'];
            if($data['id'] == "")
            {
                json_output(200, array('code'=>00 , 'message'=>"ID should not be null"));
            }
            else if($data['mac_address'] == "")
            {
                json_output(200, array('code'=>00 , 'message'=>"Mac Address should not be null"));
            }
            else if(is_numeric($data['id'])){
            $credentials = $this->Dashboard_Model->markAttendanceCheckOut($data);
            if(!empty($credentials))
            {
                json_output(200, array('code'=>01 , 'message' =>"Attendance Recorded" , 'time'=>$credentials));
            }
            else
            {
                json_output(200, array('code'=>01 , 'message' =>$credentials));   
        }
        }
        else{
            json_output(200, array('code'=>00, 'message'=>"Invalid Id"));
        }
    }
}
public function getDegree()
{
    $method = $this->input->server('REQUEST_METHOD');
    if($method != "POST")
    {
        json_output(400, "Bad Request");
    }
    else{
        $degree = $this->Dashboard_Model->getDegree();
        if($degree == 0)
        {
            json_output(200, array('code'=>0 , 'message'=>"No Degree Present"));
        }
        else
        {
            json_output(200, array('code'=>1 , 'message'=>$degree));
        }
    }
}
public function getProfile()
{
    $method = $this->input->server('REQUEST_METHOD');
    if($method != "POST")
    {
        json_output(400, array('code'=>400 , 'message'=>"Bad Request"));
    }
    else
    {
        $params = json_decode(file_get_contents('php://input'),true);
        $id = $params['id'];
        $data = $this->Dashboard_Model->getProfile($id);
        json_output(200, array('code'=>1 , 'message'=>'Processed ok', 'data'=>$data));
    }
}
public function UpdateProfileExperience()
{
    $method = $this->input->server('REQUEST_METHOD');
    if($method != "POST")
    {
        json_output(400, array('code'=>400 , 'message'=>"Bad Request"));
    }
    else{
        $params = json_decode(file_get_contents('php://input'), true);
        $data['work_experience_id'] = $params['id'];
        $data['company_name'] = $params['company_name'];
        $data['from_date'] = date('Y-m-d', strtotime($params['from_date']));
        $data['to_date'] = date('Y-m-d', strtotime($params['to_date']));
        $data['post'] = $params['post'];
        $updateExperience = $this->Dashboard_Model->updateExperience($data);
        if($updateExperience == 0)
        json_output(200, array('code'=>0 , 'message'=>"Data Not Updated"));
        else
        json_output(200, array('code'=>1 , 'message'=>"Data Updated Successfully"));
    }
}
public function UpdateProfileQualification()
{
    $method = $this->input->server('REQUEST_METHOD');
    if($method != "POST")
    {
        json_output(400, array('code'=>400 , 'message'=>"Bad Request"));
    }
    else{
        $params = json_decode(file_get_contents('php://input'), true);
        $data['qualification_id'] = $params['id'];
        $data['name'] = $params['institute_name'];
        $data['from_year'] = date('Y-m-d', strtotime($params['from_date']));
        $data['to_year'] = date('Y-m-d', strtotime($params['to_date']));
        $degree = $params['degree'];
        $data['education_level_id'] = $this->Dashboard_Model->getDegreeId($degree);
        $updateQualification = $this->Dashboard_Model->updateQualification($data);
        if($updateQualification == 0)
        json_output(200, array('code'=>0 , 'message'=>"Data Not Updated"));
        else
        json_output(200, array('code'=>1 , 'message'=>"Data Updated Successfully"));
    }
}
public function GetQualification()
    {
        $method = $this->input->server('REQUEST_METHOD');
        if($method != "POST")
        {
            json_output(400, array('code'=>400 , 'message'=>"Bad Request"));
        }
        else
        {
            $params = json_decode(file_get_contents('php://input'), true);
            $id = $params['id'];
            $record = $this->Dashboard_Model->getQualification($id);
            if($record == 0)
            {
                json_output(200, array('code'=>0 , 'message'=>"Data Not Present"));
            }
            else{
                json_output(200, array('code'=>0 , 'message'=>"Processed ok", 'data'=>$record));
            }
        }
    }
    public function GetExperience()
    {
        $method = $this->input->server('REQUEST_METHOD');
        if($method != "POST")
        {
            json_output(400, array('code'=>400 , 'message'=>"Bad Request"));
        }
        else
        {
            $params = json_decode(file_get_contents('php://input'), true);
            $id = $params['id'];
            $record = $this->Dashboard_Model->getExperience($id);
            if($record == 0)
            {
                json_output(200, array('code'=>0 , 'message'=>"Data Not Present"));
            }
            else{
                json_output(200, array('code'=>0 , 'message'=>"Processed ok", 'data'=>$record));
            }
        }
    }
public function addQualification()
{
    $method = $this->input->server('REQUEST_METHOD');
    if($method != "POST")
    {
        json_output(400, array('code'=>400 , 'message'=>"Bad Request"));
    }
    else
    {
        $params = json_decode(file_get_contents('php://input'), true);
        $qualification['employee_id'] = $params['id'];
        $qualification['name'] = $params['institute'];
        $qualification['language_id'] = 1;
        $qualification['from_year'] = date('Y-m-d' , strtotime($params['start_year']));
        $qualification['to_year'] = date('Y-m-d', strtotime($params['passing_year']));
        $qualification['education_level_id'] = $this->Dashboard_Model->getDegreeId($params['degree']);
        $qualification['created_at'] = date('Y-m-d H:i:s');
        if(!empty($params['attachment'])){
            $attachment = $this->upload_imageEducation($params['attachment']);
            if($attachment == 0)
            {
                json_output(200, array('code'=>00, 'message'=>"Image Not Saved"));
            }
            $document['employee_id'] = $params['id'];
            $document['document_type_id'] = 2;
            $document['title'] = "Certificate";
            $document['description'] = $params['description'];
            $document['document_file'] = "hrms-api/uploads/employee_document/".$attachment;
            $document['created_at'] = date('Y-m-d H:i:s');
            }
            else 
            {
                $document = "No Document";
            }
        $record = $this->Dashboard_Model->addQualification($qualification, $document);
        if($record == 0)
        {
            json_output(200, array('code'=>0 , 'message'=>"Data Not Entered"));
        }
        else{
            json_output(200, array('code'=>1 , 'message'=>"Qualification Added"));
        }

    }
}
public function addExperience()
{
    $method = $this->input->server('REQUEST_METHOD');
    if($method != "POST")
    {
        json_output(400, array('code'=>400 , 'message'=>"Bad Request"));
    }
    else
    {
        $params = json_decode(file_get_contents('php://input'), true);
        $experience['employee_id'] = $params['id'];
        $experience['company_name'] = $params['company_name'];
        $experience['post'] = $params['post'];
        $experience['from_date'] = date('Y-m-d', strtotime($params['start_date']));
        $experience['to_date'] = date('Y-m-d', strtotime($params['end_date']));
        $record = $this->Dashboard_Model->addExperience($experience);
        if($record == 0)
        {
            json_output(200, array('code'=>0 , 'message'=>"Data Not Entered"));
        }
        else{
            json_output(200, array('code'=>1 , 'message'=>"Experience added"));
        }

    }
}
public function updateDP()
{
    $method = $this->input->server('REQUEST_METHOD');
    if($method != "POST")
    {
        json_output(400, array('code'=>400 , 'message'=>"Bad Request"));
    }
    else
    {
        $params = json_decode(file_get_contents('php://input'), true);
        $data['user_id'] = $params['id'];
        $attachment = $this->upload_profileImage($params['attachment']);
        if($attachment == "")
        {
            json_output(200, array('code'=>00, 'message'=>"Image Not Saved"));
        }
        else{
        $data['profile_picture'] = "hrms-api/uploads/profile/".$attachment;

        $profile = $this->Dashboard_Model->update_profile_image($data);
        json_output(200, array('code'=>1, 'message'=>"Dp Uploaded"));
        }

    }
}
public function deleteQualification()
{
    $method = $this->input->server('REQUEST_METHOD');
    if($method != "POST")
    {
        json_output(400, array('code'=>400, 'message'=>"Bad Request"));
    }
    else
    {
        $params = json_decode(file_get_contents('php://input'),true);
        $q_id = $params['id'];
        if($q_id == "")
        {
            json_output(200, array('code'=>0, 'message'=>"Quaification id cannot be null"));
        }
        else{
        $delete = $this->Dashboard_Model->deleteQualification($q_id);
        if($delete == 0)
        {
            json_output(200, array('code'=>0, 'message'=>"Some Problem Occured"));
        }
        else
        json_output(200, array('code'=>1, 'message'=>'Successfully Deleted'));
    }
    }
}
public function deleteExperience()
{
    $method = $this->input->server('REQUEST_METHOD');
    if($method != "POST")
    {
        json_output(400, array('code'=>400, 'message'=>"Bad Request"));
    }
    else
    {
        $params = json_decode(file_get_contents('php://input'),true);
        $e_id = $params['id'];
        if($e_id == "")
        {
            json_output(200, array('code'=>0, 'message'=>"Experience id cannot be null"));   
        }
        else{
        $delete = $this->Dashboard_Model->deleteExperience($e_id);
        if($delete == 0)
        {
            json_output(200, array('code'=>0, 'message'=>"Some Problem Occured"));
        }
        else
        json_output(200, array('code'=>1, 'message'=>'Successfully Deleted'));
       }
    }
}
}