<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Notification_Model extends CI_Model {

public function getIdsEvents()
{
    $this->db->select('device_token');
    $result = $this->db->get('xin_device_tokens');
    $result = $result->result_array();
    return $result;
}

public function getIdsTasks($ids)
{
    $result = array();
    foreach($ids as $i){
    $this->db->select('device_token');
    $this->db->where('employee_id', $i);
    $row = $this->db->get('xin_device_tokens');
    $result[] = $row->result_array();
    }
    return $result;
}
}
?>