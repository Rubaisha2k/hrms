<?php
 
if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

class Studentfee extends Admin_Controller
{

    public function __construct()
    {
        parent::__construct();
        $this->load->library('smsgateway');
        $this->load->library('mailsmsconf');
        $this->search_type = $this->config->item('search_type');
		$this->sch_setting_detail = $this->setting_model->getSetting();
        // $this->load->model('excel_import_model');
        // $this->load->library('excel');
       
    }

    public function index()
    {
        if (!$this->rbac->hasPrivilege('collect_fees', 'can_view')){
            access_denied();
        }

        $this->session->set_userdata('top_menu', $this->lang->line('fees_collection'));
        $this->session->set_userdata('sub_menu', 'studentfee/index');
        $data['title']     = 'student fees';
        $class             = $this->class_model->get();
        $data['classlist'] = $class;
        $this->load->view('layout/header', $data);
        $this->load->view('studentfee/studentfeeSearch', $data);
        $this->load->view('layout/footer', $data);

    }

    public function bulkfeesupload(){
        if (!$this->rbac->hasPrivilege('collect_fees', 'can_view')){
            access_denied();
        }
        $data['title']     = 'student bulk upload fees';
        $class             = $this->class_model->get();
        $data['classlist'] = $class;
        $this->load->view('layout/header');
        $this->load->view('studentfee/bulkfeesupload');
        $this->load->view('layout/footer');
    }


    public function importbulkfees(){
        if (!$this->rbac->hasPrivilege('collect_fees', 'can_view')) {
            access_denied();
        }
        if(isset($_FILES["file"]["name"]))
        {

            $ObjData = null;
            $path = $_FILES["file"]["tmp_name"];
            $object = PHPExcel_IOFactory::load($path);
            foreach($object->getWorksheetIterator() as $worksheet)
            {

                $highestRow = $worksheet->getHighestRow();
                $highestColumn = $worksheet->getHighestColumn();
                for($row=1; $row<=$highestRow; $row++)
                {
       

                    $student_fees_master_id = $worksheet->getCellByColumnAndRow(0, $row)->getValue();
                    $fee_groups_feetype_id = $worksheet->getCellByColumnAndRow(1, $row)->getValue();
                    $amount = $worksheet->getCellByColumnAndRow(2, $row)->getValue();
                    $date = $worksheet->getCellByColumnAndRow(3, $row)->getValue();
                    $amount_discount = $worksheet->getCellByColumnAndRow(4, $row)->getValue();
                    $amount_fine = $worksheet->getCellByColumnAndRow(5, $row)->getValue();
                    $description = $worksheet->getCellByColumnAndRow(6, $row)->getValue();
                    $collected_by = $worksheet->getCellByColumnAndRow(7, $row)->getValue();
                    $payment_mode = $worksheet->getCellByColumnAndRow(8, $row)->getValue();
                    $received_by = $worksheet->getCellByColumnAndRow(9, $row)->getValue();
                    $inv_no = $worksheet->getCellByColumnAndRow(10, $row)->getValue();
                    $ArrayData = array(
                                        '1' => array(
                                                'amount' => $amount,
                                                'date' => $date,
                                                'amount_discount' => $amount_discount,
                                                'amount_fine' => $amount_fine,
                                                'description' => $description,
                                                'collected_by' => $collected_by,
                                                'payment_mode' => $payment_mode,
                                                'received_by' => $received_by,
                                                'inv_no' => $inv_no,
                                            )
                                      ); 
                    echo json_encode($ArrayData);
                    // $data[] = array(
                    //  'CustomerName'      =>  $customer_name,
                    //  'Address'           =>  $address,
                    //  'City'              =>  $city,
                    // );

                }
            }

            // var a = select id from students where admission_number = 1920;
            // var b = select session_id from student_session where student_id = a;
            // var c = select id from student_fees_master where student_session_id = b;


            // var a = SELECT id FROM `fee_groups` where name = 'Previous Session Balance';
            // var b = SELECT id FROM `fee_session_groups` where fee_groups_id = a;
            // var c = SELECT * FROM `fee_groups_feetype` where fee_session_group_id = b;

            // $this->excel_import_model->insert($data);
            // echo 'Data Imported successfully';
        }
    }

     public function collection_report()
    {

        
     if (!$this->rbac->hasPrivilege('collect_fees', 'can_view')) {
            access_denied();
        }

        $data['collect_by']=$this->studentfeemaster_model->get_feesreceived_by();

        $data['searchlist'] = $this->customlib->get_searchtype();
        $data['group_by'] = $this->customlib->get_groupby();
       
        $this->session->set_userdata('top_menu', 'Reports');
        $this->session->set_userdata('sub_menu', 'Reports/finance');
        $this->session->set_userdata('subsub_menu', 'Reports/finance/collection_report');
       
        if(isset($_POST['search_type']) && $_POST['search_type']!=''){

          $dates=$this->customlib->get_betweendate($_POST['search_type']);
          $data['search_type']=$_POST['search_type'];

        }else{

          $dates=$this->customlib->get_betweendate('this_year');
          $data['search_type']=''; 
           
        }

        if(isset($_POST['collect_by']) && $_POST['collect_by']!=''){

            $data['received_by']=$received_by=$_POST['collect_by'];

        }else{

            $data['received_by']=$received_by='';

        }

        if(isset($_POST['group']) && $_POST['group']!=''){

            $data['group_byid']=$group=$_POST['group'];

        }else{

            $data['group_byid']=$group='';
        }
        
        $collect_by=array();
        $collection=array();
        $start_date=date('Y-m-d',strtotime($dates['from_date']));
        $end_date=date('Y-m-d',strtotime($dates['to_date']));
         $data['collectlist']=$this->studentfeemaster_model->getFeeCollectionReport($start_date,$end_date);
        
        

        $this->form_validation->set_rules('search_type', $this->lang->line('search')." ".$this->lang->line('type'), 'trim|required|xss_clean');
        $this->form_validation->set_rules('collect_by', $this->lang->line('collect')." ".$this->lang->line('by'), 'trim|required|xss_clean');
        $this->form_validation->set_rules('group', $this->lang->line('group')." ".$this->lang->line('by'), 'trim|required|xss_clean');
  
       
        if ($this->form_validation->run() == false) {

        $data['results']=array();
       

        }else{

       $data['results']=$this->studentfeemaster_model->getFeeCollectionReport($start_date,$end_date,$received_by,$group);  

        if($group!=''){

         if($group=='class'){

            $group_by='class_id';

         }elseif($group=='collection'){

            $group_by='received_by';

         }elseif($group=='mode'){

            $group_by='payment_mode';

         }

        foreach($data['results'] as $key => $value) {


            $collection[$value[$group_by]][]=$value;
            

        } 
 
        }else{

          $s=0;
          foreach($data['results'] as $key => $value) {

            $collection[$s++]=array($value);
            

        }  

        }

        $data['results']=$collection;
       

        }
        
     
        $this->load->view('layout/header', $data);
        $this->load->view('studentfee/collection_report', $data);
        $this->load->view('layout/footer', $data);
    }

    public function pdf()
    {
        $this->load->helper('pdf_helper');
    }

  public function feevoucher(){
        if (!$this->rbac->hasPrivilege('search_due_fees', 'can_view')) {
            access_denied();
        }
        // echo "<pre>";
        // print_r($this->input->post()); 
        // exit();
        $this->session->set_userdata('top_menu', 'Fees Collection');
        $this->session->set_userdata('sub_menu', 'studentfee/feevoucher');
        $data['title']     = 'fees voucher';
        $class             = $this->class_model->get();
        $data['classlist'] = $class;
        //print_r($data['classlist']);
        $feesessiongroup   = $this->feesessiongroup_model->getFeesByGroup();
        //print_r($feesessiongroup);
        $data['feesessiongrouplist'] = $feesessiongroup;
        //print_r($data['feesessiongrouplist']);
        $data['fees_group']="";
        if(isset($_POST['feegroup_id']) && $_POST['feegroup_id']!=''){
            $data['fees_group']=$_POST['feegroup_id'];
        }
       
        $this->form_validation->set_rules('feegroup_id', $this->lang->line('fee_group'), 'trim|required|xss_clean');

        $this->form_validation->set_rules('class_id', $this->lang->line('class'), 'trim|required|xss_clean');
        $this->form_validation->set_rules('section_id', $this->lang->line('section'), 'trim|required|xss_clean');
        if ($this->form_validation->run() == false) {
            $this->load->view('layout/header', $data);
            $this->load->view('studentfee/feevoucher', $data);
            $this->load->view('layout/footer', $data);
        } else {
            $class_id                = $this->input->post('class_id');
            $section_id              = $this->input->post('section_id');
            $month= date('n');
            //$month_year= ($month-1)."-20";
            $data['previousBalance'] = $this->studentfeemaster_model->getPreviousBalance($class_id, $section_id);
            $data['student_due_fee'] = array();
            $feegroup_id             = $this->input->post('feegroup_id');
            $feegroup                = explode("-", $feegroup_id);
            //print_r($feegroup);
            $feegroup_id             = $feegroup[0];
            $fee_groups_feetype_id   = $feegroup[1];
            $student_due_fee         = $this->studentfee_model->getDueStudentFees($feegroup_id, $fee_groups_feetype_id, $class_id, $section_id);
            // echo "<pre>";
            // print_r($fee_groups_feetype_id);
            // exit();
            if (!empty($student_due_fee)) {
                foreach ($student_due_fee as $student_due_fee_key => $student_due_fee_value) {
                    $amt_due                                                  = $student_due_fee_value['amount'];
                    $student_due_fee[$student_due_fee_key]['amount_discount'] = 0;
                    $student_due_fee[$student_due_fee_key]['amount_fine']     = 0;
                    $a = json_decode($student_due_fee_value['amount_detail']);
                    
                    //print_r($a);
                    if (!empty($a)) {
                        $amount          = 0;
                        $amount_discount = 0;
                        $amount_fine     = 0;

                        foreach ($a as $a_key => $a_value) {
                            $amount          = $amount + $a_value->amount;
                            $amount_discount = $amount_discount + $a_value->amount_discount;
                            $amount_fine     = $amount_fine + $a_value->amount_fine;
                        }
                        if ($amt_due <= $amount) {
                            unset($student_due_fee[$student_due_fee_key]);
                        } else {

                            $student_due_fee[$student_due_fee_key]['amount_detail']   = $amount;
                            $student_due_fee[$student_due_fee_key]['amount_discount'] = $amount_discount;
                            $student_due_fee[$student_due_fee_key]['amount_fine']     = $amount_fine;
                            //$student_due_fee[$student_due_fee_key]['previousBalance']= $this->studentfeemaster_model->getPreviousBalance();
                        }
                    }
                }
            }
            
            $data['feegrouptypeid'] = $fee_groups_feetype_id;
            $data['student_due_fee'] = $student_due_fee;
            // foreach($data['feesessiongrouplist'] as $feesdiscount){
                
            //         echo '<pre>';
            //         print_r($feesdiscount);
            //         exit();
            // }
            // feeclasslabel
            // echo '<pre>';
            // exit();
            //print_r($student_due_fee);
            $this->load->view('layout/header', $data);
            $this->load->view('studentfee/feevoucher', $data);
            $this->load->view('layout/footer', $data);
        }
    
    
        // $this->session->set_userdata('top_menu', 'Fees Collection');
        // $this->session->set_userdata('sub_menu', 'studentfee/feevoucher');
        // $data['title']     = 'fees voucher';
        // $this->load->view('layout/header', $data);
        // $this->load->view('studentfee/feevoucher', $data);
        // $this->load->view('layout/footer', $data);
    }
    public function search()
    {
        if (!$this->rbac->hasPrivilege('collect_fees', 'can_view')) {
            access_denied();
        }
        $data['title']     = 'Student Search';
        $class             = $this->class_model->get();
        $data['classlist'] = $class;
        $button            = $this->input->post('search');
		$data['adm_auto_insert']    = $this->sch_setting_detail->adm_auto_insert;
		$data['sch_setting']        = $this->sch_setting_detail;
        if ($this->input->server('REQUEST_METHOD') == "GET") {
            $this->load->view('layout/header', $data);
            $this->load->view('studentfee/studentfeeSearch', $data);
            $this->load->view('layout/footer', $data);
        } else {
            $class       = $this->input->post('class_id');
            $section     = $this->input->post('section_id');
            $search      = $this->input->post('search');
            $search_text = $this->input->post('search_text');
            if (isset($search)) {
                if ($search == 'search_filter') {
                    $this->form_validation->set_rules('class_id', $this->lang->line('class'), 'trim|required|xss_clean');
                    if ($this->form_validation->run() == false) {

                    } else {
                        $resultlist         = $this->student_model->searchByClassSection($class, $section);
                        $data['resultlist'] = $resultlist;
                    }
                } else if ($search == 'search_full') {
                    $resultlist         = $this->student_model->searchFullText($search_text);
                    $data['resultlist'] = $resultlist;
                }
                $this->load->view('layout/header', $data);
                $this->load->view('studentfee/studentfeeSearch', $data);
                $this->load->view('layout/footer', $data);
            }
        }
    }

    public function feesearch()
    {
        if (!$this->rbac->hasPrivilege('search_due_fees', 'can_view')) {
            access_denied();
        }

        $this->session->set_userdata('top_menu', 'Fees Collection');
        $this->session->set_userdata('sub_menu', 'studentfee/feesearch');
        $data['title']     = 'student fees';
        $class             = $this->class_model->get();
        $data['classlist'] = $class;
        $feesessiongroup   = $this->feesessiongroup_model->getFeesByGroup();

        $data['feesessiongrouplist'] = $feesessiongroup;
        $data['fees_group']="";
        if(isset($_POST['feegroup_id']) && $_POST['feegroup_id']!=''){
            $data['fees_group']=$_POST['feegroup_id'];
        }

        $this->form_validation->set_rules('feegroup_id', $this->lang->line('fee_group'), 'trim|required|xss_clean');

        $this->form_validation->set_rules('class_id', $this->lang->line('class'), 'trim|required|xss_clean');
        $this->form_validation->set_rules('section_id', $this->lang->line('section'), 'trim|required|xss_clean');
        if ($this->form_validation->run() == false) {
            $this->load->view('layout/header', $data);
            $this->load->view('studentfee/studentSearchFee', $data);
            $this->load->view('layout/footer', $data);
        } else {
            $data['student_due_fee'] = array();
            $feegroup_id             = $this->input->post('feegroup_id');
            $feegroup                = explode("-", $feegroup_id);
            $feegroup_id             = $feegroup[0];
            $fee_groups_feetype_id   = $feegroup[1];
            $class_id                = $this->input->post('class_id');
            $section_id              = $this->input->post('section_id');
            $student_due_fee         = $this->studentfee_model->getDueStudentFees($feegroup_id, $fee_groups_feetype_id, $class_id, $section_id);
            print_r($student_due_fee);
            // echo "<pre>";
            // print_r($fee_groups_feetype_id);
            // exit();
            if (!empty($student_due_fee)) {
                foreach ($student_due_fee as $student_due_fee_key => $student_due_fee_value) {
                    $amt_due                                                  = $student_due_fee_value['amount'];
                    $student_due_fee[$student_due_fee_key]['amount_discount'] = 0;
                    $student_due_fee[$student_due_fee_key]['amount_fine']     = 0;
                    $a                                                        = json_decode($student_due_fee_value['amount_detail']);
                    if (!empty($a)) {
                        $amount          = 0;
                        $amount_discount = 0;
                        $amount_fine     = 0;

                        foreach ($a as $a_key => $a_value) {
                            $amount          = $amount + $a_value->amount;
                            $amount_discount = $amount_discount + $a_value->amount_discount;
                            $amount_fine     = $amount_fine + $a_value->amount_fine;
                        }
                        if ($amt_due <= $amount) {
                            unset($student_due_fee[$student_due_fee_key]);
                        } else {

                            $student_due_fee[$student_due_fee_key]['amount_detail']   = $amount;
                            $student_due_fee[$student_due_fee_key]['amount_discount'] = $amount_discount;
                            $student_due_fee[$student_due_fee_key]['amount_fine']     = $amount_fine;
                        }
                    }
                }
            }
 
            $data['student_due_fee'] = $student_due_fee;
            $this->load->view('layout/header', $data);
            $this->load->view('studentfee/studentSearchFee', $data);
            $this->load->view('layout/footer', $data);
        }
    }

    public function studentbulkfees(){

        if (!$this->rbac->hasPrivilege('search_due_fees', 'can_view')) {
            access_denied();
        }

        $this->session->set_userdata('top_menu', 'Fees Collection');
        $this->session->set_userdata('sub_menu', 'studentfee/studentbulkfees');
        $data['title']     = 'student bulk fees';
        $class             = $this->class_model->get();
        $data['classlist'] = $class;
        $feesessiongroup   = $this->feesessiongroup_model->getFeesByGroup();

        $data['feesessiongrouplist'] = $feesessiongroup;
        $data['fees_group']="";
        if(isset($_POST['feegroup_id']) && $_POST['feegroup_id']!=''){
            $data['fees_group']=$_POST['feegroup_id'];
        }
       
        $this->form_validation->set_rules('feegroup_id', $this->lang->line('fee_group'), 'trim|required|xss_clean');

        $this->form_validation->set_rules('class_id', $this->lang->line('class'), 'trim|required|xss_clean');
        $this->form_validation->set_rules('section_id', $this->lang->line('section'), 'trim|required|xss_clean');
        if ($this->form_validation->run() == false) {
            $this->load->view('layout/header', $data);
            $this->load->view('studentfee/studentSearchFeeBulk', $data);
            $this->load->view('layout/footer', $data);
        } else {
            $data['student_due_fee'] = array();
            $feegroup_id             = $this->input->post('feegroup_id');
            $feegroup                = explode("-", $feegroup_id);
            $feegroup_id             = $feegroup[0];
            $fee_groups_feetype_id   = $feegroup[1];
            $class_id                = $this->input->post('class_id');
            $section_id              = $this->input->post('section_id');
            $student_due_fee         = $this->studentfee_model->getDueStudentFees($feegroup_id, $fee_groups_feetype_id, $class_id, $section_id);
            // echo "<pre>";
            // print_r($student_due_fee);
            // exit();
            if (!empty($student_due_fee)) {
                foreach ($student_due_fee as $student_due_fee_key => $student_due_fee_value) {
                    $amt_due                                                  = $student_due_fee_value['amount'];
                    $student_due_fee[$student_due_fee_key]['amount_discount'] = 0;
                    $student_due_fee[$student_due_fee_key]['amount_fine']     = 0;
                    $a                                                        = json_decode($student_due_fee_value['amount_detail']);
                    if (!empty($a)) {
                        $amount          = 0;
                        $amount_discount = 0;
                        $amount_fine     = 0;

                        foreach ($a as $a_key => $a_value) {
                            $amount          = $amount + $a_value->amount;
                            $amount_discount = $amount_discount + $a_value->amount_discount;
                            $amount_fine     = $amount_fine + $a_value->amount_fine;
                        }
                        if ($amt_due <= $amount) {
                            unset($student_due_fee[$student_due_fee_key]);
                        } else {

                            $student_due_fee[$student_due_fee_key]['amount_detail']   = $amount;
                            $student_due_fee[$student_due_fee_key]['amount_discount'] = $amount_discount;
                            $student_due_fee[$student_due_fee_key]['amount_fine']     = $amount_fine;
                        }
                    }
                }
            }
            $data['feegrouptypeid'] = $fee_groups_feetype_id;
            $data['student_due_fee'] = $student_due_fee;
            $this->load->view('layout/header', $data);
            $this->load->view('studentfee/studentSearchFeeBulk', $data);
            $this->load->view('layout/footer', $data);
        }
    
    }

    public function generatebulkvoucher(){
        // echo "<pre>";
        // print_r($this->input->post());
        // exit();
        // FineType
        // FinePercentage
        // FineAmount
        $Exists = null;
        for ($i = 0; $i < count($this->input->post('StudentMasterID')) ; $i++) {
            $this->db->where('student_master_id', $this->input->post('StudentMasterID')[$i]);
            $this->db->where('student_session_id', $this->input->post('StudentSessionID')[$i]);
            $this->db->where('admission_no', $this->input->post('AdmissionNo')[$i]);
            $this->db->where('date', (new DateTime)->format('m-Y'));
            $this->db->from('generate_voucher');
            $countResult = $this->db->count_all_results(); // Produces an integer, like 17
            // print_r($this->db->last_query());    

            $Amount = $this->input->post('Amount')[$i];
            //print_r($Amount);
            $PercentAmount = $this->input->post('FinePercentage')[$i];
            $FixedAmount = $this->input->post('FineAmount')[$i];
            $Discount= $this->input->post('Discount')[$i];
            $prebal= $this->input->post('previousbalance')[$i];
            $finalAmount= (($Amount - $Discount) + $prebal);
            if($this->input->post('FineType')[$i] == 'percentage'){
                $AfterAmount = ($finalAmount + ($Amount * $PercentAmount) / 100);
            }elseif($this->input->post('FineType')[$i] == 'fix'){
                $AfterAmount = ($finalAmount + $FixedAmount);
            }elseif($this->input->post('FineType')[$i] == 'none' || $this->input->post('FineType')[$i] == '' || $this->input->post('FineType')[$i] == null ){
                $AfterAmount = $finalAmount;
            }
           
            if(!$countResult){
                 $data = array(
                        'student_master_id' => $this->input->post('StudentMasterID')[$i],
                        'student_session_id' => $this->input->post('StudentSessionID')[$i],
                        'fees_amount' =>  $this->input->post('Amount')[$i],
                        'fees_discount' => $this->input->post('Discount')[$i],
                        'fees_fine' => $this->input->post('Fine')[$i],
                        'admission_no' => $this->input->post('AdmissionNo')[$i],
                        'voucher_no' => bin2hex(random_int(999, 1044)) . $this->input->post('StudentMasterID')[$i],
                        'fees_group_id' => $this->input->post('FeeGroupTypeID')[$i],
                        'fees_type_id' => $this->input->post('FeeTypeID')[$i],
                        'date' => (new DateTime)->format('m-Y'),
                        'due_date' => $this->input->post('DueDate')[$i],
                        'fine_type' => $this->input->post('FineType')[$i],
                        'previousBalance'=>$this->input->post('previousbalance')[$i],
                        'fine_amount' => $AfterAmount,
                );
                $data = $this->security->xss_clean($data);
                $this->db->insert('generate_voucher', $data);
                
                $data2 = array(
                        'student_master_id' => $this->input->post('StudentMasterID')[$i],
                        'student_session_id' => $this->input->post('StudentSessionID')[$i],
                        'fees_amount' =>  $this->input->post('Amount')[$i],
                        'fees_discount' => $this->input->post('Discount')[$i],
                        'fees_fine' => $this->input->post('Fine')[$i],
                        'admission_no' => $this->input->post('AdmissionNo')[$i],
                     'voucher_no' => time() . $this->input->post('StudentMasterID')[$i] . (new DateTime)->format('dmy'),
                        'fees_group_id' => $this->input->post('FeeGroupTypeID')[$i],
                        'fees_type_id' => $this->input->post('FeeTypeID')[$i],
                        'StudentName' => $this->input->post('StudentName')[$i],
                        'MobileNo' => $this->input->post('MobileNo')[$i],
                        'CNIC' => $this->input->post('CNIC')[$i],
                        'FatherName' => $this->input->post('FatherName')[$i],
                        'date' => (new DateTime)->format('M - Y'),
                        'due_date1' => (new DateTime($this->input->post('DueDate')[$i]))->format('M d, Y'),
                        'due_date2' => (new DateTime($this->input->post('DueDate')[$i]))->format('d/m/Y'),
                        'previousBalance'=> $this->input->post('previousbalance')[$i],
                        'exists' => '',
                        'issuedate' => (new DateTime)->format('M d,  Y'),
                        'fine_amount' => $AfterAmount,
                );
                $DataArray [] = $data2;
            }else{
                $Exists = 'Exists';
            }
               
        }
        if($Exists == null){
            echo json_encode($DataArray);
        }else{
            echo json_encode(['exists' => 'exists']);
        }
        
        exit();
    }
    public function submitbulkfee(){
        $username = $this->session->userdata['admin']['username'];
        $userid = $this->session->userdata['admin']['id'];
     
        // echo '<pre>';
        // print_r($this->session->userdata['admin']);
        for ($i = 0; $i < count($this->input->post('StudentMasterID')) ; $i++) {
            $Calculation = (($this->input->post('Amount')[$i] + $this->input->post('Fine')[$i]) - $this->input->post('Discount')[$i]);
            // $JsonArray = [
            //         '1' => [
            //             'amount' => $this->input->post('Amount')[$i],
            //             'date' => (new DateTime)->format('Y-m-d'),
            //             'amount_discount' => $this->input->post('Discount')[$i],
            //             'amount_fine' => $this->input->post('Fine')[$i],
            //             //'description' => '',
            //             'Collected By' => $username . '('.$Calculation.')',
            //             'payment_mode' => 'Cash in Bank',
            //             'received_by' => $userid,
            //             'inv_no' => 1
            //         ]   
            //     ];
            $TotalAmount = $this->input->post('Amount')[$i] - $this->input->post('DiscountAmount')[$i];
                $json_array = array(
                    'amount' => $TotalAmount,
                    'date' => (new DateTime)->format('Y-m-d'),
                    'amount_discount' => $this->input->post('DiscountAmount')[$i],
                    'amount_fine' => $this->input->post('Fine')[$i],
                    'description' => '',
                    'Collected By' => $username . '('.$Calculation.')',
                    'payment_mode' => 'Cash in Bank',
                    'received_by' => $userid,
                    'inv_no' => 1
                );
        

                // echo json_encode($JsonArray);
                $data = array(
                        'student_fees_master_id' => $this->input->post('StudentMasterID')[$i],
                        'fee_groups_feetype_id' => $this->input->post('FeeTypeID')[$i],
                        'amount_detail' => $json_array
                );
                $DiscountID = $this->input->post('DiscountID')[$i];
                $inserID = $this->studentfeemaster_model->fee_deposit($data, null, $DiscountID);
                //print_r($inserID);
                // $this->db->insert('student_fees_deposite', $data);
        }
        exit();
    }

    
    public function reportbyname()
    {
        if (!$this->rbac->hasPrivilege('fees_statement', 'can_view')) {
            access_denied();
        }
        $this->session->set_userdata('top_menu', 'Reports');
        $this->session->set_userdata('sub_menu', 'Reports/finance');
        $this->session->set_userdata('subsub_menu', 'Reports/finance/reportbyname');
        $data['title']     = 'student fees';
        $data['title']     = 'student fees';
        $class             = $this->class_model->get();
        $data['classlist'] = $class;

        if ($this->input->server('REQUEST_METHOD') == "GET") {

            $this->load->view('layout/header', $data);
            $this->load->view('studentfee/reportByName', $data);
            $this->load->view('layout/footer', $data);

        } else {

            $this->form_validation->set_rules('section_id', $this->lang->line('section'), 'trim|required|xss_clean');
            $this->form_validation->set_rules('class_id', $this->lang->line('class'), 'trim|required|xss_clean');
            $this->form_validation->set_rules('student_id', $this->lang->line('student'), 'trim|required|xss_clean');

            if ($this->form_validation->run() == false) {

                $this->load->view('layout/header', $data);
                $this->load->view('studentfee/reportByName', $data);
                $this->load->view('layout/footer', $data);

            } else {

                $data['student_due_fee']      = array();
                $class_id                     = $this->input->post('class_id');
                $section_id                   = $this->input->post('section_id');
                $student_id                   = $this->input->post('student_id');
                $student                      = $this->student_model->get($student_id);
                $data['student']              = $student;
                $student_due_fee              = $this->studentfeemaster_model->getStudentFees($student['student_session_id']);
                $student_discount_fee         = $this->feediscount_model->getStudentFeesDiscount($student['student_session_id']);
                $data['student_discount_fee'] = $student_discount_fee;
                $data['student_due_fee']      = $student_due_fee;
                $data['class_id']             = $class_id;
                $data['section_id']           = $section_id;
                $data['student_id']           = $student_id;
                $category                     = $this->category_model->get();
                $data['categorylist']         = $category;
                $this->load->view('layout/header', $data);
                $this->load->view('studentfee/reportByName', $data);
                $this->load->view('layout/footer', $data);
            }
        }
    }

    public function reportbyclass()
    {
        $data['title']     = 'student fees';
        $data['title']     = 'student fees';
        $class             = $this->class_model->get();
        $data['classlist'] = $class;
        if ($this->input->server('REQUEST_METHOD') == "GET") {
            $this->load->view('layout/header', $data);
            $this->load->view('studentfee/reportByClass', $data);
            $this->load->view('layout/footer', $data);
        } else {
            $student_fees_array      = array();
            $class_id                = $this->input->post('class_id');
            $section_id              = $this->input->post('section_id');
            $student_result          = $this->student_model->searchByClassSection($class_id, $section_id);
            $data['student_due_fee'] = array();
            if (!empty($student_result)) {
                foreach ($student_result as $key => $student) {
                    $student_array                      = array();
                    $student_array['student_detail']    = $student;
                    $student_session_id                 = $student['student_session_id'];
                    $student_id                         = $student['id'];
                    $student_due_fee                    = $this->studentfee_model->getDueFeeBystudentSection($class_id, $section_id, $student_session_id);
                    $student_array['fee_detail']        = $student_due_fee;
                    $student_fees_array[$student['id']] = $student_array;
                }
            }
            $data['class_id']           = $class_id;
            $data['section_id']         = $section_id;
            $data['student_fees_array'] = $student_fees_array;
            $this->load->view('layout/header', $data);
            $this->load->view('studentfee/reportByClass', $data);
            $this->load->view('layout/footer', $data);
        }
    }

    public function view($id)
    {
        if (!$this->rbac->hasPrivilege('collect_fees', 'can_view')) {
            access_denied();
        }
        $data['title']      = 'studentfee List';
        $studentfee         = $this->studentfee_model->get($id);
        $data['studentfee'] = $studentfee;
        $this->load->view('layout/header', $data);
        $this->load->view('studentfee/studentfeeShow', $data);
        $this->load->view('layout/footer', $data);
    }

    public function deleteFee()
    {

        if (!$this->rbac->hasPrivilege('collect_fees', 'can_delete')) {
            access_denied();
        }
        $invoice_id  = $this->input->post('main_invoice');
        $sub_invoice = $this->input->post('sub_invoice');
        if (!empty($invoice_id)) {
            $this->studentfee_model->remove($invoice_id, $sub_invoice);
        }
        $array = array('status' => 'success', 'result' => 'success');
       echo json_encode($array);
    }

    public function deleteStudentDiscount()
    {

        $discount_id = $this->input->post('discount_id');
        if (!empty($discount_id)) {
            $data = array('id' => $discount_id, 'status' => 'assigned', 'payment_id' => "");
            $this->feediscount_model->updateStudentDiscount($data);
        }
        $array = array('status' => 'success', 'result' => 'success');
        echo json_encode($array);
    }

    public function getcollectfee()
    {
        $setting_result      = $this->setting_model->get();
        $data['settinglist'] = $setting_result;
        $record              = $this->input->post('data');
        $record_array        = json_decode($record);

        $fees_array = array();
        foreach ($record_array as $key => $value) {
            $fee_groups_feetype_id = $value->fee_groups_feetype_id;
            $fee_master_id         = $value->fee_master_id;
            $fee_session_group_id  = $value->fee_session_group_id;
            $feeList               = $this->studentfeemaster_model->getDueFeeByFeeSessionGroupFeetype($fee_session_group_id, $fee_master_id, $fee_groups_feetype_id);
            $fees_array[]          = $feeList;
        }
        $data['feearray'] = $fees_array;
        $result           = array(
            'view' => $this->load->view('studentfee/getcollectfee', $data, true),
        );

        $this->output->set_output(json_encode($result));

    }

    public function addfee($id)
    {
        if (!$this->rbac->hasPrivilege('collect_fees', 'can_add')) {
            access_denied();
        }
        $data['title']   = 'Student Detail';
        $student         = $this->student_model->getByStudentSession($id);
        $data['student'] = $student;
        $student_due_fee = $this->studentfeemaster_model->getStudentFees($id);
        $student_discount_fee = $this->feediscount_model->getStudentFeesDiscount($id);
        $data['student_discount_fee'] = $student_discount_fee;
        $data['student_due_fee']      = $student_due_fee;
        $category                     = $this->category_model->get();
        $data['categorylist']         = $category;
        $class_section                = $this->student_model->getClassSection($student["class_id"]);
        $data["class_section"]        = $class_section;
        $session                      = $this->setting_model->getCurrentSession();
        $studentlistbysection         = $this->student_model->getStudentClassSection($student["class_id"], $session);
        $data["studentlistbysection"] = $studentlistbysection;
  
        $this->load->view('layout/header', $data);
        $this->load->view('layout/header', $data);
        $this->load->view('studentfee/studentAddfee', $data);
        $this->load->view('layout/footer', $data);
    }

    public function deleteTransportFee()
    {
        $id = $this->input->post('feeid');
        $this->studenttransportfee_model->remove($id);
        $array = array('status' => 'success', 'result' => 'success');
        echo json_encode($array);
    }

    public function delete($id)
    {
        $data['title'] = 'studentfee List';
        $this->studentfee_model->remove($id);
        redirect('studentfee/index');
    }

    public function create()
    {
        if (!$this->rbac->hasPrivilege('collect_fees', 'can_view')) {
            access_denied();
        }
        $data['title'] = 'Add studentfee';
        $this->form_validation->set_rules('category', $this->lang->line('category'), 'trim|required|xss_clean');
        if ($this->form_validation->run() == false) {
            $this->load->view('layout/header', $data);
            $this->load->view('studentfee/studentfeeCreate', $data);
            $this->load->view('layout/footer', $data);
        } else {
            $data = array(
                'category' => $this->input->post('category'),
            );
            $this->studentfee_model->add($data);
            $this->session->set_flashdata('msg', '<div studentfee="alert alert-success text-center">'.$this->lang->line('success_message').'</div>');
            redirect('studentfee/index');
        }
    }

    public function edit($id)
    {
        if (!$this->rbac->hasPrivilege('collect_fees', 'can_edit')) {
            access_denied();
        }
        $data['title']      = 'Edit studentfees';
        $data['id']         = $id;
        $studentfee         = $this->studentfee_model->get($id);
        $data['studentfee'] = $studentfee;
        $this->form_validation->set_rules('category', $this->lang->line('category'), 'trim|required|xss_clean');
        if ($this->form_validation->run() == false) {
            $this->load->view('layout/header', $data);
            $this->load->view('studentfee/studentfeeEdit', $data);
            $this->load->view('layout/footer', $data);
        } else {
            $data = array(
                'id'       => $id,
                'category' => $this->input->post('category'),
            );
            $this->studentfee_model->add($data);
            $this->session->set_flashdata('msg', '<div studentfee="alert alert-success text-center">'.$this->lang->line('update_message').'</div>');
            redirect('studentfee/index');
        }
    }

    public function addstudentfee()
    {
        $this->form_validation->set_rules('student_fees_master_id', $this->lang->line('fee_master'), 'required|trim|xss_clean');
        $this->form_validation->set_rules('fee_groups_feetype_id', $this->lang->line('student'), 'required|trim|xss_clean');
        $this->form_validation->set_rules('amount', $this->lang->line('amount'), 'required|trim|xss_clean|callback_check_deposit');
        $this->form_validation->set_rules('amount_discount', $this->lang->line('discount'), 'required|trim|xss_clean');
        $this->form_validation->set_rules('amount_fine', $this->lang->line('fine'), 'required|trim|xss_clean');
        $this->form_validation->set_rules('payment_mode', $this->lang->line('payment_mode'), 'required|trim|xss_clean');
        if ($this->form_validation->run() == false) {
            $data = array(
                'amount'                 => form_error('amount'),
                'student_fees_master_id' => form_error('student_fees_master_id'),
                'fee_groups_feetype_id'  => form_error('fee_groups_feetype_id'),
                'amount_discount'        => form_error('amount_discount'),
                'amount_fine'            => form_error('amount_fine'),
                'payment_mode'           => form_error('payment_mode'),
            );
            $array = array('status' => 'fail', 'error' => $data);
            echo json_encode($array);
        } else {
            $staff_record=$this->staff_model->get($this->customlib->getStaffID());
          
            $collected_by             = " Collected By: " . $this->customlib->getAdminSessionUserName()."(". $staff_record['employee_id'].")";
            $student_fees_discount_id = $this->input->post('student_fees_discount_id');
            $json_array               = array(
                'amount'          => $this->input->post('amount'),
                'date'            => date('Y-m-d', $this->customlib->datetostrtotime($this->input->post('date'))),
                'amount_discount' => $this->input->post('amount_discount'),
                'amount_fine'     => $this->input->post('amount_fine'),
                'description'     => $this->input->post('description') . $collected_by,
                'payment_mode'    => $this->input->post('payment_mode'),
                'received_by'    => $staff_record['id'],
            );
            $data = array(
                'student_fees_master_id' => $this->input->post('student_fees_master_id'),
                'fee_groups_feetype_id'  => $this->input->post('fee_groups_feetype_id'),
                'amount_detail'          => $json_array,
            );

            $send_to     = $this->input->post('guardian_phone');
            $email       = $this->input->post('guardian_email');
            $parent_app_key       = $this->input->post('parent_app_key');
            $inserted_id = $this->studentfeemaster_model->fee_deposit($data, $send_to, $student_fees_discount_id);
            $mailsms_array=$this->feegrouptype_model->getFeeGroupByID($this->input->post('fee_groups_feetype_id'));

              $mailsms_array->invoice = $inserted_id;
              $mailsms_array->contact_no= $send_to;
              $mailsms_array->email = $email;
              $mailsms_array->parent_app_key = $parent_app_key;

            $this->mailsmsconf->mailsms('fee_submission', $mailsms_array);

            $array = array('status' => 'success', 'error' => '');
            echo json_encode($array);
        }
    }

    public function printFeesByName()
    {
        $data = array('payment' => "0");
        $record              = $this->input->post('data');
        $invoice_id          = $this->input->post('main_invoice');
        $sub_invoice_id      = $this->input->post('sub_invoice');
        $student_session_id  = $this->input->post('student_session_id');
        $setting_result      = $this->setting_model->get();
        $data['settinglist'] = $setting_result;
        $student             = $this->studentsession_model->searchStudentsBySession($student_session_id);

        $fee_record             = $this->studentfeemaster_model->getFeeByInvoice($invoice_id, $sub_invoice_id);
        $data['student']        = $student;
        $data['sub_invoice_id'] = $sub_invoice_id;
        $data['feeList']        = $fee_record;
        $this->load->view('print/printFeesByName', $data);
    }

    public function printFeesByGroup()
    {
        $fee_groups_feetype_id = $this->input->post('fee_groups_feetype_id');
        $fee_master_id         = $this->input->post('fee_master_id');
        $fee_session_group_id  = $this->input->post('fee_session_group_id');
        $setting_result        = $this->setting_model->get();
        $data['settinglist']   = $setting_result;
        $data['feeList']       = $this->studentfeemaster_model->getDueFeeByFeeSessionGroupFeetype($fee_session_group_id, $fee_master_id, $fee_groups_feetype_id);

        $this->load->view('print/printFeesByGroup', $data);
    }

    public function printFeesByGroupArray()
    {
        $setting_result      = $this->setting_model->get();
       
        $data['settinglist'] = $setting_result;
        $record              = $this->input->post('data');
        $record_array        = json_decode($record);
        $fees_array          = array();
        foreach ($record_array as $key => $value) {
            $fee_groups_feetype_id = $value->fee_groups_feetype_id;
            $fee_master_id         = $value->fee_master_id;
            $fee_session_group_id  = $value->fee_session_group_id;
            $feeList               = $this->studentfeemaster_model->getDueFeeByFeeSessionGroupFeetype($fee_session_group_id, $fee_master_id, $fee_groups_feetype_id);
            $fees_array[]          = $feeList;
        }
        $data['feearray'] = $fees_array;
        $this->load->view('print/printFeesByGroupArray', $data);
    }

    public function searchpayment()
    {
       if (!$this->rbac->hasPrivilege('search_fees_payment', 'can_view')) {
            access_denied();
        }
        $this->session->set_userdata('top_menu', 'Fees Collection');
        $this->session->set_userdata('sub_menu', 'studentfee/searchpayment');
        $data['title'] = 'Edit studentfees';
        $this->form_validation->set_rules('paymentid', $this->lang->line('payment_id'),'trim|required|xss_clean');
        if ($this->form_validation->run() == false) {

        } else {
            $paymentid = $this->input->post('paymentid');
            $invoice   = explode("/", $paymentid);

            if (array_key_exists(0, $invoice) && array_key_exists(1, $invoice)) {
                $invoice_id             = $invoice[0];
                $sub_invoice_id         = $invoice[1];
                $feeList                = $this->studentfeemaster_model->getFeeByInvoice($invoice_id, $sub_invoice_id);
                $data['feeList']        = $feeList;
                $data['sub_invoice_id'] = $sub_invoice_id;
            } else {
                $data['feeList'] = array();
            }
        }
        $this->load->view('layout/header', $data);
        $this->load->view('studentfee/searchpayment', $data);
        $this->load->view('layout/footer', $data);
    }

    public function addfeegroup()
    {
        $this->form_validation->set_rules('fee_session_groups', $this->lang->line('fee_group'), 'required|trim|xss_clean');

        if ($this->form_validation->run() == false) {
            $data = array(
                'fee_session_groups' => form_error('fee_session_groups'),
            );
            $array = array('status' => 'fail', 'error' => $data);
            echo json_encode($array);
        } else {
            $student_session_id     = $this->input->post('student_session_id');
            $fee_session_groups     = $this->input->post('fee_session_groups');
            $student_sesssion_array = isset($student_session_id) ? $student_session_id : array();
            $student_ids            = $this->input->post('student_ids');
            $delete_student         = array_diff($student_ids, $student_sesssion_array);

            $preserve_record = array();
            if (!empty($student_sesssion_array)) {
                foreach ($student_sesssion_array as $key => $value) {
                    $insert_array = array(
                        'student_session_id'   => $value,
                        'fee_session_group_id' => $fee_session_groups,
                    );
                    $inserted_id = $this->studentfeemaster_model->add($insert_array);

                    $preserve_record[] = $inserted_id;
                }
            }
            if (!empty($delete_student)) {
                $this->studentfeemaster_model->delete($fee_session_groups, $delete_student);
            }

            $array = array('status' => 'success', 'error' => '', 'message' => $this->lang->line('success_message'));
            echo json_encode($array);
        }
    }

    public function geBalanceFee()
    {
        $this->form_validation->set_rules('fee_groups_feetype_id', $this->lang->line('fee_groups_feetype_id'), 'required|trim|xss_clean');
        $this->form_validation->set_rules('student_fees_master_id', 'student_fees_master_id', 'required|trim|xss_clean');
        $this->form_validation->set_rules('student_session_id', 'student_session_id', 'required|trim|xss_clean');

        if ($this->form_validation->run() == false) {
            $data = array(
                'fee_groups_feetype_id'  => form_error('fee_groups_feetype_id'),
                'student_fees_master_id' => form_error('student_fees_master_id'),
            );
            $array = array('status' => 'fail', 'error' => $data);
            echo json_encode($array);
        } else {
            $data                   = array();
            $student_session_id     = $this->input->post('student_session_id');
            $fee_groups_feetype_id  = $this->input->post('fee_groups_feetype_id');
            $student_fees_master_id = $this->input->post('student_fees_master_id');
            $remain_amount_object   = $this->getStuFeetypeBalance($fee_groups_feetype_id, $student_fees_master_id);
            $discount_not_applied   = $this->getNotAppliedDiscount($student_session_id);
            $remain_amount          = json_decode($remain_amount_object)->balance;
            $remain_amount_fine     = json_decode($remain_amount_object)->fine_amount;

            $array = array('status' => 'success', 'error' => '', 'balance' => $remain_amount, 'discount_not_applied' => $discount_not_applied, 'remain_amount_fine' => $remain_amount_fine);
            echo json_encode($array);
        }
    }

    public function getStuFeetypeBalance($fee_groups_feetype_id, $student_fees_master_id)
    {
        $data                           = array();
        $data['fee_groups_feetype_id']  = $fee_groups_feetype_id;
        $data['student_fees_master_id'] = $student_fees_master_id;
        $result                         = $this->studentfeemaster_model->studentDeposit($data);
        $amount_balance                 = 0;
        $amount                         = 0;
        $amount_fine                    = 0;
        $amount_discount                = 0;
        $fine_amount                    = 0;
        $fee_fine_amount                = 0;
        $due_amt                        = $result->amount;
        if (strtotime($result->due_date) < strtotime(date('Y-m-d'))) {
            $fee_fine_amount = $result->fine_amount;
        }

        if ($result->is_system) {
            $due_amt = $result->student_fees_master_amount;
        }

        $amount_detail = json_decode($result->amount_detail);
        if (is_object($amount_detail)) {

            foreach ($amount_detail as $amount_detail_key => $amount_detail_value) {
                $amount          = $amount + $amount_detail_value->amount;
                $amount_discount = $amount_discount + $amount_detail_value->amount_discount;
                $amount_fine     = $amount_fine + $amount_detail_value->amount_fine;
            }
        }

        $amount_balance = $due_amt - ($amount + $amount_discount);
        $fine_amount    = abs($amount_fine - $fee_fine_amount);
        $array          = array('status' => 'success', 'error' => '', 'balance' => $amount_balance, 'fine_amount' => $fine_amount);
        return json_encode($array);
    }
  
    public function check_deposit($amount)
    {
        if ($this->input->post('amount') != "" && $this->input->post('amount_discount') != "") {
            if ($this->input->post('amount') < 0) {
                $this->form_validation->set_message('check_deposit', $this->lang->line('deposit_amount_can_not_be_less_than_zero'));
                return false;
            } else {
                $student_fees_master_id = $this->input->post('student_fees_master_id');
                $fee_groups_feetype_id  = $this->input->post('fee_groups_feetype_id');
                $deposit_amount         = $this->input->post('amount') + $this->input->post('amount_discount');
                $remain_amount          = $this->getStuFeetypeBalance($fee_groups_feetype_id, $student_fees_master_id);
                $remain_amount          = json_decode($remain_amount)->balance;
                if ($remain_amount < $deposit_amount) {
                    $this->form_validation->set_message('check_deposit', $this->lang->line('deposit_amount_can_not_be_greater_than_remaining'));
                    return false;
                } else {
                    return true;
                }
            }
            return true;
        }
        return true;
    }

    public function getNotAppliedDiscount($student_session_id)
    {
        return $this->feediscount_model->getDiscountNotApplied($student_session_id);
    }

    public function addfeegrp()
    {
        
        $staff_record=$this->session->userdata('admin');

        $this->form_validation->set_error_delimiters('', '');
        $this->form_validation->set_rules('row_counter[]', 'Fees List', 'required|trim|xss_clean');
        $this->form_validation->set_rules('collected_date', 'Date', 'required|trim|xss_clean');

        if ($this->form_validation->run() == false) {
            $data = array(
                'row_counter' => form_error('row_counter'),
                'collected_date' => form_error('collected_date'),
            );
            $array = array('status' => 0, 'error' => $data);
            echo json_encode($array);
        } else {
            $collected_array = array();
            $collected_by    = " Collected By: " . $this->customlib->getAdminSessionUserName();

            $total_row = $this->input->post('row_counter');
            foreach ($total_row as $total_row_key => $total_row_value) {

                $this->input->post('student_fees_master_id_' . $total_row_value);
                $this->input->post('fee_groups_feetype_id_' . $total_row_value);

                $json_array = array(
                    'amount'          => $this->input->post('fee_amount_' . $total_row_value),
                    'date'            => date('Y-m-d'),
                    'description'     => $this->input->post('fee_gupcollected_note') . $collected_by,
                    'amount_discount' => 0,
                    'amount_fine'     => 0,
                    'payment_mode'    => $this->input->post('payment_mode_fee'),
                    'received_by'    => $staff_record['id'],
                );
                $collected_array[] = array(
                    'student_fees_master_id' => $this->input->post('student_fees_master_id_' . $total_row_value),
                    'fee_groups_feetype_id'  => $this->input->post('fee_groups_feetype_id_' . $total_row_value),
                    'amount_detail'          => $json_array,
                );

            }
           
            $inserted_id = $this->studentfeemaster_model->fee_deposit_collections($collected_array);
            $array = array('status' => 1, 'error' => '');
            echo json_encode($array);
        }
    }
    public function getBulkStudents()
    {
        $listOfAdmission_no= $this->input->post('ListOfAdmission_no');
        $listArray= explode(',', $listOfAdmission_no);
        //print_r($listArray);
        foreach($listArray as $list)
        {
            $result= $this->studentfee_model->getstudent_bulkfee($list);
            print_r($result);
        }
        $month= date("n");
        $month= ($month-1)."-20";
        print_r($month);
    }
}
