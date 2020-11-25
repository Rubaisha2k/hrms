<tr id="row-<?php echo $data[0]->question_id;?>">
    <td class="rowId" value="<?php echo $data[0]->question_id;?>"><?php echo $data[0]->question_id;?></td>
    <td class="rowQ"><?php echo $data[0]->question;?></td>
    <td class="rowA"><?php echo $data[0]->answers;?></td>
    <td id="edit-btn" ><a class="btn btn-primary" value="<?php echo $data[0]->question_id?>" href="#0" onclick="editModal(<?php echo $data[0]->question_id;?>)">Edit</a>   <a class="btn btn-danger" href="#0">Delete</a></td>
</tr>