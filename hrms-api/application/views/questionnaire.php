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
      <li class="nav-item active"> <a href="<?php echo site_url('admin/questionnaire/');?>" data-link-data="" class="mb-3 nav-link hrsale-link"> <span class="sw-icon ion ion-md-list-box"></span> <?php echo "Questionnaire";?>
      <div class="text-muted small"><?php echo "Create Questions";?> </div>
      </a> </li>
      <li class="nav-item clickable"> <a href="<?php echo site_url('admin/questionnaire_response');?>" data-link-data="" class="mb-3 nav-link hrsale-link"> <span class="sw-icon ion ion-ios-archive"></span> <?php echo "Questionnaire Response";?>
      <div class="text-muted small"><?php echo "Show Questionnaire Responses";?> </div>
      </a> </li>
      <?php } ?>
  </ul>
</div>
<?php $user_info = $this->Xin_model->read_user_info($session['user_id']);?>
<hr class="border-light m-0 mb-3">
<div class="container">
<div class="col-md-6">
<form action="" id="question-f" method="POST">
<input type="hidden" name="<?php echo $this->security->get_csrf_token_name();?>" value="<?php echo $this->security->get_csrf_hash();?>">
<div class="form-group">
<div class="card-header with-elements"> <span class="card-header-title mr-2"><strong><?php echo $this->lang->line('xin_add_new');?></strong> <?php echo "Question";?></span>
</div>
<label for="" class="form-label">Question</label>
<input type="text" id="question" class="form-control" name="question">
<p class="q-error"></p>
<label for="" class="form-label">Answer</label>
<input type="text" id="answer" class="form-control" name="answer">
<p class="a-error"></p>
<label for="" class="form-label">Options</label>
<input type="text" id="options" class="form-control" name="options">
<p class="o-error"></p>
<button class="btn btn-primary" type="submit" id="submit-f">Submit</button>
</form>
   </div>
</div>
<table class="table table-striped questions">
<thead>
<th>Question#</th>
<th>Question</th>
<th>Answer</th>
<th>Action</th>
</thead>
<?php foreach($questions as $q){ ?>
<tr>
<td><?php echo $q->question_id; ?></td>
<td><?php echo $q->question; ?></td>
<td><?php echo $q->answers;?></td>
<td><a href="#0" class="btn btn-primary" onclick="edit(<?php echo $q->question_id;?>)">Edit</a>   <a href="#0" class="btn btn-danger" onclick="deleteQ(<?php echo $q->question_id;?>)">Delete</a></td>
</tr>
<?php } ?>
</table>
</div>
<div class="modal" role="dialog" id="edit-M">
<div class="modal-dialog">
<div class="modal-content">
<div class="modal-header">
<h5 class="modal-title">Edit Question</h5>
<button type="button" class="close" data-dismiss="modal" aria-label="Close">
<span aria-hidden="true">&times;</span>
        </button>
</div>
<div id="response"></div>
</div>
</div>
 </div>
</hr>

<script type="text/javascript">
$("body").on("submit", "#question-f", function(e){
    e.preventDefault();
    $.ajax({
        url: "<?php echo base_url();?>admin/Questionnaire/addQuestion",
        method : "POST",
        data:$(this).serializeArray(),
        dataType: 'json',
        success : function(response)
        {
            $(".questions").append(response['data']);
        }
    });
})
function edit(id){
  $("#edit-M").modal('show');
  $.ajax({
    url : "<?php echo base_url()?>admin/Questionnaire/editQuestion/"+id,
    type : "POST",
    data :{},
    dataType: 'json',
    success : function(response)
    {
      $("#response").html(response['modal-body'])
    }
  });
}
</script>