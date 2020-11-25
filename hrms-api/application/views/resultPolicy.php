<?php 
$count=1;
$correct_ans=0;
$q = array();
$this->load->model('Questionnaire_model');
?>
<div class="container">
<h1 class="form-control">Your Result</h1>
<div style="background-color:#5BD49B; height:10px; width: 10px;"></div><p>Matched Answers</p>
<div style="background-color:#E597BC; height:10px; width: 10px;"></div><p>CorrectAnswers</p>
<div style="background-color:#9FCBC8; height:10px; width: 10px;"></div><p>WrongAnswers</p>

<?php 
for($i = 1; $i<=$length; $i++)
{
    if(empty($response[$i]))
    {}
    else
    {
        $q[] = $i;
        $question = $this->Questionnaire_model->fetchQuestion($i);
        ?>
        <div class="form-group" style="background-color: #9d9fa1; border-radius: 10px; text-align:justify;">
        <p class="form-control">
        <?php echo "Question:".$count;?>
        <br>
        <?php echo $question[0]->question;?>
        <?php 
        $options = explode(',',$question[0]->options);
        foreach ($options as $key=>$o)
        {
            
            if($o == $question[0]->answers){
                if($question[0]->answers == $response[$i]){
                    $correct_ans++;
                echo "<br><span style='background-color:#5BD49B;'>".($key+1).". ".$o."</span>";
                }
                else
            echo "<br><span style='background-color:#E597BC;'>".($key+1).". ".$o."</span>";
            }
            else if($o == $response[$i])
            {
                echo "<br><span style='background-color:#9FCBC8'>".($key+1).". ".$o."</span>";
            }
            else{
                echo "<br>".($key+1).". ".$o."</span>";
            }
        }
        $count++;
        ?>
        </p>
<?php
    }
}
$data['answer_attempted'] = json_encode($response);
$data['employee_id'] = $id;
$data['questions_attempted'] = implode(',',$q);
$data['answers_correct'] = $correct_ans;
$already = $this->Questionnaire_model->fetchRecord($data['employee_id']);
if($already->num_rows()>0)
{
    $this->Questionnaire_model->updateResponse($data);
}
else{
$this->Questionnaire_model->saveResponse($data);
}
?>

        </div>

</div>