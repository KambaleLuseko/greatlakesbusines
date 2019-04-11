<?php
    
        include "config.php";

        if (isset($_POST)) {
            $msg = "";
            
            $fullname  = trim(htmlentities($_POST['fullname']));
            $mail =trim(htmlentities($_POST['email'])) ;
            $phone=trim(htmlentities($_POST['phone'])) ;
            $pwd=trim(htmlentities($_POST['pwd'])) ;

            if (!filter_var($mail, FILTER_VALIDATE_EMAIL)) 
            {
                $msg = 'Adresse mail invalide';
            } else {
               $fetch_user=mysqli_query($con, "select * from tuser where mailUser='".$mail."' or phoneNumber='".$phone."'");
                if (mysqli_num_rows($fetch_user)>0)
                {
                    $msg='Adresse mail ou N° Tel déjà utilisé';
                }
                    
                else
                {
                    
                    $querry="insert into tuser(fullname, mailUser, phoneNumber, pwdUser) values ('".$fullname."', '".$mail."', '".$phone."', '".$pwd."')";
                    $sql= mysqli_query($con,$querry) or die (mysqli_error($con));

                    if ($sql) {
                        $msg='Account created';
                    }
                    else
                    {
                        $msg='Erreur du serveur';
                    }
                }
            }
            
            mysqli_close($con);
        }
        else
        {
            $msg='Data not received';
        }

		echo json_encode($msg);
		// return $msg;
?>
