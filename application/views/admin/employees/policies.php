<table class="table table-striped">
<th>Policy Id</th>
<th>Title</th>
<th>Description</th>
<th>Attachment</th>
<?php echo $employee_id;?>
<?php foreach($policies as $p)
{
    $replace = array('<p>', '</p>');
    $description = str_replace($replace,'',strval($p->description));
     ?>
    <tr>
<td><?php echo $p->policy_id ?></td>
<td><?php echo $p->title ?></td>
<td><?php echo $description ?></td>
<?php if($p->attachment != ""){ ?>
<td><a href="<?php echo base_url('uploads/company_policy/');?><?php echo $p->attachment?>" target="blank">View Image</a> </td> <?php } else{ ?>
<td>No Image Found!</td>
<?php } ?>
    </tr>
<?php } ?>
</table>
<div class="col-10">
<a class="btn btn-primary" href="<?php echo base_url()?>admin/policies/policyreview/<?php echo $employee_id;?>">Start Test</a>
</div>

<script type="text/javascript">

</script>