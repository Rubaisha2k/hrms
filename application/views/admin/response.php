<head>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script type="text/javascript"src="code.jquery.com/jquery-1.10.2.min.js"></script>
</head>
<?php $session = $this->session->userdata('username');?>
<?php $get_animate = $this->Xin_model->get_content_animate();?>
<?php $role_resources_ids = $this->Xin_model->user_role_resource(); ?>
<div id="smartwizard-2" class="smartwizard-example sw-main sw-theme-default">
  <ul class="nav nav-tabs step-anchor">
    <?php if(in_array('5',$role_resources_ids)) { ?>
    <li class="nav-item clickable"> <a href="<?php echo site_url('admin/company/');?>" data-link-data="<?php echo site_url('admin/company/');?>" class="mb-3 nav-link hrsale-link"> <span class="sw-icon ion ion-md-business"></span> <?php echo $this->lang->line('left_company');?>
      <div class="text-muted small"><?php echo $this->lang->line('xin_set_up');?> <?php echo $this->lang->line('xin_companies');?></div>
      </a> </li>
      
      <?php } ?>
    <?php if(in_array('6',$role_resources_ids)) { ?>
    <li class="nav-item clickable"> <a href="<?php echo site_url('admin/location/');?>" data-link-data="<?php echo site_url('admin/location/');?>" class="mb-3 nav-link hrsale-link"> <span class="sw-icon fas fa-location-arrow"></span> <?php echo $this->lang->line('left_location');?>
      <div class="text-muted small"><?php echo $this->lang->line('xin_set_up');?> <?php echo $this->lang->line('xin_locations');?></div>
      </a> </li>
     <?php } ?>
    <?php if(in_array('3',$role_resources_ids)) { ?>
    <li class="nav-item clickable"> <a href="<?php echo site_url('admin/department/');?>" data-link-data="<?php echo site_url('admin/department/');?>" class="mb-3 nav-link hrsale-link"> <span class="sw-icon fab fa-codepen"></span> <?php echo $this->lang->line('left_department');?>
      <div class="text-muted small"><?php echo $this->lang->line('xin_add_new');?> <?php echo $this->lang->line('left_department');?></div>
      </a> </li>
     <?php } ?>
    <?php if(in_array('4',$role_resources_ids)) { ?>
    <li class="nav-item clickable"> <a href="<?php echo site_url('admin/designation/');?>" data-link-data="<?php echo site_url('admin/designation/');?>" class="mb-3 nav-link hrsale-link"> <span class="sw-icon fab fa-dev"></span> <?php echo $this->lang->line('left_designation');?>
      <div class="text-muted small"><?php echo $this->lang->line('xin_add_new');?> <?php echo $this->lang->line('left_designation');?></div>
      </a> </li>
    <?php } ?>
    <?php if(in_array('11',$role_resources_ids)) { ?>
    <li class="nav-item clickable"> <a href="<?php echo site_url('admin/announcement/');?>" data-link-data="<?php echo site_url('admin/announcement/');?>" class="mb-3 nav-link hrsale-link"> <span class="sw-icon ion ion-md-megaphone"></span> <?php echo $this->lang->line('left_announcements');?>
      <div class="text-muted small"><?php echo $this->lang->line('xin_set_up');?> <?php echo $this->lang->line('left_announcements');?></div>
      </a> </li>
     <?php } ?>    
     <?php if(in_array('9',$role_resources_ids)) { ?>
     <li class="nav-item clickable"> <a href="<?php echo site_url('admin/policy/');?>" data-link-data="<?php echo site_url('admin/policy/');?>" class="mb-3 nav-link hrsale-link"> <span class="sw-icon fab fa-yelp"></span> <?php echo $this->lang->line('left_policies');?>
      <div class="text-muted small"><?php echo $this->lang->line('xin_set_up');?> <?php echo $this->lang->line('header_policies');?></div>
      </a> </li>
      <li class="nav-item clickable"> <a href="<?php echo site_url('admin/questionnaire/');?>" data-link-data="" class="mb-3 nav-link hrsale-link"> <span class="sw-icon ion ion-md-list-box"></span> <?php echo "Questionnaire";?>
      <div class="text-muted small"><?php echo "Create Questions";?> </div>
      </a> </li>
      <li class="nav-item active"> <a href="<?php echo site_url('admin/questionnaire_response');?>" data-link-data="" class="mb-3 nav-link hrsale-link"> <span class="sw-icon ion ion-ios-archive"></span> <?php echo "Questionnaire Response";?>
      <div class="text-muted small"><?php echo "Show Questionnaire Responses";?> </div>
      </a> </li>
      <?php } ?>
  </ul>
</div>

<table class="table table-striped questions">
<thead>
<th>Employee ID</th>
<th>Name</th>
<th>Questions Attempted</th>
<th>Correct Answers</th>
<th>Percentage</th>
<th>Action</th>

</thead>
<?php foreach($records as $q){ ?>
<?php $percentage = (($q->answers_correct)/50)*100;?>
<tr>
<td><?php echo $q->employee_id; ?></td>
<td><?php echo $q->first_name." ".$q->last_name; ?></td>
<td><a href="<?php echo base_url();?>admin/questionnaire_response/showRec/<?php echo $q->user_id?>" target="blank" style="color: #4E5155; text-decoration:underline;"><?php echo $q->questions_attempted;?></a></td>
<td><?php echo $q->answers_correct;?></td>

<td><?php echo round($percentage)."%";?> </td>
<?php if($percentage<95)
{
?>
<td><?php echo "Not Qualified";?></td>
<?php
} else{?>
<td><a href="#0" class="btn btn-primary" onclick="printCert(<?php echo $q->employee_id;?>)">Certificate</a></td>
</tr>
<?php }} ?>
</table>
</div>
</hr>

<script type="text/javascript">

</script>