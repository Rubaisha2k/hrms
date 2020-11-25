<form action="<?php echo base_url()?>hrms-api/index.php/PolicyResponse" method="POST" id="policy-f">
<input type="hidden" name="<?php echo $this->security->get_csrf_token_name();?>" value="<?php echo $this->security->get_csrf_hash();?>">
<input type="hidden" name="employee_id" value="<?php echo $employee_id?>">
<div class="container">
<?php for($i=0; $i<1; $i++){ 
?>
<br>
<label for="" class="form-label">Question:<?php echo ($i+1);?></label>
<input type="hidden" name="q_id_<?php echo ($i+1);?>" value="<?php echo $questions[$i][0]->question_id?>">
<br>
<label for="" class="form-label"><?php print_r($questions[$i][0]->question)?></label>
<br>
<select name="answer_<?php echo ($i+1);?>" id="answer_<?php echo ($i+1);?>" class="form-control">
<option>Select</option>
<?php 
$option = explode(',',$questions[$i][0]->options);
foreach ( $option as $o)
{
    ?>
     <option value="<?php echo $o;?>"><?php echo $o;?></option>
    <?php
}
?>
</select>
<?php } ?>
<div class="">
<br>
<button type="submit" class="btn btn-primary" style="float: right;">Submit</button>
</div>
</div>
</form>
<script type="text/javascript">
$("body").on("submit", "#policy-f", function(e){
    e.preventDefault();
    $.ajax({
        url: "<?php echo base_url();?>hrms-api/index.php/PolicyResponse",
        type :"POST",
        data : $(this).serializeArray(),
        dataType : 'json',
        success : function(response){
            console.log(response)
        }
    });
})
</script>