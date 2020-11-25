<form action="" method="POST" id="edit-form">
<input type="hidden" name="<?php echo $this->security->get_csrf_token_name();?>" value="<?php echo $this->security->get_csrf_hash();?>">
<div class="modal-body">
<input type="hidden" id="Qid" name="Qid" value="<?php echo $row[0]->question_id?>">
<label class="form-group">Question</label>
<input type="text" name="question" id="question" class="form-control" value="<?php echo $row[0]->question?>">
<p class="ques-error"></p>
<label class="form-group">Answer</label>
<input type="text" name="answer" id="answer" class="form-control" value="<?php echo $row[0]->answers?>">
<p class="ans-error"></p>

<label class="form-group">Options</label>
<input type="text" name="options" id="options" class="form-control" value="<?php echo $row[0]->options?>">
<p class="opt-error"></p>
</div>
<div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-primary">Update</button>
            </div>
</form>