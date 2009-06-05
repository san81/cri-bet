<?php
/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
include('connect.php');


$query = "SELECT viewer_id,opensocial_id,viewer_name,datetime FROM ipl_predictions where viewer_id!=''";
$result_set_obj = mysql_query($query);
$result_set = mysql_fetch_array($result_set_obj);
$i=0;

while($i<mysql_num_rows($result_set_obj)){
    $orkut_id = $result_set[0];
    $opensocial_id = $result_set[1];
    if($opensocial_id=='') $opensocial_id.=$orkut_id;
    $name = $result_set[2];
    $reg_time = $result_set[3];   
    echo mysql_query("insert into users
        (orkut_id,opensocial_id,name,register_time)
        values ('$orkut_id','$opensocial_id','$name','$reg_time')");
   $i++;
   $result_set = mysql_fetch_array($result_set_obj);
}

mysql_close();
?>
