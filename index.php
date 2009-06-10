<style>
.question{
    font-style:italic;
    color:maroon
}
.statusMsg{
    font-style:italic;
    color:green;
}
.footerMsg{
    font-size:10px;
    font-style:italic;
    color:gray;
}
.mainLinks{
    font-family:sans-serif;
}
</style>

<table border=0 width="600" height="400" bgcolor="silver">
    <tr>
        <td colspan="3" class="statusMsg">
            <?php include('userEarnings.php'); ?>
        </td>
    </tr>
	<tr>
	  <td>
		<a href="#" onClick="" class="mainLinks">
			Bet for the match
		</a>
	  </td>
	  <td class="mainLinks">
	   <a href="#">
		View your bettings
		</a>
	  </td>	  
	  <td>
	    <a href="#" class="mainLinks">
		Status of past bettings
		</a>
	  </td>
    </tr>
	<tr valign="top">
	 <td colspan=3 valign="top">
		<div id="body"> <?php include('betForCurrentMatches.php'); ?>
		</div>
	</tr>
    <tr valign="bottom">
	 <td colspan=3 valign="top" class="footerMsg">
        <ul>
            <li>Bet for fun is just a virutal betting game for fun</li>
            <li>No one win or loose money. Its all just to have fun out of our cricket interest</li>
            <li>Hightest betting winner will be announsed as the Best Cricket Lover</li>
        </ul>

	</tr>
</table>

