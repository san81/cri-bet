<?php
/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/*
 * User earned amount calculations.
 */
include('connect.php');
$userID=$_POST['orkutId'];

$user_participation = mysql_query("select count(*) from user_bettings where user_id='$userID'");
$user_bettings_count = mysql_fetch_array($user_participation);
echo "You are participated in <b>".$user_bettings_count[0]."</b> bettings<br>";
$user_bettings_obj = mysql_query("select match_id, qid, user_choice,
	bet_amount from user_bettings where user_id = '$userID'");
$j=0;
$earnedAmount = 0;
$row = mysql_fetch_array($user_bettings_obj);
while($j<mysql_num_rows($user_bettings_obj)){
    $answer = mysql_query("select answer from answers where match_id=$row[0] and qid=$row[1]");
    $answer_row = mysql_fetch_array($answer);
    if($row[2] == $answer_row[0]){
        $earnedAmount = $earnedAmount + $row[3];
    }else{
        $earnedAmount = $earnedAmount - $row[3];
    }

    $j++;
    $row = mysql_fetch_array($user_bettings_obj);
}

 echo "Amount earned by you: <b>".$earnedAmount."</b>";
?>
