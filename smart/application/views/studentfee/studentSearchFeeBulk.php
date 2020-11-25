<style type="text/css">
    @media print
    {
        .no-print, .no-print *
        {
            display: none !important;
        }
        .print, .print *
        {
            display: block;
        }
    }
    .print, .print *
    {
        display: none;
    }
</style>
<?php
$currency_symbol = $this->customlib->getSchoolCurrencyFormat();
?>
<div class="content-wrapper" style="min-height: 946px;">
    <section class="content-header">
        <h1>
            <i class="fa fa-money"></i> <?php echo $this->lang->line('fees_collection'); ?></h1>
    </section>
    <!-- Main content -->
    <section class="content">
        <div class="row">
            <div class="col-md-12">
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title"><i class="fa fa-search"></i> <?php echo "Enter Admission Numbers Of Students" ?>
                        </h3>
                        </div>

                        <div class="col-md-6">
                        <!-- getbulkstudents for getting bulk students for fee submission -->
                        <?php echo form_open('studentfee/getBulkStudents')?>
                        <input type="text" class="form-control" name="ListOfAdmission_no">
                        </div>
                        <button class="btn btn-primary">Enter</button>
                    <?php echo form_close(); ?>

                <?php
if (isset($student_due_fee)) {
    ?>
                    <div class="" id="duefee">
                        <div class="box-header ptbnull"></div>
                        <div class="box-header ptbnull">
                            <h3 class="box-title titlefix"><i class="fa fa-users"></i> <?php echo $this->lang->line('student_lists'); ?></h3>
                        </div>
                        <div class="box-body table-responsive">
                            <div class="row print" >
                                <div class="col-md-12">
                                    <div class="col-md-4">
                                        <b><?php echo $this->lang->line('class'); ?>: </b> <span class="cls"></span>
                                    </div>
                                    <div class="col-md-4">
                                        <b><?php echo $this->lang->line('fees_category'); ?>: </b><span class="fcat"></span>
                                    </div><div class="col-md-4">
                                        <b><?php echo $this->lang->line('fees_type'); ?>: </b> <span class="ftype"></span>
                                    </div>
                                </div>
                            </div>
                            <div class="download_label"><?php echo $this->lang->line('student_lists'); ?></div>
                            <table class="table table-striped table-bordered table-hover example">
                                <thead>
                                    <tr>

                                        <th><?php echo $this->lang->line('admission_no'); ?></th>
                                        <th><?php echo $this->lang->line('roll_no'); ?></th>
                                        <th><?php echo $this->lang->line('student'); ?> <?php echo $this->lang->line('name'); ?> </th>
                                        <th><?php echo $this->lang->line('date_of_birth'); ?></th>

                                        <th><?php echo $this->lang->line('due_date'); ?></th>
                                        <th class="text text-right"><?php echo $this->lang->line('amount'); ?> <span><?php echo "(" . $currency_symbol . ")"; ?></span></th>
                                        <th class="text text-right"><?php echo $this->lang->line('deposit'); ?> <span><?php echo "(" . $currency_symbol . ")"; ?></span></th>
                                        <th class="text text-right"><?php echo $this->lang->line('discount'); ?> <span><?php echo "(" . $currency_symbol . ")"; ?></span></th>
                                        <th class="text text-right"><?php echo $this->lang->line('fine'); ?> <span><?php echo "(" . $currency_symbol . ")"; ?></span></th>

                                        <th class="text text-right"><?php echo $this->lang->line('balance'); ?> <span><?php echo "(" . $currency_symbol . ")"; ?></span></th>

                                        <th class="text text-right"> <input type="checkbox" class="bulkcheck_main"> </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php if (empty($student_due_fee)) {
        ?>
                                        <tr>
                                            <td colspan="11" class="text-danger text-center"><?php echo $this->lang->line('no_record_found'); ?></td>
                                        </tr>
                                        <?php
} else {
        $count = 1;
        foreach ($student_due_fee as $student) {

            ?>
                                            <tr>

                                                <td><?php echo $student['admission_no']; ?></td>
                                                <td><?php echo $student['roll_no']; ?></td>
                                                <td><?php echo $student['firstname'] . " " . $student['lastname']; ?></td>
                                                <td><?php echo date($this->customlib->getSchoolDateFormat(), $this->customlib->dateyyyymmddTodateformat($student['dob'])); ?></td><td><?php echo date($this->customlib->getSchoolDateFormat(), $this->customlib->dateyyyymmddTodateformat($student['due_date'])); ?></td>

                                                <td class="text text-right"><?php
echo (number_format($student['amount'], 2, '.', ''));
            ?></td>
                                                <td class="text text-right"><?php
echo (number_format($student['amount_detail'], 2, '.', ''));
            ?></td>
                                                <td class="text text-right"><?php
echo (number_format($student['amount_discount'], 2, '.', ''));
            ?></td>
                                                <td contenteditable="true" class="fine-td text text-right"><?php
echo (number_format($student['amount_fine'], 2, '.', ''));
            ?></td>
                                                <td class="text text-right"><?php
echo (number_format(($student['amount'] - ($student['amount_detail'] + $student['amount_discount'])), 2, '.', ''));
            ?></td>
                                                <td class="text text-right">
                                                    <?php  /*?>
                <?php if ($this->rbac->hasPrivilege('collect_fees', 'can_add')) {?><a href="<?php echo base_url(); ?>studentfee/addfee/<?php echo $student['student_session_id'] ?>" class="btn btn-info btn-xs">
                <?php echo $currency_symbol; ?> <?php echo $this->lang->line('add_fees'); ?>
                                                        </a>
                                                    <?php }?>
                                                    <?php */ ?>
<?php 

    $discount = $this->db->query("SELECT student_fees_discounts.id,fees_discounts.amount  FROM `student_fees_discounts` inner join fees_discounts on fees_discounts.id = student_fees_discounts.fees_discount_id 
WHERE student_fees_discounts.status = 'assigned' and student_fees_discounts.student_session_id = '".$student['student_session_id']."' ")->row();
?>

<?php if (($student['amount'] - ($student['amount_detail'] + $student['amount_discount'])) != 0): ?>
    <input type="checkbox" name="" class="bulk_chebox"
        data-student-master="<?php echo $student['fee_master_id']; ?>" 
        data-group-typeid="<?php echo $feegrouptypeid; ?>" 
        data-amount="<?php echo $student['amount']; ?>" 
        data-discount="<?php echo $student['amount_discount']; ?>" 
        data-fine="<?php echo $student['amount_fine']; ?>" 
        data-discountid="<?php echo $discount->id ?? null; ?>" 
        data-discountamount="<?php echo $discount->amount ?? null; ?>">
    <?php else: ?>
        <span style="color: green; font-weight: bold; letter-spacing: 1px;">PAID</span>
<?php endif ?>
                                                </td>
                                            </tr>
                                            <?php
}
        $count++;
    }
    ?>

                                </tbody>
                            </table>
                            <br>
                            <button type="button" class="btn btn-sm btn-primary pull-right bulkbtnsubmit" autocomplete="off"> <?php echo $this->lang->line('bulkfees'); ?></button>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                   </div>
                </div>
            </div>
            <?php
} else {

}
?>

    </section>
</div>
<script type="text/javascript">
    function getSectionByClass(class_id, section_id) {
        if (class_id != "" && section_id != "") {
            $('#section_id').html("");
            var base_url = '<?php echo base_url() ?>';
            var div_data = '<option value=""><?php echo $this->lang->line('select'); ?></option>';
            $.ajax({
                type: "GET",
                url: base_url + "sections/getByClass",
                data: {'class_id': class_id},
                dataType: "json",
                success: function (data) {
                    $.each(data, function (i, obj)
                    {
                        var sel = "";
                        if (section_id == obj.section_id) {
                            sel = "selected=selected";
                        }
                        div_data += "<option value=" + obj.section_id + " " + sel + ">" + obj.section + "</option>";
                    });
                    $('#section_id').append(div_data);
                }
            });
        }
    }

    $(document).ready(function () {
        var class_id = $('#class_id').val();
        var section_id = '<?php echo set_value('section_id') ?>';
        getSectionByClass(class_id, section_id);
        $(document).on('change', '#class_id', function (e) {
            $('#section_id').html("");
            var class_id = $(this).val();
            var base_url = '<?php echo base_url() ?>';
            var div_data = '<option value=""><?php echo $this->lang->line('select'); ?></option>';
            $.ajax({
                type: "GET",
                url: base_url + "sections/getByClass",
                data: {'class_id': class_id},
                dataType: "json",
                success: function (data) {
                    $.each(data, function (i, obj)
                    {
                        div_data += "<option value=" + obj.section_id + ">" + obj.section + "</option>";
                    });
                    $('#section_id').append(div_data);
                }
            });
        });
        var date_format = '<?php echo $result = strtr($this->customlib->getSchoolDateFormat(), ['d' => 'dd', 'm' => 'mm', 'Y' => 'yyyy']) ?>';

        $('#dob,#admission_date').datepicker({
            format: date_format,
            autoclose: true
        });
    });
</script>

<script type="text/javascript">
    $(document).ready(function () {
        function getSectionByClass(feecategory_id, feetype_id) {
            if (feecategory_id != "" && feetype_id != "") {
                $('#feetype_id').html("");
                var base_url = '<?php echo base_url() ?>';
                var div_data = '<option value=""><?php echo $this->lang->line('select'); ?></option>';
                $.ajax({
                    type: "GET",
                    url: base_url + "feemaster/getByFeecategory",
                    data: {'feecategory_id': feecategory_id},
                    dataType: "json",
                    success: function (data) {
                        $.each(data, function (i, obj)
                        {
                            var sel = "";
                            if (feetype_id == obj.id) {
                                sel = "selected=selected";
                            }
                            div_data += "<option value=" + obj.id + " " + sel + ">" + obj.type + "</option>";
                        });
                        $('#feetype_id').append(div_data);
                    }
                });
            }
        }

        var feecategory_id = $('#feecategory_id').val();
        var feetype_id = '<?php echo set_value('feetype_id') ?>';
        getSectionByClass(feecategory_id, feetype_id);
        $(document).on('change', '#feecategory_id', function (e) {
            $('#feetype_id').html("");
            var feecategory_id = $(this).val();
            var base_url = '<?php echo base_url() ?>';
            var div_data = '<option value=""><?php echo $this->lang->line('select'); ?></option>';

            $.ajax({
                type: "GET",
                url: base_url + "feemaster/getByFeecategory",
                data: {'feecategory_id': feecategory_id},
                dataType: "json",
                success: function (data) {
                    $.each(data, function (i, obj)
                    {
                        div_data += "<option value=" + obj.id + ">" + obj.type + "</option>";
                    });
                    $('#feetype_id').append(div_data);
                }
            });
        });

    });
</script>

<script type="text/javascript">
    var base_url = '<?php echo base_url() ?>';
    function printDiv(elem) {
        var fcat = $("#feecategory_id option:selected").text();
        var ftype = $("#feetype_id option:selected").text();
        var cls = $("#class_id option:selected").text();
        var sec = $("#section_id option:selected").text();
        $('.fcat').html(fcat);
        $('.ftype').html(ftype);
        $('.cls').html(cls + '(' + sec + ')');
        Popup(jQuery(elem).html());
    }

    function Popup(data)
    {

        var frame1 = $('<iframe />');
        frame1[0].name = "frame1";
        frame1.css({"position": "absolute", "top": "-1000000px"});
        $("body").append(frame1);
        var frameDoc = frame1[0].contentWindow ? frame1[0].contentWindow : frame1[0].contentDocument.document ? frame1[0].contentDocument.document : frame1[0].contentDocument;
        frameDoc.document.open();
        //Create a new HTML document.
        frameDoc.document.write('<html>');
        frameDoc.document.write('<head>');
        frameDoc.document.write('<title></title>');
        frameDoc.document.write('<link rel="stylesheet" href="' + base_url + 'backend/bootstrap/css/bootstrap.min.css">');
        frameDoc.document.write('<link rel="stylesheet" href="' + base_url + 'backend/dist/css/font-awesome.min.css">');
        frameDoc.document.write('<link rel="stylesheet" href="' + base_url + 'backend/dist/css/ionicons.min.css">');
        frameDoc.document.write('<link rel="stylesheet" href="' + base_url + 'backend/dist/css/AdminLTE.min.css">');
        frameDoc.document.write('<link rel="stylesheet" href="' + base_url + 'backend/dist/css/skins/_all-skins.min.css">');
        frameDoc.document.write('<link rel="stylesheet" href="' + base_url + 'backend/plugins/iCheck/flat/blue.css">');
        frameDoc.document.write('<link rel="stylesheet" href="' + base_url + 'backend/plugins/morris/morris.css">');
        frameDoc.document.write('<link rel="stylesheet" href="' + base_url + 'backend/plugins/jvectormap/jquery-jvectormap-1.2.2.css">');
        frameDoc.document.write('<link rel="stylesheet" href="' + base_url + 'backend/plugins/datepicker/datepicker3.css">');
        frameDoc.document.write('<link rel="stylesheet" href="' + base_url + 'backend/plugins/daterangepicker/daterangepicker-bs3.css">');
        frameDoc.document.write('</head>');
        frameDoc.document.write('<body>');
        frameDoc.document.write(data);
        frameDoc.document.write('</body>');
        frameDoc.document.write('</html>');
        frameDoc.document.close();
        setTimeout(function () {
            window.frames["frame1"].focus();
            window.frames["frame1"].print();
            frame1.remove();
        }, 500);


        return true;
    }
    $('.bulkcheck_main').click(function(){
        if($('.bulkcheck_main').is(':checked')){
            $('.bulk_chebox').prop('checked', true);
        }else{
            $('.bulk_chebox').prop('checked', false);
        }
    });

    $('.bulkbtnsubmit').click(function(){
        var link = "<?php echo base_url(); ?>studentfee/submitbulkfee";
        var StudentMasterID_Arr = [];
        var FeeTypeID_Arr = [];
        var Amount_Arr = [];
        var Discount_Arr = [];
        var Fine_Arr = [];
        var DiscountID_Arr = [];
        var DiscountAmount_Arr = [];
        var feemaster = [];
        $('.bulk_chebox:checked').each(function(e){
            var StudentMasterID = $(this).data('student-master');
            var FeeTypeID = $(this).data('group-typeid');
            var Amount = $(this).data('amount');
            var Discount = $(this).data('discount');
            var Fine = $(this).data('fine');
            var DiscountID = $(this).data('discountid');
            var DiscountAmount = $(this).data('discountamount');
            StudentMasterID_Arr.push(StudentMasterID);
            FeeTypeID_Arr.push(FeeTypeID);
            Amount_Arr.push(Amount);
            Discount_Arr.push(Discount);
            Fine_Arr.push(Fine);
            DiscountID_Arr.push(DiscountID);
            DiscountAmount_Arr.push(DiscountAmount);
            dataArray = {
                StudentMasterID: StudentMasterID_Arr,
                FeeTypeID: FeeTypeID_Arr,
                Amount: Amount_Arr,
                Discount: Discount_Arr,
                Fine: Fine_Arr,
                DiscountID: DiscountID_Arr,
                DiscountAmount: DiscountAmount_Arr,
            };
        });
        // console.log(dataArray);
        $.ajax({
            url:link,
            method:"POST",
            data:dataArray,
            success:function(data){
                location.reload();
                // alert("Bulk Fees Has Been Uploaded Successfully...!");
                // console.log(data);
            }
        })
    });

    $('.fine-td').blur(function(){
        var text = $(this).text();
        $(this).next().next().find('input[type="checkbox"]').data('fine', text);
    });
</script>