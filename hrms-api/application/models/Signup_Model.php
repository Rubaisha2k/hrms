<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Signup_Model extends CI_Model
{
    public function signup($data)
    {
        $this->db->insert('xin_employees',$data);
        return $this->db->insert_id();
    }
    public function login($id, $pass)
    {
        $this->db->where('employee_id',$id);
        $this->db->select('*');
        $this->db->join('xin_designations', 'xin_designations.designation_id = xin_employees.designation_id');
        $result = $this->db->get('xin_employees');
        if($result->num_rows() == 0)
        {
            return 0;
        }
        else{
            $result = $result->result();
            $password = password_verify($pass, $result[0]->password);
            if($password == 1)
                return $result;
        }
    }
    public function checkId($id)
    {
        $this->db->where('user_id',$id);
        $this->db->select('*');
        $result = $this->db->get('xin_employees');
        $result = $result->num_rows();
        return $result;
    }
    public function saveDeviceToken($id, $device_token)
    {
        $this->db->where('user_id', $id);
        $this->db->select('user_id');
        $row = $this->db->get('xin_employees');
        if($row->num_rows()>0){
        $data = array(
            'employee_id' => $id,
            'device_token' => $device_token
        );
        $this->db->select('employee_id');
        $this->db->where('employee_id', $id);
        $row = $this->db->get('xin_device_tokens');
        if($row->num_rows()>0)
        {
            $this->db->where('employee_id', $id);
            $query = $this->db->update('xin_device_tokens', $data);
        }
        else
        $query = $this->db->insert('xin_device_tokens',$data);
        if($query)
        return true;
    }
    else
    return false;
    }
}
?>