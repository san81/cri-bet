
<?php
include('connect.php');
$todays_date = date("Y-m-d h:m:s"); 
$query = "SELECT * FROM matches where schedule_time>'$todays_date'";

$result_set_obj = mysql_query($query);
$result_set = mysql_fetch_array($result_set_obj);  
?>
<table border=0 height="100%" width="100%">
	<tr>
		  <td valign="top" width="30%">
			 <ol>
			<?php
			$i=0;
			 while($i<mysql_num_rows($result_set_obj)) {
			?>
				<li>
					<a href="#" onClick="onMatchClick(<?php echo $result_set[0]; ?>)">
					<?php echo $result_set[1]." Vs " .$result_set[2] ; ?>
					</a>
				</li>
			<?php 
			 $i++;
			 $result_set = mysql_fetch_array($result_set_obj);
			} ?>

			</ol>
		</td>
		<td>
		   <div id="matchQuestions">
				Click on the match for which you want to bet.
		   </div>
		</td>
	</tr>
</table>