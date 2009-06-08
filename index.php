<style>
.question{
    font-style:italic;
    color:red
}
</style>
<script src="scripts/zxml.js" type="text/javascript"></script>
<script src="scripts/sendRequest.js" type="text/javascript"></script>
<script>
	
	function loadThis(pageName){
		sendGetRequest(pageName,'body','');
	}
	
    
</script>

<table border=0 width="600" height="400">
	<tr>
	  <td>
		<a href="#" onClick="loadThis('betForCurrentMatches.php')">
			Bet for the match
		</a>
	  </td>
	  <td>
	   <a href="#">
		View your bettings
		</a>
	  </td>	  
	  <td>
	    <a href="#">
		Status of past bettings
		</a>
	  </td>
    </tr>
	<tr valign="top">
	 <td colspan=3 valign="top">
		<div id="body"> <?php include('betForCurrentMatches.php'); ?>
		</div>
	</tr>
</table>

