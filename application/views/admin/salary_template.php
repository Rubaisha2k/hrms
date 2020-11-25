
<body>
<div class="row">
<div class="col-md-9">
    <table class="table table-striped question">
    <thead>
    <th>Template Name</th>
    <th>Amount</th>
    </thead>
    <form action="<?php echo base_url()?>hrms-api/index.php/salary_template/saveTemplate" id="template_form" method="POST" class="form-control">
    <tr>
    <td>Basic Salary(%)</td>
    <td><input type="text" name="basic_salary" id="basic_salary" class="form-control" style="text-align: center;" value="<?php echo $salary_template[0]['basic_salary']?>"></td>
    </tr>
    <tr>
    <td>House Rent Allowance(%)</td>
    <td><input type="text" name="house_rent" id="house_rent" class="form-control" style="text-align: center;" value="<?php echo $salary_template[0]['house_rent_allowance']?>" ></td>
    </tr><tr>
    <td>Utilities Allowance(%)</td>
    <td><input type="text" name="utilities" id="utilities" class="form-control" style="text-align: center;" value="<?php echo $salary_template[0]['dearness_allowance']?>"></td>
    </tr><tr>
    <td>Transport Allowance(%)</td>
    <td><input type="text" name="transport" id="transport" class="form-control" style="text-align: center;" value="<?php echo $salary_template[0]['travelling_allowance']?>"></td>
    </tr>
    <td>Medical Allowance(%)</td>
    <td><input type="text" name="medical" id="medical" class="form-control" style="text-align: center;" value="<?php echo $salary_template[0]['medical_allowance']?>"></td>
    </tr>
    <tr>
    <td></td>
    <td>Employee EOBI amount</td>
    <td>Employer EOBI amount</td>
    </tr>
    <tr>
    <td>EOBI Amount</td>
    <td><input type="text" name="eobi" style="text-align: center;" class="form-control" value="<?php echo $eobi[0]['eobi_amount']?>"></td>
    <td><input type="text" name="eobi_employer" style="text-align: center;" class="form-control" value="<?php echo $eobi[0]['eobi_employer_amount']?>"></td>
    </tr>
    <tr>
    <td></td>
    <td>Employee PF amount</td>
    <td>Employer PF amount</td>
    </tr>
    <tr>
    <td>Provident Fund(% on Basic Salary)</td>
    <td><input type="text" name="provident" id="provident" style="text-align: center;" value="<?php echo $salary_template[0]['provident_fund']?>" class="form-control"></td>
    <td><input type="text" readonly id="provident_c" style="text-align: center;" value="<?php echo $salary_template[0]['provident_fund']?>" class="form-control"></td>
    </tr>
    <tr>
    <td></td>
    <td></td>
    <td style="text-align: right;"><button type="submit" id="save_btn" class="btn btn-primary">Save</button></td>
    </tr>

    </form>
    </div>
    <div class="col-md-12">
    <table class>
    <th></th>
    <th></th>
    <th></th>
    </table>
    </div>
    </div>
    </table>
    </body>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <script type="text/javascript">
    $('#provident').change(function(){
        var provident = $('#provident').val(); 
        $('#provident_c').html(provident);
    })

    $('#basic_salary').change(function(){
    var percentage = parseInt($("#basic_salary").val());
    var Hpercentage = parseInt($("#house_rent").val());
    var Upercentage = parseInt($("#utilities").val());
    var Mpercentage = parseInt($("#medical").val());
    var Tpercentage = parseInt($("#transport").val());
        var total = percentage+Hpercentage+Upercentage+Mpercentage+Tpercentage;
        if(total<100 || total>100)
        {
            alert("The Total Percentage Cannot Be Greater or Lesser Than 100%");
            $("#save_btn").hide();
        }
        else{
            $("#save_btn").show();
        }
    })
    $('#house_rent').change(function(){
    var percentage = parseInt($("#basic_salary").val());
    var Hpercentage = parseInt($("#house_rent").val());
    var Upercentage = parseInt($("#utilities").val());
    var Mpercentage = parseInt($("#medical").val());
    var Tpercentage = parseInt($("#transport").val());
        var total = percentage+Hpercentage+Upercentage+Mpercentage+Tpercentage;
        if(total<100 || total>100)
        {
            alert("The Total Percentage Cannot Be Greater or Lesser Than 100%");
            $("#save_btn").hide();
        }
        else{
            $("#save_btn").show();
        }
    })
    $('#medical').change(function(){
    var percentage = parseInt($("#basic_salary").val());
    var Hpercentage = parseInt($("#house_rent").val());
    var Upercentage = parseInt($("#utilities").val());
    var Mpercentage = parseInt($("#medical").val());
    var Tpercentage = parseInt($("#transport").val());
        var total = percentage+Hpercentage+Upercentage+Mpercentage+Tpercentage;
        if(total<100 || total>100)
        {
            alert("The Total Percentage Cannot Be Greater or Lesser Than 100%");
            $("#save_btn").hide();
        }
        else{
            $("#save_btn").show();
        }
    })
    $('#transport').change(function(){
    var percentage = parseInt($("#basic_salary").val());
    var Hpercentage = parseInt($("#house_rent").val());
    var Upercentage = parseInt($("#utilities").val());
    var Mpercentage = parseInt($("#medical").val());
    var Tpercentage = parseInt($("#transport").val());
        var total = percentage+Hpercentage+Upercentage+Mpercentage+Tpercentage;
        if(total<100 || total>100)
        {
            alert("The Total Percentage Cannot Be Greater or Lesser Than 100%");
            $("#save_btn").hide();
        }
        else{
            $("#save_btn").show();
        }
    })
    $('#utilities').change(function(){
    var percentage = parseInt($("#basic_salary").val());
    var Hpercentage = parseInt($("#house_rent").val());
    var Upercentage = parseInt($("#utilities").val());
    var Mpercentage = parseInt($("#medical").val());
    var Tpercentage = parseInt($("#transport").val());
        var total = percentage+Hpercentage+Upercentage+Mpercentage+Tpercentage;
        if(total<100 || total>100)
        {
            alert("The Total Percentage Cannot Be Greater or Lesser Than 100%");
            $("#save_btn").hide();
        }
        else{
            $("#save_btn").show();
        }
    })

$(document).ready(function(e){
$("#template_form").on('submit', function(e){
e.preventDefault();
$.ajax({
    url: "<?php echo base_url()?>hrms-api/index.php/salary_template/saveTemplate",
    method: "POST",
    datatype: 'json',
    data: $(this).serializeArray(),
    success : function(response)
    {
        window.location.reload();
    }
})
});
})
    </script>