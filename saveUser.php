<?php
/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

include('connect.php');

$orkutId = $_GET['orkutId'];
$openSocialId = $_GET['openSocialId'];
$name = $_GET['name'];
$datetimeVal = date("Y-m-d H:i:s",time());

mysql_query("insert into users
        (orkut_id,opensocial_id,name,register_time)
        values ('$orkutId','$openSocialId','$name','$datetimeVal')");

?>
