<?php
/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
include('connect.php');
$matchId = $_GET['matchId'];

$query = "SELECT * FROM questions";
$result_set_obj = mysql_query($query);
$result_set = mysql_fetch_array($result_set_obj);
$i=0;
?>
<form name="userPredictions">
<table border="0">
<?php
while($i<mysql_num_rows($result_set_obj)){

    //echo questions with choices
    $qid = $result_set[0];
        $choice_query = "SELECT * FROM choices where qid=$qid and match_id=$matchId";
        $choice_result_set_obj = mysql_query($choice_query);
        $choice_result_set = mysql_fetch_array($choice_result_set_obj);
        $j=0;
        ?>
        <tr ><td class="question"><b><?php echo $result_set[1]; ?></b></td></tr>
         <tr> <td> 
           <table border="0"> <tr>
        <?php while($j<mysql_num_rows($choice_result_set_obj)){
             // to display the choices in two rows
             if($j!=0 && $j%2==0) echo "</tr><tr>";
         ?>
            <td>
                <input  type="radio" name="q<?php echo $result_set[0]; ?>" value="<?php echo $choice_result_set[0]; ?>"/>
                <?php echo $choice_result_set[3]; ?>
            </td>
         <?php $choice_result_set = mysql_fetch_array($choice_result_set_obj);
            $j++;
        } ?>
        </tr>        
        </table>
        </td>
        </tr>
        <tr>
            <td>&nbsp;&nbsp;<b>Betting Amt Rs:</b>
                <select>
                    <option>10</options>
                    <option>100</options>
                    <option>1000</options>
                </select>
            </td>
        </tr>
        <tr>
            <td>
                <br>
            </td>
        </tr>
    <?php $i++;
    $result_set = mysql_fetch_array($result_set_obj);
}
?>

<tr>
    <td align="center">
        <input type="button" name="Submit" value="Submit my Bettings" onclick="submitUserBet(document.userPredictions)">
    </td>
</tr>
</table>
</form>
