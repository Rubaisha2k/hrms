<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Employee_data extends CI_Model
{
    public function __construct()
    {
        parent::__construct();
        $this->load->database();
    }
    public function getData()
    {
        $this->db->select('*');
        $result = $this->db->get('xin_employees');
        return($result->result());
    }
    public function add($row)
    {
        if($row['A']=='employee_id')
        {
        }
        else{
        $dob = (new DateTime($row['L']))->format('Y-m-d');
        $date_join = (new DateTime($row['R']))->format('Y-m-d');
        $date_created_at = (new DateTime($row['W']))->format('Y-m-d');
        $data = array(
        'employee_id' => $row['A'],
		'office_shift_id' => $row['B'],
		'reports_to' => $row['C'],
		'first_name' => $row['D'],
		'last_name'  => $row['E'],
		'username' => $row['F'],
		'company_id' => $row['G'],
		'location_id' => $row['H'],
		'email' => $row['I'],
		'password' => $row['J'],
		'pincode' => $row['K'],
		'date_of_birth' => $dob,
		'gender' => $row['M'],
		'user_role_id' => $row['N'],
		'department_id' => $row['O'],
		'sub_department_id' => $row['P'],
		'designation_id' => $row['Q'],
		'date_of_joining' => $date_join,
		'contact_no' => $row['S'],
		'address' => $row['T'],
		'is_active' => $row['U'],
		'leave_categories' => $row['V'],
        'created_at' => $date_created_at,
        'state' => $row['X'],
        'city' => $row['Y'],
        'zipcode' => $row['Z'],
        'salary' => $row['AA'],
        'basic_salary' => $row['AB']
        
        );
        $query = $this->db->insert('xin_employees', $data);
        if($query)
        return true;
        else 
        return false;
        
    }
    return false;
    }
}

?>