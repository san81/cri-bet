<?php
/* 
 * page to save user predictions
 */

include('connect.php');
$matchId = $_POST['matchId'];
$userID = 1;

$query = "SELECT * FROM questions";
$result_set_obj = mysql_query($query);
$result_set = mysql_fetch_array($result_set_obj);
$i=0;
?>

<?php
while($i<mysql_num_rows($result_set_obj)){
    $qid = $result_set[0];
    $userChoice = $_POST['q'.$qid];
    $betAmt = $_POST['bet'.$qid];
    $insert_query = "insert into user_bettings
        (match_id,qid,user_id,user_choice,bet_amount)
     values ($matchId,$qid,$userID,$userChoice,$betAmt)";
    echo $insert_query;
    mysql_query($insert_query);

    $i++;
    $result_set = mysql_fetch_array($result_set_obj);
}
mysql_close();
?>
Your bettins are saved. Thankyou
