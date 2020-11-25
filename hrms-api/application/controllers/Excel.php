<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Excel extends CI_Controller {
public function __construct()
{
    parent::__construct();
    $this->load->model('Employee_data');
    $this->load->library('Excel_lib');

}
public function index()
{
    $excelreader = new PHPExcel_Reader_Excel5();
    $loadexcel = $excelreader->load('public/employee.xls');
    $sheet = $loadexcel->getActiveSheet()->toArray(null,true,true,true);
    foreach($sheet as $row)
    {
        echo "<pre>";
        $success = $this->Employee_data->add($row);
        print_r($success);
    }
}
public function writing_excel()
{
    $data = $this->Employee_data->getData();
    $object = new PHPExcel();
    $object->setActiveSheetIndex(0);
    $column_name = array(
		'employee_id',
		'office_shift_id',
		'reports_to',
		'first_name',
		'last_name' ,
		'username',
		'company_id',
		'location_id',
		'email',
		'password',
		'pincode',
		'date_of_birth',
		'gender',
		'user_role_id',
		'department_id',
		'sub_department_id',
		'designation_id',
		'date_of_joining',
		'contact_no',
		'address',
		'is_active',
		'leave_categories',
		'created_at'
        );
        $column=0;
        foreach($column_name as $name)
        {
            $object->getActiveSheet()->setCellValueByColumnAndRow($column,0,$name);
            $column++;
        }
        $row_num = 2;
        foreach($data as $row){
        $object->getActiveSheet()->setCellValueByColumnAndRow(0,$row_num,$row->user_id);
        $object->getActiveSheet()->setCellValueByColumnAndRow(1,$row_num,$row->employee_id);
        $row_num++;
        }

        $object_writer = PHPExcel_IOFactory::createWriter($object, 'Excel5');
        header('Content-Type: application/vnd.ms-excel');
        header('Content-Disposition: attachment; filename="employeeData.xls"');
        $object_writer->save('php://output');

    }
}
    ?>