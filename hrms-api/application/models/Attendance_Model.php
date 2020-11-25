<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Attendance_Model extends CI_Model
{
    public function attendance($id)
    {
        $this->db->select('user_id,first_name,last_name,shift_name,monday_in_time,
        tuesday_in_time,wednesday_in_time,thursday_in_time,friday_in_time,
        monday_out_time,tuesday_out_time,wednesday_out_time,thursday_out_time,friday_out_time');
        $this->db->where('user_id', $id);
        $this->db->join('xin_office_shift', 'xin_office_shift.office_shift_id=xin_employees.office_shift_id');
        $result = $this->db->get('xin_employees');
        $result = $result->result();
        if(empty($result))
        {
            return 0;
        }
        else
        return $result;
    }
    public function markattendance($getData, $in_time, $out_time)
    {
        $datetime = new DateTimeZone('GMT+5');
        $time = (new DateTime('',$datetime))->format('Y-m-d H:i:s');
        $date = (new DateTime('', $datetime))->format('Y-m-d');
        $login = date('H:i:s',strtotime('+1 hour', strtotime($in_time)));
        $this->db->select('');
        $this->db->from('xin_attendance_time');
        $this->db->where('employee_id' , $getData[0]->user_id);
        $this->db->where('attendance_date', $date);
        $status = $this->db->get();
        $row = $status->num_rows();
        $status = $status->result();
        $current_time= (new DateTime('',$datetime))->Format('H:i:s');
        $time_late=(strtotime(date($current_time))-strtotime($login))/3600;
        $time_late =sprintf('%02d:%02d', (int) $time_late, fmod($time_late, 1) * 60);
        $early_leaving = abs((strtotime($out_time)-strtotime(date($current_time)))/3600);
        $early_leaving= sprintf('%02d:%02d', (int) $early_leaving, fmod($early_leaving, 1) * 60);
        $overtime = ceil((strtotime(date($current_time))-strtotime($out_time))/3600);
        $overtime= sprintf('%02d:%02d', (int) $overtime, fmod($overtime, 1) * 60);
        if($overtime<0)
        {
            $overtime = 0;
        }
        if($early_leaving<0)
        {
            $early_leaving = 0;
        }
        else if($row>0){
            $this->db->select('clock_in');
            $this->db->where('employee_id', $getData[0]->user_id);
            $this->db->where('attendance_date', $date);
            $this->db->from('xin_attendance_time');
            $clock_in=$this->db->get();
            $clock_in=$clock_in->result();
            $total_work = (strtotime($time)-strtotime($clock_in[0]->clock_in))/3600;
            $total_work = sprintf('%02d:%02d', (int) $total_work, fmod($total_work, 1) * 60);
            $data = array(
                'clock_out' => $time,
                'early_leaving' => $early_leaving,
                'overtime' => $overtime,
                'total_work' => $total_work
            );
            $this->db->where('employee_id', $getData[0]->user_id);
            $this->db->update('xin_attendance_time', $data);
            return $data;
        }  
        else
        {
            if($time_late > date("H:i",strtotime("09:00"))){}
            else{
                if($time_late > date("H:i",strtotime("00:00")))
                {
                    $data = array(
                        'employee_id' => $getData[0]->user_id,
                        'attendance_date' => (new DateTime())->format('Y-m-d'),
                        'attendance_status' => "Late", 
                        'clock_in' => $time,
                        'time_late' =>$time_late,
                        'clock_out' => '',
                        'clock_in_latitude'=>1,
                        'clock_in_longitude'=>1,
                        'clock_out_latitude'=>1,
                        'clock_out_longitude'=>1,
                    );
                }
                else{
            $data = array(
                'employee_id' => $getData[0]->user_id,
                'attendance_date' => (new DateTime())->format('Y-m-d'),
                'attendance_status' => "Present", 
                'clock_in' => $time,
                'time_late' =>$time_late,
                'clock_out' => '',
                'clock_in_latitude'=>1,
                'clock_in_longitude'=>1,
                'clock_out_latitude'=>1,
                'clock_out_longitude'=>1,
            );
        }
            $this->db->insert('xin_attendance_time', $data);
            return $data;
         }   
         }
         return 0;

    }
}
?>