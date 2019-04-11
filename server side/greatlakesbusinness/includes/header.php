<?php
    if (isset($_SESSION))
    {

    }
    else
    {
        session_start();
    }
?>
<div>
	<div class="container-fluid" id="contact-bar">
		<div class="col-md-7" style="font-size:35px; color:white; text-align:left"><span id="show_menu"><img style="width:30px; cursor:pointer" src="./images/menu.png" alt=""></span> <span style="font-weight:bold">Great Lakes</span> Business</div>
		<span class="col-md-5" style="text-align:right; margin-top:20px;">
						<span>Contact us !</span>
						<span><img class="icon" src="./images/call.png" alt="call"> <span class="contact">+243 9 95 78 12 49</span></span>
						<span><img class="icon" src="./images/whatsap.png" alt="whatsapp"> <span class="contact">+243 84 01 72 420</span></span>

						<span><img class="icon" src="./images/facebook.png" alt="call"> <span class="contact">Great Lakes Business</span></span>
					</span>
	</div>
	
</div>

<?php
    if (isset($_SESSION["mailUser"]) && !empty($_SESSION["mailUser"]))
    {

    }
    else
    {
        header("location:index.php");
    }
?>
