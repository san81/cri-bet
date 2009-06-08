<?php
/*
 * page to save user predictions
 */

include('connect.php');
$matchId = $_POST['matchId'];
$userID = $_POST['orkutId'];

$query = "SELECT * FROM questions";
$result_set_obj = mysql_query($query);
$result_set = mysql_fetch_array($result_set_obj);
$i=0;
$saveOrUpdated = 'save';
?>

<?php
while($i<mysql_num_rows($result_set_obj)){
    $qid = $result_set[0];
    $userChoice = $_POST['q'.$qid];
    $betAmt = $_POST['bet'.$qid];
    $record_already_exist_rs =
      mysql_query("select * from user_bettings where match_id=$matchId and qid=$qid and user_id='$userID'");
      if(mysql_num_rows($record_already_exist_rs)==0) {
        $insert_query = "insert into user_bettings
            (match_id,qid,user_id,user_choice,bet_amount)
         values ($matchId,$qid,$userID,$userChoice,$betAmt)";
        mysql_query($insert_query);
        
      }else{
          //user already made betting, so this time just update his previouse bettings.
          $saveOrUpdated = 'update';
          $update_query = "update user_bettings set user_choice=$userChoice,bet_amount=$betAmt
                where match_id=$matchId and qid=$qid and user_id='$userID'";
        mysql_query($update_query);
      }

    $i++;
    $result_set = mysql_fetch_array($result_set_obj);
}
mysql_close();

if($saveOrUpdated=='save')
    echo "Your bettins are saved. Thankyou";
else
    echo "Your bettins are updated. Thankyou";
?>