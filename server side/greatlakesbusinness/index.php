<?php

    session_start();


    if (isset($_SESSION["mailUser"]) && !empty($_SESSION["mailUser"]))
    {
        header("location:newMaison.php");
    }
    else
    {

    }

    include "includes/config.php";
    //Add the new data to the database.
    if (isset($_POST['submit'])) {
        $mail = trim(htmlentities($_POST['username']));
        $pwd = trim(htmlentities($_POST['pwd']));

        if (!filter_var($mail, FILTER_VALIDATE_EMAIL)) {
            echo '<script>alert("Adresse mail invalide");</script>';
        }
        else
        {
                $fetch_user=$con->query("select * from tuser where mailUser='$mail' and pwdUser='$pwd'") or die($con->error());
                if ($fetch_user->num_rows==1)
                {
                    $row=mysqli_fetch_array($fetch_user);
                    $_SESSION["mailUser"]=$row["mailUser"];
                    $_SESSION["fullname"]=$row["fullname"];
                    $_SESSION["id_user"]=$row["id_user"];
                    $_SESSION["profile"]='images/profile/'.$row["profile"];
                    header("location:newMaison.php");
                }
                else
                {
                    echo '<script>alert("Adresse mail ou mot de passe incorrect");</script>';
                }
        }

        mysqli_close($con);
    }

?>






<!doctype html>
	<head>
		<link rel="stylesheet" href="css/style.css" />
		<link rel="stylesheet" href="css/bootstrap.css">
		<script src="js/jquery.js"></script>
		<script src="js/menu.js"></script>

		<meta name="viewport" content="width=device-width, initial-scale=1"/>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <title>Great Lakes Business</title>
	</head>

	<body background="images/back.jpg">
		<div id="container">

			<div class="container-fluid" id="header">
				<div class="container-fluid" id="contact-bar">
					<div class="col-md-6" style="font-size:35px; color:white; text-align:left"><span style="font-weight:bold">Great Lakes</span> Business</div>
					<span class="col-md-6" style="text-align:right; margin-top:20px;">
						<!-- <span>Contact us !</span> -->
						<span><img class="icon" src="./images/call.png" alt="call"> <span class="contact">+243 9 95 78 12 49</span></span>
						<span><img class="icon" src="./images/whatsap.png" alt="whatsapp"> <span class="contact">+243 84 01 72 420</span></span>

						<span><img class="icon" src="./images/facebook.png" alt="call"> <span class="contact">Great Lakes Business</span></span>
						<span><img class="icon" src="./images/twitter.png" alt="whatsapp"> <span class="contact">@greatlakesbusiness</span></span>
						<!-- <span><img class="icon" src="./images/youtube.png" alt="call"> <span class="contact">Great Lakes Business</span></span> -->
					</span>
				</div>

			</div>

			<span></span>
			
			<br><br>
                    <div class="col-md-4 center-block" id="divLogin">
                        <img src="images/logicon.png" alt="login-icon" id="logIcon"><br>
                        <span style="width: 100%; text-align: center; display: block; color: white; font-size: 18px;"><a class="movePage" href="">Login   </a>    |    <a class="movePage" href="register.php">Register</a></span>
                        <br><p style="text-align: center; color:white;">Enter your credentials to log in</p><br>
                        <form action="index.php" method="post" enctype="multipart/form-data" autocomplete="off">
                            <input style="height: 50px" name="username" type="email" class="form-control" placeholder="Adresse mail" required><br><br>
                            <input style="height: 50px" name="pwd" type="password" class="form-control" placeholder="Mot de passe" required><br><br>
                            <input type="submit" name="submit" style="width: 120px" class="btn btn-info center-block" value="Login">
                        </form>
                    </div>


			
	</body>


</html>