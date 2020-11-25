<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Dashboard_Model extends CI_Model {

public function getJobs()
{
    $this->db->where('xin_jobs.status' , 1);
    //$this->db->select('*');
    $this->db->select('xin_job_images.image, xin_minimum_education.minimum_education, xin_departments.department_name,xin_jobs.job_id,xin_jobs.employer_id,xin_jobs.created_at,xin_jobs.date_of_closing,xin_jobs.category_id, xin_jobs.company_id,xin_jobs.job_title,xin_jobs.designation_id,xin_jobs.job_url,xin_jobs.job_type,xin_jobs.minimum_experience, xin_jobs.gender, xin_jobs.short_description, xin_jobs.long_description, xin_job_type.type');
    $this->db->join('xin_users','xin_users.user_id = xin_jobs.employer_id');
    $this->db->join('xin_job_type','xin_job_type.job_type_id = xin_jobs.job_type');
    $this->db->join('xin_designations','xin_designations.designation_id = xin_jobs.designation_id');
    $this->db->join('xin_departments','xin_departments.department_id = xin_designations.department_id');
    $this->db->join('xin_job_education','xin_job_education.job_id = xin_jobs.job_id');
    $this->db->join('xin_minimum_education','xin_minimum_education.minimum_education_id = xin_job_education.minimum_education_id');
    $this->db->join('xin_job_images' , 'xin_job_images.category_id = xin_jobs.category_id');
    $jobs = $this->db->get('xin_jobs');
    $i = 0;
    if($jobs->num_rows()==0)
    {
        return 0;
    }
    $jobs = $jobs->result();
    foreach($jobs as $j){
        if($j->minimum_experience == 11)
        $jobs[$i]->minimum_experience = "Above 11 Years Experience";
        else if($j->minimum_experience == 10)
        $jobs[$i]->minimum_experience = "Minimum 10 Year Experience";
        else if($j->minimum_experience == 9)
        $jobs[$i]->minimum_experience = "Minimum 9 Year Experience";
        else if($j->minimum_experience == 8)
        $jobs[$i]->minimum_experience = "Minimum 8 Years Experience";
        else if($j->minimum_experience == 7)
        $jobs[$i]->minimum_experience = "Minimum 7 Years Experience";
        else if($j->minimum_experience == 6)
        $jobs[$i]->minimum_experience = "Minimum 6 Years Experience";
        else if($j->minimum_experience == 5)
        $jobs[$i]->minimum_experience = "Minimum 5 Year Experience";
        else if($j->minimum_experience == 4)
        $jobs[$i]->minimum_experience = "Minimum 4 Years Experience";
        else if($j->minimum_experience == 3)
        $jobs[$i]->minimum_experience = "Minimum 3 Years Experience";
        else if($j->minimum_experience == 2)
        $jobs[$i]->minimum_experience = "Minimum 2 Years Experience";
        else if($j->minimum_experience == 1)
        $jobs[$i]->minimum_experience = "Minimum 1 Year Experience";
        else if($j->minimum_experience == 0)
        $jobs[$i]->minimum_experience = "Fresh";
        if($j->gender == 2)
        $jobs[$i]->gender = "Male";
        else if($j->gender == 1)
        $jobs[$i]->gender = "Female";
        else if($j->gender == 0)
        $jobs[$i]->gender = "No Preference";
        $jobs[$i]->job_url = "http://10.0.115.101/hrms/jobs/detail/".$jobs[$i]->job_url;
        $i++;
    }
    return $jobs;
}
public function getUpcomingEvents()
{
    // $url = "logo_1597746768.jpg";    
    $current_date = date('Y-m-d');
    $this->db->where('event_date >',$current_date);
    $this->db->join('xin_event_images', 'xin_event_images.event_id = xin_events.event_id');
    $events = $this->db->get('xin_events');
    if($events->num_rows()==0)
    {
        return 0;
    }
    $events = $events->result_array();
    // $events['image_url'] = $url;
    return $events;
}
public function getPresentEvents()
{
    $current_date = date('Y-m-d');
    $this->db->where('event_date',$current_date);
    $this->db->join('xin_event_images', 'xin_event_images.event_id = xin_events.event_id');
    //$query = "select * from xin_events where event_date > ".$current_date;
    $events = $this->db->get('xin_events');
    if($events->num_rows()==0)
    {
        return 0;
    }
    $events = $events->result();
    return $events;
}
public function getPastEvents()
{
    $current_date = date('Y-m-d');
    $this->db->where('event_date <',$current_date);
    $this->db->join('xin_event_images', 'xin_event_images.event_id = xin_events.event_id');
    //$query = "select * from xin_events where event_date > ".$current_date;
    $events = $this->db->get('xin_events');
    if($events->num_rows()==0)
    {
        return 0;
    }
    $events = $events->result();
    return $events;
}
public function getLeaves($id)
{
    $this->db->where('employee_id', $id);
    $this->db->select('applied_on,reason,xin_leave_applications.status,is_half_day,type_name');
    $this->db->from('xin_leave_applications');
    $this->db->join('xin_leave_type','xin_leave_type.leave_type_id = xin_leave_applications.leave_type_id');
    $result = $this->db->get();
    $i = 0;
    if($result->num_rows()==0)
    {
        return 0;
    }
    else{
    $result = $result->result();
    foreach($result as $r){
    if($r->is_half_day == 0)
    {
        $result[$i]->is_half_day = "No";
    }
    else
    $result[$i]->is_half_day = "Yes";
    if($r->status == 1)
    {
        $result[$i]->status = "Pending";
    }
    else if($r->status == 2)
    {
        $result[$i]->status = "Approved";
    }
    else
    $result[$i]->status = "Rejected";
    $i++;
    }
}
    return $result;
}
public function getAbsents($id)
{
    if(empty($id))
    {
        return "First Login";
    }
    $days = date("d");
    $j = 0;
    $Record = array();
    for($i = 0; $i< $days; $i++){
    $current_date = date('Y-m-').($i+1);
    $date = date('Y-m-d', strtotime($current_date));
    $holiday = date('l', strtotime($current_date));
    $this->db->where('xin_attendance_time.employee_id', $id);
    $this->db->where('attendance_date', $date);
    $this->db->select('attendance_status, attendance_date');
    $attendance = $this->db->get('xin_attendance_time');
    if($attendance->num_rows()==0)
    {
        if($holiday === "Saturday" || $holiday === "Sunday")
        {
        }
        else{
        $Record[$j] = $date;
        $j++;
        }
    }

}
return $Record;
}
public function getPresents($id)
{
    $present = array();
    $days = date("d");
    $j = 0;
    for($i = 0; $i< $days; $i++){
        $current_date = date('Y-m-').($i+1);
        $date = date('Y-m-d', strtotime($current_date));
        $holiday = date('l', strtotime($current_date));
        $this->db->where('xin_attendance_time.employee_id', $id);
        $this->db->where('attendance_date', $date);
        $this->db->where('attendance_status', 'Present');
        $this->db->select('attendance_date');
        $attendance = $this->db->get('xin_attendance_time');
        if($attendance->num_rows()== 0)
        {}
        else
        {
            $attendance = $attendance->result_array();
            foreach($attendance as $a)
            {
                $present[$j] = $a['attendance_date'];
                $j++;
            }
        }
}
return $present;
}
public function getLates($id)
{
    $late = array();
    $days = date("d");
    $j = 0;
    for($i = 0; $i< $days; $i++){
        $current_date = date('Y-m-').($i+1);
        $date = date('Y-m-d', strtotime($current_date));
        $holiday = date('l', strtotime($current_date));
        $this->db->where('xin_attendance_time.employee_id', $id);
        $this->db->where('attendance_date', $date);
        $this->db->where('attendance_status', 'Late');
        $this->db->select('attendance_date');
        $attendance = $this->db->get('xin_attendance_time');
        if($attendance->num_rows()== 0)
        {}
        else
        {
            $attendance = $attendance->result_array();
            foreach($attendance as $a)
            {
                $late[$j] = $a['attendance_date'];
                $j++;
            }
        }
}
return $late;
}
public function addLeave($data)
{
    $this->db->insert('xin_leave_applications',$data);
    $id = $this->db->insert_id();
    if($id > 0)
    {
        return true;
    }
    else 
    {
        return false;
    }
}
public function addLeaveMedical($data)
{
    $this->db->insert('xin_leave_applications',$data);
    $id = $this->db->insert_id();
    if($id > 0)
    {
        return true;
    }
    else 
    {
        return false;
    }
}

public function allTasks($id)
{
    $this->db->select('xin_task_images.image, xin_tasks.task_id,task_name,assigned_to,start_date,end_date,task_hour,description,first_name,last_name');
    $this->db->join('xin_employees', 'xin_employees.user_id = xin_tasks.created_by');
    $this->db->join('xin_task_images' , 'xin_task_images.task_id = xin_tasks.project_id');
    $tasks = $this->db->get('xin_tasks');
    $tasks = $tasks->result();
    $i = 0;
    $k = 0;
    $data = array();
    for($j = 0; $j< count($tasks); $j++){
    $employees = explode(',', $tasks[$j]->assigned_to);
    foreach($employees as $e)
    {
        if($e == $id)
        {
            $this->db->select('first_name, last_name');
            $this->db->where('user_id',$id);
            $user = $this->db->get('xin_employees');
            $user = $user->result();
            $data[$k] = array(
            'task_name' => $tasks[$j]->task_name,
            'assigned_to' => $user[0]->first_name." ".$user[0]->last_name,
            'start_date' =>$tasks[$j]->start_date,
            'end_date' =>$tasks[$j]->end_date,
            'image' => $tasks[$j]->image,
            'description' => $tasks[$j]->description,
            );
            $k++;
        }
        $i++;   
    }
}
if(empty($data))
{
    return 0;
}
else
    return $data;
}
public function getDegreeId($degree)
{
    $this->db->select('education_level_id');
    $this->db->where('name', $degree);
    $degree_id = $this->db->get('xin_qualification_education_level');
    if($degree_id->num_rows() == 0)
    {
        $data = array(
            'company_id' => 1,
            'name' => $degree,
            'created_at' => date('Y-m-d H:i:s')
        );
        $this->db->insert('xin_qualification_education_level',$data);
        $id = $this->db->insert_id();
    }
    else{
    $degree_id = $degree_id->result_array();
    $id = $degree_id[0]['education_level_id'];
    }
    return $id; 
}

public function editProfile($data, $cnic, $mac)
{
    $this->db->where('user_id' , $data['user_id']);
    $this->db->select('*');
    $id_exist = $this->db->get('xin_employees');
    if($id_exist->num_rows() == 0)
    {
        return 0;
    }
    else{
    $this->db->where('user_id',$data['user_id']);
    $done = $this->db->update('xin_employees',$data);

    $this->db->select('*');
    $this->db->where('employee_id',$cnic['employee_id']);
    $cnic_record = $this->db->get('xin_cnic');
    if($cnic_record->num_rows()>0)
    {
        $this->db->where('employee_id',$cnic['employee_id']);
        $cnic = $this->db->update('xin_cnic',$cnic);
    }
    else
    $cnic = $this->db->insert('xin_cnic',$cnic);

    $this->db->select('*');
    $this->db->where('employee_id',$mac['employee_id']);
    $mac_address = $this->db->get('xin_macaddress');
    if($mac_address->num_rows()>0)
    {
        $this->db->where('employee_id',$mac['employee_id']);
        $mac_address = $this->db->update('xin_macaddress',$mac);
    }
    else
    $mac_address = $this->db->insert('xin_macaddress',$mac);

    if($done == true && $cnic == true)
    {
        return true;
    }
}
}
public function getLeavesEmployee($id)
{
    $this->db->where('employee_id', $id);
    $this->db->where('leave_type_id', 2);
    $this->db->select('*');
    $getLeaves = $this->db->get('xin_leave_applications');
    if($getLeaves->num_rows()>20)
    {
        return 0;
    }
    else
    return 1;
}
public function getDepartment($id)
{
    $this->db->where('user_id', $id);
    $this->db->select('department_id');
    $dept = $this->db->get('xin_employees')->result_array();
    return $dept[0]['department_id'];
}
public function getLeavesAnnualEmployee($id)
{
    $this->db->where('employee_id', $id);
    $this->db->where('leave_type_id', 3);
    $this->db->select('*');
    $getLeaves = $this->db->get('xin_leave_applications');
    if($getLeaves->num_rows()>20)
    {
        return 0;
    }
    else
    return 1;
}
public function getLeavesCasualEmployee($id)
{
    $this->db->where('employee_id', $id);
    $this->db->where('leave_type_id', 1);
    $this->db->select('*');
    $getLeaves = $this->db->get('xin_leave_applications');
    if($getLeaves->num_rows()>20)
    {
        return 0;
    }
    else
    return 1;
}
public function adminMessages($employee_id)
{
    $this->db->where('from_id', 1);
    $this->db->where('to_id' , $employee_id);
    $this->db->select('message_content , message_date');
    $received = $this->db->get('xin_chat_messages');

    $this->db->where('from_id', $employee_id);
    $this->db->where('to_id' , 1);
    $this->db->select('message_content , message_date');
    $sent = $this->db->get('xin_chat_messages');
    if($received->num_rows()==0 && $sent->num_rows() == 0)
    {
        return 0;
    }
    
    else
    {
        $messages['received'] = $received->result();
        $messages['sent'] = $sent->result();
    return $messages;
    }
}

public function notifications($id)
{
    $url = base_url();
    $i=0;
    //Jobssss
    $this->db->where('xin_jobs.status' , 1);
    $this->db->select('xin_job_images.image, xin_jobs.job_title, xin_jobs.short_description, xin_jobs.long_description, xin_jobs.created_at');
    $this->db->join('xin_job_images', 'xin_job_images.category_id = xin_jobs.category_id');
    $jobs = $this->db->get('xin_jobs');
    if($jobs->num_rows()==0)
    {
        $jobs = 0;
    }
    else{
    $jobs = $jobs->result();
    foreach($jobs as $j)
    {
        $notification[$i]['title'] = $j->job_title;
        $notification[$i]['description'] = $j->long_description;
        $notification[$i]['date'] = date('Y-m-d', strtotime($j->created_at));
        $notification[$i]['image'] = $j->image;
        $i++;
    }
    }  


    //EVENTS
    $this->db->select('xin_event_images.image, event_title, event_date, event_note, first_name, last_name, xin_events.created_at');
    $this->db->join('xin_employees','xin_employees.user_id = xin_events.employee_id');
    $this->db->join('xin_event_images', 'xin_event_images.event_id = xin_events.event_id');
    $events = $this->db->get('xin_events');
    $events = $events->result();
    $url = base_url();
        $url = explode('index.php/', $url);
        $url = $url[0]."uploads/logo/logo_1597746768.jpg";
    foreach($events as $j)
    {
        $notification[$i]['title'] = $j->event_title;
        $notification[$i]['description'] = $j->event_note;
        $notification[$i]['date'] = date('Y-m-d', strtotime($j->created_at));
        $notification[$i]['image'] = $j->image;
        $i++;
    }


    //TODO
    $this->db->select('xin_task_images.image , task_name,assigned_to,description,first_name, start_date, last_name,xin_tasks.created_at');
    $this->db->join('xin_employees', 'xin_employees.user_id = xin_tasks.created_by');
    $this->db->join('xin_task_images', 'xin_task_images.task_id = xin_tasks.project_id');
    $tasks = $this->db->get('xin_tasks');
    $tasks = $tasks->result();
    //$l = 0;
    $k = 0;
    $data = array();
    for($j = 0; $j< count($tasks); $j++){
    $employees = explode(',', $tasks[$j]->assigned_to);
    foreach($employees as $e)
    {
        if($e == $id)
        {
            $this->db->select('first_name, last_name');
            $this->db->where('user_id',$id);
            $user = $this->db->get('xin_employees');
            $user = $user->result();
            $data[$k] = array(
            'task_name' => $tasks[$j]->task_name,
            'description' => $tasks[$j]->description,
            'start_date' => $tasks[$j]->start_date,
            'image' => $tasks[$j]->image,
            'created_at' => date('Y-m-d',strtotime($tasks[$j]->created_at))
            );
            $k++;
        }
    }
}
foreach($data as $j)
    {
        $notification[$i]['title'] = $j['task_name'];
        $notification[$i]['description'] = $j['description'];
        $notification[$i]['date'] = $j['created_at'];
        $notification[$i]['image'] = $j['image'];
        $i++;
    }
if(empty($notification))
return 0;
else
{
    return $notification;
}
}
public function markAttendanceCheckIn($data)
{
    $this->db->select('*');
    $this->db->where('user_id', $data['id']);
    $recordA=$this->db->get('xin_employees');
    if($recordA->num_rows()==0)
    {
        return "Id Doesnot Exist";
    }
    $datetime = new DateTimeZone('GMT+5');
    $current_time= (new DateTime('',$datetime))->Format('Y-m-d H:i:s');
    $login = date('H:i:s',strtotime('+1 hour', strtotime($data['in_time'])));
    $this->db->where('employee_id', $data['id']);
    $this->db->where('attendance_date', date('Y-m-d'));
    $this->db->select('clock_in');
    $record = $this->db->get('xin_attendance_time');
    
    if($record->num_rows()>0)
    {
        $record = $record->result();
        return "Already Checked In At ".$record[0]->clock_in;
    }
    else{
    $this->db->select('mac_address');
    $this->db->where('xin_macaddress.employee_id', $data['id']);
    $result = $this->db->get('xin_macaddress');
    
    $result = $result->result();
    $time_late=(strtotime(date($current_time))-strtotime($login))/3600;
    $time_late =sprintf('%02d:%02d', (int) $time_late, fmod($time_late, 1) * 60);
    if($time_late > date("H:i",strtotime("00:00")))
    {
        $status = "Late";
    }
    else
    {
        $status = "Present";
    }
    if($result[0]->mac_address == $data['mac_address'])
    {
        $attendance = array(
            'employee_id' => $data['id'],
            'attendance_date' => date('Y-m-d'),
            'clock_in' => $current_time,
            'time_late' => $current_time,
            'attendance_status' => $status,
            'clock_out' => ''
        );
        $marked = $this->db->insert('xin_attendance_time', $attendance);
        if($marked == 1)
        {
        return $current_time;
        }
    }
    else
    {
        return "MAC address Error";
    }
    }
}
public function markAttendanceCheckOut($data)
{
    $datetime = new DateTimeZone('GMT+5');
    $current_time= (new DateTime('',$datetime))->Format('Y-m-d H:i:s');
    $this->db->where('attendance_date', date('Y-m-d'));
    $this->db->where('xin_attendance_time.employee_id', $data['id']);
    $this->db->select('mac_address');
    $this->db->join('xin_macaddress','xin_macaddress.employee_id = xin_attendance_time.employee_id');
    $this->db->join('xin_employees','xin_employees.user_id = xin_attendance_time.employee_id');
    $record = $this->db->get('xin_attendance_time');
    $record = $record->result();
    if($record[0]->mac_address == $data['mac_address'])
    {
        $attendance = array(
            'clock_out'=> $current_time,
            'early_leaving' => $current_time,
            'overtime' => $current_time
        );
        $this->db->where('attendance_date' , date('Y-m-d'));
        $this->db->where('employee_id', $data['id']);
        $saved = $this->db->update('xin_attendance_time', $attendance);

        if($saved)
        return $current_time;
        else
        return 0;
    }
    else{
        if($record[0]->mac_address != $data['mac_address'])
        return "MAC address Error";
        else
        return "Password Mismatch";
    }
}
public function getLeavesCount($id)
{
    $this->db->where('employee_id', $id);
        $this->db->select('*');
        $result = $this->db->get('xin_leave_applications');
        $result = $result->num_rows();
        return $result;

}
public function getNotificationsPopup($id)
{
    $i = 0;
    $noti = array();
    // EVENTS
    $this->db->select('event_title , event_note');
    $this->db->where('created_at' , date('Y-m-d'));
    $event = $this->db->get('xin_events');
    $event = $event->result();
    foreach($event as $e)
    {
        $noti[$i]['title'] = $e->event_title;
        $noti[$i]['message'] = $e->event_note;
        $i++;
    }
    //JOBS 
    $this->db->select('job_title, long_description, created_at');
    $jobs = $this->db->get('xin_jobs');
    $jobs = $jobs->result();
    foreach($jobs as $j)
    {
        $date = date('Y-m-d', strtotime($j->created_at));
        if($date == date('Y-m-d')){
        $noti[$i]['title'] = $j->job_title;
        $noti[$i]['message'] = $j->long_description;
        $i++;
        }
    }

    //TASKS
    $this->db->select('assigned_to , task_name, description ,created_at');
    $tasks = $this->db->get('xin_tasks');
    $tasks = $tasks->result();
    foreach($tasks as $t)
    {
        $date = date('Y-m-d', strtotime($t->created_at));
        if($date == date('Y-m-d'))
        {
            $people = explode(',', $t->assigned_to);
            foreach($people as $p)
            {
                if($p == $id)
                {
                    $noti[$i]['title'] = $t->task_name;
                    $noti[$i]['message'] = $t->description;
                    $i++;
                }
            }
        }
    }
    return $noti;
}
public function getDeviceToken($id)
{
    $this->db->where('employee_id' , $id);
    $this->db->select('device_token');
    $token = $this->db->get('xin_device_tokens');
    return $token->result();
}
public function getDegree()
{
    $this->db->select('name');
    $result = $this->db->get('xin_qualification_education_level');
    return $result->result_array();
} 
public function getProfile($id)
{
    $this->db->select('employee_id');
    $this->db->where('user_id', $id);
    $exist = $this->db->get('xin_employees');
    if($exist->num_rows()>0)
    {
    $this->db->select('first_name, designation_name, profile_picture, last_name, email, date_of_birth, contact_no, marital_status, blood_group, address, cnic');
    $this->db->where('user_id', $id);
    $this->db->join('xin_cnic', 'xin_cnic.employee_id='.$id);
    $this->db->join('xin_designations', 'xin_designations.designation_id = xin_employees.designation_id');
    $result = $this->db->get('xin_employees')->result_array();
    $result = $result[0];
    $result['full_name'] = $result['first_name'].' '.$result['last_name'];
    $this->db->select('xin_employee_qualification.name as institute_name, xin_employee_qualification.from_year as qualification_start_year,xin_employee_qualification.to_year as qualification_end_year, xin_qualification_education_level.name as degree');
    $this->db->where('employee_id', $id);
    $this->db->join('xin_qualification_education_level', 'xin_qualification_education_level.education_level_id=xin_employee_qualification.education_level_id');
    $qualification = $this->db->get('xin_employee_qualification');
    $count = $qualification->num_rows();
    if($count>0){
    $qualification = $qualification->result_array();
    for($i=0; $i<$count; $i++)
    {
        $result['education'][$i] = $qualification[$i];
    }
    }
    else
    {
        $result['education'] = null;
    }
    $this->db->select('xin_employee_qualification.qualification_id, xin_employee_qualification.name as institute_name, xin_employee_qualification.from_year as qualification_start_year,xin_employee_qualification.to_year as qualification_end_year, xin_qualification_education_level.name as degree');
    $this->db->where('employee_id', $id);
    $this->db->join('xin_qualification_education_level', 'xin_qualification_education_level.education_level_id=xin_employee_qualification.education_level_id');
    $qualification = $this->db->get('xin_employee_qualification');
    $count = $qualification->num_rows();
    if($count>0){
    $qualification = $qualification->result_array();
    for($i=0; $i<$count; $i++)
    {
        $result['education'][$i] = $qualification[$i];
    }
    }
    else
    {
        $result['education'] = null;
    }
    $this->db->select('work_experience_id, company_name, from_date, to_date, post');
    $this->db->where('employee_id', $id);
    $total_experience = $this->db->get('xin_employee_work_experience');
    $count = $total_experience->num_rows();
    if($count>0){
    $total_experience = $total_experience->result_array();
    for($i=0; $i<$count; $i++)
    {
        $result['experience'][$i] = $total_experience[$i];
    }
    }
    else
    {
        $result['experience'] = null;
    }

    if(!empty($result))
    return $result;
    // company_name, post, from_date as experience_start_date,to_date as experience_end_date
    else
    return "Data Doesnot Exist";
    }
    else
    {
        return "ID Doesnot Exist";
    }
}
public function updateExperience($data){
    $w_id = $data['work_experience_id'];
    $this->db->where('work_experience_id', $w_id);
    $query = $this->db->update('xin_employee_work_experience', $data);
    if($this->db->affected_rows()>0)
    {
        return 1;
    }
    else
    {
        return 0;
    }
}
public function updateQualification($data){
    $e_id = $data['qualification_id'];
    $this->db->where('qualification_id', $e_id);
    $this->db->update('xin_employee_qualification', $data);
    if($this->db->affected_rows()>0)
    {
        return 1;
    }
    else
    {
        return 0;
    }
}
public function getQualification($id)
{
    $this->db->where('qualification_id', $id);
    $this->db->select('xin_employee_qualification.name as institute_name, from_year, to_year, xin_qualification_education_level.name');
    $this->db->join('xin_qualification_education_level', 'xin_qualification_education_level.education_level_id = xin_employee_qualification.education_level_id');
    $record = $this->db->get('xin_employee_qualification')->result_array();
    $record[0]['time'] = date('Y', strtotime($record[0]['from_year'])).'-'.date('Y', strtotime($record[0]['to_year']));
    return $record[0];
}
public function getExperience($id)
{
    $this->db->where('work_experience_id', $id);
    $this->db->select('xin_employee_work_experience.company_name, from_date, to_date, post');
    $record = $this->db->get('xin_employee_work_experience')->result_array();
    $record[0]['time'] = date('Y', strtotime($record[0]['from_date'])).'-'.date('Y', strtotime($record[0]['to_date']));
    return $record[0];
}
public function addQualification($data, $document)
{
    $this->db->insert('xin_employee_qualification', $data);
    if($this->db->affected_rows()>0)
    {
        if($document == "No Document")
        {
            $doc = true;
        }
        else{
        $doc = $this->db->insert('xin_employee_documents', $document);
        }    
        return 1;
    }
    else
    return 0;
}
public function addExperience($data)
{
    $this->db->insert('xin_employee_work_experience', $data);
    if($this->db->affected_rows()>0)
    {
        return 1;
    }
    else
    return 0;
}
public function update_profile_image($data)
{
    $this->db->where('user_id', $data['user_id']);
    $this->db->update('xin_employees', $data);
    if($this->db->affected_rows()>0)
    {
        return 1;
    }
    else
    return 0;
}
public function deleteQualification($id)
{
    $this->db->where('qualification_id', $id);
    $query = $this->db->delete('xin_employee_qualification');
    return 1;
    
}
public function deleteExperience($id)
{
    $this->db->where('work_experience_id', $id);
    $query = $this->db->delete('xin_employee_work_experience');
    return 1;
    }
}
?>