<?php
/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

include('connect.php');

$orkutId = $_POST['orkutId'];
$openSocialId = $_POST['openSocialId'];
$name = $_POST['viewerName'];

$result_set_obj = mysql_query("select * from users where orkut_id = '$orkutId'");
if(mysql_num_rows($result_set_obj)==0){
    mysql_query("insert into users
        (orkut_id,opensocial_id,name)
        values ('$orkutId','$openSocialId','$name')");
}

?>
