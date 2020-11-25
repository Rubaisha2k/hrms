<?php
	defined('BASEPATH') OR exit('No direct script access allowed');
	class payroll_model extends CI_Model
	{
 
    public function __construct()
    {
        parent::__construct();
        $this->load->database();
    }
 
	// get payroll templates
	public function get_templates() {
	  return $this->db->get("xin_salary_templates");
	}
	
	// get payroll templates > for companies
	public function get_comp_template($cid,$id) {
		
		$sql = 'SELECT * FROM xin_employees WHERE company_id = ? and user_role_id!=?';
		$binds = array($cid,1);
		$query = $this->db->query($sql, $binds);
		return $query;
	}
	// get payroll templates > employee/company
	public function get_employee_comp_template($cid,$id) {
		
		$sql = 'SELECT * FROM xin_employees WHERE company_id = ? and user_id = ?';
		$binds = array($cid,$id);
		$query = $this->db->query($sql, $binds);
		return $query;
	}
	
	// get total hours work > hourly template > payroll generate
	public function total_hours_worked($id,$attendance_date) {
		
		$sql = 'SELECT * FROM xin_attendance_time WHERE employee_id = ? and attendance_date like ?';
		$binds = array($id, '%'.$attendance_date.'%');
		$query = $this->db->query($sql, $binds);
		return $query;
	}
	
	// get total hours work > hourly template > payroll generate
	public function total_hours_worked_payslip($id,$attendance_date) {
		$sql = 'SELECT * FROM xin_attendance_time WHERE employee_id = ? and attendance_date like ?';
		$binds = array($id, '%'.$attendance_date.'%');
		$query = $this->db->query($sql, $binds);
		return $query;
	}
	
	// get advance salaries > all employee
	public function get_advance_salaries() {
	  return $this->db->get("xin_advance_salaries");
	}
	
	// get advance salaries > single employee
	public function get_advance_salaries_single($id) {
	    
		$sql = 'SELECT * FROM xin_advance_salaries WHERE employee_id = ?';
		$binds = array($id);
		$query = $this->db->query($sql, $binds);
		return $query;
	}
	
	// get advance salaries report
	public function get_advance_salaries_report() {
	  $this->db->query("SET SESSION sql_mode = ''");
	  $return  = $this->db->query("SELECT advance_salary_id,employee_id,company_id,month_year,one_time_deduct,monthly_installment,reason,status,total_paid,is_deducted_from_salary,created_at,SUM(`xin_advance_salaries`.advance_amount) AS advance_amount FROM `xin_advance_salaries` where status=1 group by employee_id");
	  return $return ;
	}
	
	// get advance salaries report >> single employee > current user
	public function advance_salaries_report_single($id) {
	  	
		$this->db->query("SET SESSION sql_mode = ''");
		$sql = 'SELECT advance_salary_id,employee_id,company_id,month_year,one_time_deduct,monthly_installment,reason,status,total_paid,is_deducted_from_salary,created_at,SUM(`xin_advance_salaries`.advance_amount) AS advance_amount FROM `xin_advance_salaries` where status=1 and employee_id = ? group by employee_id';
		$binds = array($id);
		$query = $this->db->query($sql, $binds);
		return $query;
	}
	
	
	// get payment history > all payslips
	public function all_payment_history() {
	  return $this->db->get("xin_make_payment");
	}
	// new payroll > payslip
	public function employees_payment_history() {
	  return $this->db->get("xin_salary_payslips");
	}
	// currency_converter
	public function get_currency_converter() {
	  return $this->db->get("xin_currency_converter");
	}
	
	// get payslips of single employee
	public function get_payroll_slip($id) {
		
		$sql = 'SELECT * FROM xin_salary_payslips WHERE employee_id = ? and status = ?';
		$binds = array($id,2);
		$query = $this->db->query($sql, $binds);
		return $query;
	}
	public function get_company_payslips($id) {
		
		$sql = 'SELECT * FROM xin_salary_payslips WHERE company_id = ? and status = ?';
		$binds = array($id,2);
		$query = $this->db->query($sql, $binds);
		return $query;
	}
	// new payroll > payslip
	public function all_employees_payment_history() {
	  	$sql = 'SELECT * FROM xin_salary_payslips';
		$query = $this->db->query($sql);
		return $query;
	}
	// new payroll > payslip
	public function all_employees_payment_history_month($salary_month) {
	  	$sql = 'SELECT * FROM xin_salary_payslips WHERE salary_month = ?';
		$binds = array($salary_month);
		$query = $this->db->query($sql, $binds);
		return $query;
	}
	// get payslip history > company
	public function get_company_payslip_history($company_id) {
		
		$sql = 'SELECT * FROM xin_salary_payslips WHERE company_id = ?';
		$binds = array($company_id,$salary_month);
		$query = $this->db->query($sql, $binds);
		return $query;
	}
	// get payslip history > company
	public function get_company_payslip_history_month($company_id,$salary_month) {
		
		$sql = 'SELECT * FROM xin_salary_payslips WHERE company_id = ? and salary_month = ?';
		$binds = array($company_id,$salary_month);
		$query = $this->db->query($sql, $binds);
		return $query;
	}
	// get company/location payslips
	public function get_company_location_payslips($company_id,$location_id) {
		
		$sql = 'SELECT * FROM xin_salary_payslips WHERE company_id = ? and location_id = ?';
		$binds = array($company_id,$location_id,$salary_month);
		$query = $this->db->query($sql, $binds);
		return $query;
	}
	// get company/location payslips
	public function get_company_location_payslips_month($company_id,$location_id,$salary_month) {
		
		$sql = 'SELECT * FROM xin_salary_payslips WHERE company_id = ? and location_id = ? and salary_month = ?';
		$binds = array($company_id,$location_id,$salary_month);
		$query = $this->db->query($sql, $binds);
		return $query;
	}
	// get company/location/departments payslips
	public function get_company_location_department_payslips($company_id,$location_id,$department_id) {
		
		$sql = 'SELECT * FROM xin_salary_payslips WHERE company_id = ? and location_id = ? and department_id = ?';
		$binds = array($company_id,$location_id,$department_id);
		$query = $this->db->query($sql, $binds);
		return $query;
	}
	// get company/location/departments payslips
	public function get_company_location_department_payslips_month($company_id,$location_id,$department_id,$salary_month) {
		
		$sql = 'SELECT * FROM xin_salary_payslips WHERE company_id = ? and location_id = ? and department_id = ? and salary_month = ?';
		$binds = array($company_id,$location_id,$department_id,$salary_month);
		$query = $this->db->query($sql, $binds);
		return $query;
	}
	// get company/location/departments payslips
	public function get_company_location_department_designation_payslips($company_id,$location_id,$department_id,$designation_id) {
		
		$sql = 'SELECT * FROM xin_salary_payslips WHERE company_id = ? and location_id = ? and department_id = ? and designation_id = ?';
		$binds = array($company_id,$location_id,$department_id,$designation_id);
		$query = $this->db->query($sql, $binds);
		return $query;
	}
	
	/// pay to all
	// get all employees
	public function get_all_employees() {
		$sql = 'SELECT * FROM xin_employees WHERE user_role_id!=?';
		$binds = array(1);
		$query = $this->db->query($sql, $binds);
		return $query;
	}
	// get payslip bulk > company
	public function get_company_payroll_employees($company_id) {
		
		$sql = 'SELECT * FROM xin_employees WHERE user_role_id!=1 and company_id = ?';
		$binds = array($company_id);
		$query = $this->db->query($sql, $binds);
		return $query;
	}
	// get payslip bulk > company|location
	public function get_company_location_payroll_employees($company_id,$location_id) {
		
		$sql = 'SELECT * FROM xin_employees WHERE user_role_id!=1 and company_id = ? and location_id = ?';
		$binds = array($company_id,$location_id);
		$query = $this->db->query($sql, $binds);
		return $query;
	}
	// get payslip bulk > company|location|department
	public function get_company_location_dep_payroll_employees($company_id,$location_id,$department_id) {
		
		$sql = 'SELECT * FROM xin_employees WHERE user_role_id!=1 and company_id = ? and location_id = ? and department_id = ?';
		$binds = array($company_id,$location_id,$department_id);
		$query = $this->db->query($sql, $binds);
		return $query;
	}
	// get hourly wages
	public function get_hourly_wages()
	{
	  return $this->db->get("xin_hourly_templates");
	}
	 
	 public function read_template_information($id) {
	
		$sql = 'SELECT * FROM xin_salary_templates WHERE salary_template_id = ?';
		$binds = array($id);
		$query = $this->db->query($sql, $binds);
		
		if ($query->num_rows() > 0) {
			return $query->result();
		} else {
			return null;
		}
	}
	
	// get request date details > advance salary
	public function requested_date_details($id) {
		
		$sql = 'SELECT * FROM `xin_advance_salaries` WHERE employee_id = ? and status = ?';
		$binds = array($id,1);
		$query = $this->db->query($sql, $binds);
		
		return $query;
	}
	
	public function read_hourly_wage_information($id) {
	
		$sql = 'SELECT * FROM xin_hourly_templates WHERE hourly_rate_id = ?';
		$binds = array($id);
		$query = $this->db->query($sql, $binds);
		
		if ($query->num_rows() > 0) {
			return $query->result();
		} else {
			return null;
		}
	}
	
	public function read_currency_converter_information($id) {
	
		$sql = 'SELECT * FROM xin_currency_converter WHERE currency_converter_id = ?';
		$binds = array($id);
		$query = $this->db->query($sql, $binds);
		
		if ($query->num_rows() > 0) {
			return $query->result();
		} else {
			return null;
		}
	}
	
	// get advance salaries report > view all
	public function advance_salaries_report_view($id) {
	  	
		$this->db->query("SET SESSION sql_mode = ''");
		$sql = 'SELECT advance_salary_id,company_id,employee_id,month_year,one_time_deduct,monthly_installment,reason,status,total_paid,is_deducted_from_salary,created_at,SUM(`xin_advance_salaries`.advance_amount) AS advance_amount FROM `xin_advance_salaries` where status=1 and employee_id= ? group by employee_id';
		$binds = array($id);
		$query = $this->db->query($sql, $binds);
	    return $query->result();
	}
	
	public function read_make_payment_information($id) {
	
		$sql = 'SELECT * FROM xin_make_payment WHERE make_payment_id = ?';
		$binds = array($id);
		$query = $this->db->query($sql, $binds);
		
		if ($query->num_rows() > 0) {
			return $query->result();
		} else {
			return null;
		}
	}
	
	public function read_payslip_information($id) {
	
		$sql = 'SELECT * FROM xin_salary_payslips WHERE payslip_id = ?';
		$binds = array($id);
		$query = $this->db->query($sql, $binds);
		
		if ($query->num_rows() > 0) {
			return $query->result();
		} else {
			return null;
		}
	}
	// Function to Delete selected record from table
	public function delete_record($id){
		$this->db->where('payslip_id', $id);
		$this->db->delete('xin_salary_payslips');
		
	}
	// Function to Delete selected record from table
	public function delete_payslip_allowances_items($id){
		$this->db->where('payslip_id', $id);
		$this->db->delete('xin_salary_payslip_allowances');
		
	}
	// Function to Delete selected record from table
	public function delete_payslip_commissions_items($id){
		$this->db->where('payslip_id', $id);
		$this->db->delete('xin_salary_payslip_commissions');
		
	}
	// Function to Delete selected record from table
	public function delete_payslip_loan_items($id){
		$this->db->where('payslip_id', $id);
		$this->db->delete('xin_salary_payslip_loan');
		
	}
	// Function to Delete selected record from table
	public function delete_payslip_other_payment_items($id){
		$this->db->where('payslip_id', $id);
		$this->db->delete('xin_salary_payslip_other_payments');
		
	}
	// Function to Delete selected record from table
	public function delete_payslip_overtime_items($id){
		$this->db->where('payslip_id', $id);
		$this->db->delete('xin_salary_payslip_overtime');
		
	}
	// Function to Delete selected record from table
	public function delete_payslip_statutory_deductions_items($id){
		$this->db->where('payslip_id', $id);
		$this->db->delete('xin_salary_payslip_statutory_deductions');
		
	}
	
	public function read_advance_salary_info($id) {
	
		$sql = 'SELECT * FROM xin_advance_salaries WHERE advance_salary_id = ?';
		$binds = array($id);
		$query = $this->db->query($sql, $binds);
		
		if ($query->num_rows() > 0) {
			return $query->result();
		} else {
			return null;
		}
	}
	
	// get advance salary by employee id >paid.total
	public function get_paid_salary_by_employee_id($id) {
	
		$this->db->query("SET SESSION sql_mode = ''");
		$sql = 'SELECT advance_salary_id,employee_id,month_year,one_time_deduct,monthly_installment,reason,status,total_paid,is_deducted_from_salary,created_at,SUM(`xin_advance_salaries`.advance_amount) AS advance_amount FROM `xin_advance_salaries` where status=1 and employee_id=? group by employee_id';
		$binds = array($id);
		$query = $this->db->query($sql, $binds);
		return $query->result();
	}
	
	// get advance salary by employee id
	public function advance_salary_by_employee_id($id) {
	
		$sql = 'SELECT * FROM xin_advance_salaries WHERE employee_id = ? and status = ? order by advance_salary_id desc';
		$binds = array($id,1);
		$query = $this->db->query($sql, $binds);
		
		if ($query->num_rows() > 0) {
			return $query->result();
		} else {
			return null;
		}
	}
	
	
	// Function to add record in table
	public function add_template($data){
		$this->db->insert('xin_salary_templates', $data);
		if ($this->db->affected_rows() > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	// Function to add record in table > advance salary
	public function add_advance_salary_payroll($data){
		$this->db->insert('xin_advance_salaries', $data);
		if ($this->db->affected_rows() > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	// Function to add record in table
	public function add_hourly_wages($data){
		$this->db->insert('xin_hourly_templates', $data);
		if ($this->db->affected_rows() > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	// Function to add record in table
	public function add_currency_converter($data){
		$this->db->insert('xin_currency_converter', $data);
		if ($this->db->affected_rows() > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	// Function to add record in table
	public function add_monthly_payment_payslip($data){
		$this->db->insert('xin_make_payment', $data);
		if ($this->db->affected_rows() > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	// Function to add record in table
	public function add_hourly_payment_payslip($data){
		$this->db->insert('xin_make_payment', $data);
		if ($this->db->affected_rows() > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	// Function to Delete selected record from table
	public function delete_template_record($id){
		$this->db->where('salary_template_id', $id);
		$this->db->delete('xin_salary_templates');
		
	}
	
	// Function to Delete selected record from table
	public function delete_hourly_wage_record($id){
		$this->db->where('hourly_rate_id', $id);
		$this->db->delete('xin_hourly_templates');
		
	}
	
	// Function to Delete selected record from table
	public function delete_currency_converter_record($id){
		$this->db->where('currency_converter_id', $id);
		$this->db->delete('xin_currency_converter');
		
	}
	
	// Function to Delete selected record from table
	public function delete_advance_salary_record($id){
		$this->db->where('advance_salary_id', $id);
		$this->db->delete('xin_advance_salaries');
		
	}
	
	// Function to update record in table
	public function update_template_record($data, $id){
		$this->db->where('salary_template_id', $id);
		if( $this->db->update('xin_salary_templates',$data)) {
			return true;
		} else {
			return false;
		}		
	}
	
	// get all hourly templates
	public function all_hourly_templates()
	{
	  $query = $this->db->query("SELECT * from xin_hourly_templates");
  	  return $query->result();
	}
	
	// get all salary tempaltes > payroll templates
	public function all_salary_templates()
	{
	  $query = $this->db->query("SELECT * from xin_salary_templates");
  	  return $query->result();
	}
	
	// Function to update record in table
	public function update_hourly_wages_record($data, $id){
		$this->db->where('hourly_rate_id', $id);
		if( $this->db->update('xin_hourly_templates',$data)) {
			return true;
		} else {
			return false;
		}		
	}	
	
	// Function to update record in table
	public function update_currency_converter_record($data, $id){
		$this->db->where('currency_converter_id', $id);
		if( $this->db->update('xin_currency_converter',$data)) {
			return true;
		} else {
			return false;
		}		
	}
	
	// Function to update record in table > manage salary
	public function update_salary_template($data, $id){
		$this->db->where('user_id', $id);
		if( $this->db->update('xin_employees',$data)) {
			return true;
		} else {
			return false;
		}		
	}
	
	// Function to update record in table > deduction of advance salary
	public function updated_advance_salary_paid_amount($data, $id){
		$this->db->where('employee_id', $id);
		if( $this->db->update('xin_advance_salaries',$data)) {
			return true;
		} else {
			return false;
		}		
	}
	
	// Function to update record in table > advance salary
	public function updated_advance_salary_payroll($data, $id){
		$this->db->where('advance_salary_id', $id);
		if( $this->db->update('xin_advance_salaries',$data)) {
			return true;
		} else {
			return false;
		}		
	}
	
	// Function to update record in table > empty grade status
	public function update_empty_salary_template($data, $id){
		$this->db->where('user_id', $id);
		if( $this->db->update('xin_employees',$data)) {
			return true;
		} else {
			return false;
		}		
	}
	
	// Function to update record in table > set hourly grade
	public function update_hourlygrade_salary_template($data, $id){
		$this->db->where('user_id', $id);
		if( $this->db->update('xin_employees',$data)) {
			return true;
		} else {
			return false;
		}		
	}
	
	// Function to update record in table > set monthly grade
	public function update_monthlygrade_salary_template($data, $id){
		$this->db->where('user_id', $id);
		if( $this->db->update('xin_employees',$data)) {
			return true;
		} else {
			return false;
		}		
	}
	
	// Function to update record in table > zero hourly grade
	public function update_hourlygrade_zero($data, $id){
		$this->db->where('user_id', $id);
		if( $this->db->update('xin_employees',$data)) {
			return true;
		} else {
			return false;
		}		
	}
	// Function to update record in table > zero monthly grade
	public function update_monthlygrade_zero($data, $id){
		$this->db->where('user_id', $id);
		if( $this->db->update('xin_employees',$data)) {
			return true;
		} else {
			return false;
		}		
	}
	
	public function read_make_payment_payslip_check($employee_id,$p_date) {
	
		$sql = 'SELECT * FROM xin_salary_payslips WHERE employee_id = ? and salary_month = ?';
		$binds = array($employee_id,$p_date);
		$query = $this->db->query($sql, $binds);
		return $query;
	}
	public function read_make_payment_payslip_half_month_check($employee_id,$p_date) {
	
		$sql = "SELECT * FROM xin_salary_payslips WHERE is_half_monthly_payroll = '1' and employee_id = ? and salary_month = ?";
		$binds = array($employee_id,$p_date);
		$query = $this->db->query($sql, $binds);
		return $query;
	}
	
	public function read_make_payment_payslip_half_month_check_last($employee_id,$p_date) {
	
		$sql = "SELECT * FROM xin_salary_payslips WHERE is_half_monthly_payroll = '1' and employee_id = ? and salary_month = ? order by payslip_id desc";
		$binds = array($employee_id,$p_date);
		$query = $this->db->query($sql, $binds);
		return $query->result();
	}
	public function read_make_payment_payslip_half_month_check_first($employee_id,$p_date) {
	
		$sql = "SELECT * FROM xin_salary_payslips WHERE is_half_monthly_payroll = '1' and employee_id = ? and salary_month = ? order by payslip_id asc";
		$binds = array($employee_id,$p_date);
		$query = $this->db->query($sql, $binds);
		return $query->result();
	}
	
	public function read_make_payment_payslip($employee_id,$p_date) {
	
		$sql = 'SELECT * FROM xin_salary_payslips WHERE employee_id = ? and salary_month = ?';
		$binds = array($employee_id,$p_date);
		$query = $this->db->query($sql, $binds);
		
		return $query->result();
	}
	public function read_count_make_payment_payslip($employee_id,$p_date) {
	
		$sql = 'SELECT * FROM xin_salary_payslips WHERE employee_id = ? and salary_month = ?';
		$binds = array($employee_id,$p_date);
		$query = $this->db->query($sql, $binds);
		
		return $query->num_rows();
	}
	// Function to add record in table> salary payslip record
	public function add_salary_payslip($data){
		$this->db->insert('xin_salary_payslips', $data);
		if ($this->db->affected_rows() > 0) {
			return $this->db->insert_id();
		} else {
			return false;
		}
	}
	// Function to add record in table> salary payslip record
	public function add_salary_payslip_allowances($data){
		$this->db->insert('xin_salary_payslip_allowances', $data);
		if ($this->db->affected_rows() > 0) {
			return true;
		} else {
			return false;
		}
	}
	// Function to add record in table>
	public function add_salary_payslip_commissions($data){
		$this->db->insert('xin_salary_payslip_commissions', $data);
		if ($this->db->affected_rows() > 0) {
			return true;
		} else {
			return false;
		}
	}
	// Function to add record in table>
	public function add_salary_payslip_other_payments($data){
		$this->db->insert('xin_salary_payslip_other_payments', $data);
		if ($this->db->affected_rows() > 0) {
			return true;
		} else {
			return false;
		}
	}
	// Function to add record in table>
	public function add_salary_payslip_statutory_deductions($data){
		$this->db->insert('xin_salary_payslip_statutory_deductions', $data);
		if ($this->db->affected_rows() > 0) {
			return true;
		} else {
			return false;
		}
	}
	// Function to add record in table> salary payslip record
	public function add_salary_payslip_loan($data){
		$this->db->insert('xin_salary_payslip_loan', $data);
		if ($this->db->affected_rows() > 0) {
			return true;
		} else {
			return false;
		}
	}
	// Function to add record in table> salary payslip record
	public function add_salary_payslip_overtime($data){
		$this->db->insert('xin_salary_payslip_overtime', $data);
		if ($this->db->affected_rows() > 0) {
			return true;
		} else {
			return false;
		}
	}
	public function read_salary_payslip_info($id) {
	
		$sql = 'SELECT * FROM xin_salary_payslips WHERE payslip_id = ?';
		$binds = array($id);
		$query = $this->db->query($sql, $binds);
		
		if ($query->num_rows() > 0) {
			return $query->result();
		} else {
			return null;
		}
	}
	public function getEOBIamount()
	{
		$this->db->select('eobi_amount,eobi_employer_amount');
		$this->db->where('company_id', 1);
		$eobi = $this->db->get('xin_eobi_amount')->result_array();
		return $eobi;
	}
	public function set_employee_statutory_deductions($id, $salary, $net_salary, $absents) {

		$deduction = 0;
		$this->db->select('eobi_amount');
		$this->db->where('company_id', 1);
		$eobi = $this->db->get('xin_eobi_amount')->result_array();
		$eobi = $eobi[0]['eobi_amount'];
		//pfa
		$this->db->select('provident_fund, basic_salary');
		$this->db->where('company_id', 1);
		$salary_template = $this->db->get('xin_salary_templates')->result_array();
		$pfa = $salary_template[0]['provident_fund'];
		$basic = $salary_template[0]['basic_salary'];
		$basic = ($basic*$salary)/100;
		$pfa = ceil(($pfa*$basic)/100);
		$tax = $this->getTaxAmount($id, $net_salary);
				//days
				$month = (date('m'))-1;
				if($month == 0)
				{
					$month = 12;
				}
				// total days in month
				$daysInMonth = date('t', $month);
				$per_day = $basic/$daysInMonth;
				$per_day_salary = $absents*$per_day;
				$net_salary = $net_salary-$basic+$per_day_salary;
		$deduction = $net_salary-($eobi+$pfa+$tax);
		return ceil($deduction);
	}

	public function getTaxAmount($id, $total_salary)
	{
		$year_final = date('Y');
		$month_tax = '06-30';
		$this->db->select('date_of_joining');
		$months = 0;
		$this->db->where('user_id', $id);
		$date = $this->db->get('xin_employees');
		$date = $date->result_array();
		$date1 = strtotime($date[0]['date_of_joining']);
		$date = $date[0]['date_of_joining'];
		$year = date('Y', strtotime($date));
		$month = date('m', strtotime($date));
		if($year == date('Y'))
		{
			if($month > 6)
			{
				$year_final = $year_final+1;
				$tax_month = $year_final.'-'.$month_tax;
				$date2 = strtotime($tax_month);
			}
			else
			{
				$tax_month = $year_final.'-'.$month_tax;
				$date2 = strtotime($tax_month);
			}
			$months  = floor(($date2-$date1)/(60*60*24*30)); 
			//tax calculation of current year employees...

			$tax_amount = $total_salary*$months;
			$tax_amount = $this->MonthlyTax($tax_amount);
			return $tax_amount;
		}
		else
		{
			$tax_amount = $total_salary*12;
			$tax_amount = $this->MonthlyTax($tax_amount);
			return $tax_amount;
		}
	}
	public function MonthlyTax($tax_amount)
	{
		if($tax_amount<=600000)
		{
		return 0;
		}
		else if($tax_amount > 600000 && $tax_amount <= 1200000)
		{
			$tax_per_year = $tax_amount-600000;
			$tax_per_year = 5*($tax_per_year)/100;
			$tax_per_month = floor($tax_per_year/12);
			return $tax_per_month;
		}
		else if($tax_amount > 1200001 && $tax_amount <= 1800000)
		{
			$tax_per_year = $tax_amount-1200001;
			$tax_per_year = 10*($tax_per_year)/100;
			$tax_per_month = floor($tax_per_year/12);
			return $tax_per_month;
		}
		else if($tax_amount > 1800001 && $tax_amount <= 2500000)
		{
			$tax_per_year = $tax_amount-1800001;
			$tax_per_year = 15*($tax_per_year)/100;
			$tax_per_month = floor($tax_per_year/12);
			return $tax_per_month;
		}
		else if($tax_amount > 2500001 && $tax_amount <= 3500000)
		{
			$tax_per_year = $tax_amount-2500001;
			$tax_per_year = 17.5*($tax_per_year)/100;
			$tax_per_month = floor($tax_per_year/12);
			return $tax_per_month;
		}
		else if($tax_amount > 3500001 && $tax_amount <= 5000000)
		{
			$tax_per_year = $tax_amount-3500001;
			$tax_per_year = 20*($tax_per_year)/100;
			$tax_per_month = floor($tax_per_year/12);
			return $tax_per_month;
		}
		else if($tax_amount > 5000001 && $tax_amount <= 8000000)
		{
			$tax_per_year = $tax_amount-5000001;
			$tax_per_year = 22.5*($tax_per_year)/100;
			$tax_per_month = floor($tax_per_year/12);
			return $tax_per_month;
		}
		else if($tax_amount > 8000001 && $tax_amount <= 12000000)
		{
			$tax_per_year = $tax_amount-80000001;
			$tax_per_year = 25*($tax_per_year)/100;
			$tax_per_month = floor($tax_per_year/12);
			return $tax_per_month;
		}
		else if($tax_amount > 12000001 && $tax_amount <= 30000000)
		{
			$tax_per_year = $tax_amount-120000001;
			$tax_per_year = 27.5*($tax_per_year)/100;
			$tax_per_month = floor($tax_per_year/12);
			return $tax_per_month;
		}
		else if($tax_amount > 30000001 && $tax_amount <= 50000000)
		{
			$tax_per_year = $tax_amount-30000001;
			$tax_per_year = 30*($tax_per_year)/100;
			$tax_per_month = floor($tax_per_year/12);
			return $tax_per_month;
		}
		else if($tax_amount > 50000001 && $tax_amount <= 75000000)
		{
			$tax_per_year = $tax_amount-50000001;
			$tax_per_year = 32.5*($tax_per_year)/100;
			$tax_per_month = floor($tax_per_year/12);
			return $tax_per_month;
		}
		else if($tax_amount > 75000001)
		{
			$tax_per_year = $tax_amount-75000001;
			$tax_per_year = 35*($tax_per_year)/100;
			$tax_per_month = floor($tax_per_year/12);
			return $tax_per_month;
		}

	}
	public function get_leaves_count($id, $month)
	{
		$count = 0;
		$this->db->select('from_date, to_date');
		$this->db->where('employee_id', $id);
		$this->db->where('status',2);
		$total_leaves = $this->db->get('xin_leave_applications')->result_array();
		foreach($total_leaves as $t)
		{
			if(date('m', strtotime($t['from_date']))==$month)
			{
				$from_date = new DateTime($t['from_date']);
				if(date('m', strtotime($t['to_date'])) == $month)
				{
					$to_date = new DateTime($t['to_date']);
				}
				else{
					$year = date('Y');
					$month = str_pad($month, 2, 0, STR_PAD_LEFT);
					if($month == '01')
					$year = 12;
					$d=cal_days_in_month(CAL_GREGORIAN,$month, $year);
					$attendance_date = $year.'-'.$month.'-'.$d;
					$to_date = new DateTime($attendance_date);
				}
				$total_days = $to_date->diff($from_date);
				$count += $total_days->d;
				$count += 1;
			}
		}
		return $count;
	}
	public function savePFA($data)
	{
		$this->db->select('employee_id');
		$this->db->where('month_year', $data['month_year']);
		$this->db->where('employee_id', $data['employee_id']);
		$pfa = $this->db->get('xin_employee_provident_fund');
		if($pfa->num_rows()>0)
		{
			$this->db->where('employee_id', $data['employee_id']);
			$this->db->where('month_year',$data['month_year']);
			$this->db->update('xin_employee_provident_fund', $data);
			if($this->db->insert_id()>0)
			return true;
		}
		else
		{
			$this->db->insert('xin_employee_provident_fund',$data);
			if($this->db->insert_id()>0)
			return true;			
		}
		return false;
	}
	public function getCommission($id){
		$this->db->select('commission_amount');
		$this->db->where('employee_id', $id);
		$commission = $this->db->get('xin_salary_commissions');
		return $commission;
	}
	public function saveEOBI($data)
	{
		$this->db->select('employee_id');
		$this->db->where('month_year', $data['month_year']);
		$this->db->where('employee_id', $data['employee_id']);
		$pfa = $this->db->get('xin_employee_eobi_amount');
		if($pfa->num_rows()>0)
		{
			$this->db->where('employee_id', $data['employee_id']);
			$this->db->where('month_year',$data['month_year']);
			$this->db->update('xin_employee_eobi_amount', $data);
			if($this->db->insert_id()>0)
			return true;
		}
		else
		{
			$this->db->insert('xin_employee_eobi_amount',$data);
			if($this->db->insert_id()>0)
			return true;			
		}
		return false;
	}
	public function getAllowances($id)
	{
		$this->db->select('*');
		$this->db->where('employee_id', $id);
		$allowances = $this->db->get('xin_salary_allowances');
		if($allowances->num_rows()==0)
		{
			return 0;
		}
		else{
			return $allowances->result_array();
		}
	}
	public function read_salary_payslip_info_key($id) {
	
		$sql = 'SELECT * FROM xin_salary_payslips WHERE payslip_key = ?';
		$binds = array($id);
		$query = $this->db->query($sql, $binds);
		
		if ($query->num_rows() > 0) {
			return $query->result();
		} else {
			return null;
		}
	}
	
	// Function to update record in table > set hourly grade
	public function update_payroll_status($data, $id){
		$this->db->where('payslip_key', $id);
		if( $this->db->update('xin_salary_payslips',$data)) {
			return true;
		} else {
			return false;
		}		
	}
}
?>