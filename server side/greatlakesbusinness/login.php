<?php
        include "config.php";
        //Add the new data to the database.
        if (isset($_POST)) {
            $msg = array();
            
            $mail = trim(htmlentities($_POST['email']));
            $pwd = trim(htmlentities($_POST['pwd']));

            if (!filter_var($mail, FILTER_VALIDATE_EMAIL)) {
                $msg='Adresse mail invalide';
            } else {
                // $fetch_user = mysqli_query($con, "select * from tuser where mailUser='biems@gmail.com' and pwdUser='12'");
               $fetch_user=mysqli_query($con, "select * from tuser where mailUser='".$mail."' and pwdUser='".$pwd."'");

               if (mysqli_num_rows($fetch_user) == 1) {
                        while ($row = mysqli_fetch_assoc($fetch_user)) {
                            // echo json_encode('Logged in');
                            array_push($msg, $row);
                            // $msg[]=$row;
                     }
 //                    $msg = 'User exists';
                 } 
                 else if (mysqli_num_rows($fetch_user) <= 0) 
                 {
                     $msg='Adresse e-mail ou mot de pass incorrecte';
                 }

                 // if (mysqli_num_rows($fetch_user) == 1) {
                 //        while ($row = mysqli_fetch_array($fetch_user)) {
                 //            // echo json_encode('Logged in');
                 //            $msg=$row;
                 //     }
                 // } else if (mysqli_num_rows($fetch_user) < 1) {
                 //     $msg='Adresse e-mail ou mot de pass incorrecte';
                 // }
            }
            
            mysqli_close($con);
        }
            echo json_encode($msg);

?>
