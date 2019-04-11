<?php
        include "config.php";
        //Add the new data to the database.
        if(isset($_POST))
            {

                $msg = array();
                $userID=trim(htmlspecialchars($_POST['userID']));
           
               $fetch_user=mysqli_query($con, "select id_appart, fullname as nomProprio, typeAppart, prixAppart, adresseAppart, phoneNumber, imageAppart from tappart inner join tuser on tuser.id_user=tappart.id_proprio where tappart.id_proprio!='".$userID."' order by id_appart desc");

                 if (mysqli_num_rows($fetch_user) >= 1) {
                        while ($row = mysqli_fetch_assoc($fetch_user)) {
                            // echo json_encode('Logged in');
                            array_push($msg, $row);
                            // $msg[]=$row;
                     }
 //                    $msg = 'User exists';
                 } 
                 else if (mysqli_num_rows($fetch_user) <= 0) 
                 {
                     echo json_encode('No record');
                 }
            
                mysqli_close($con);
            
               echo json_encode($msg);
            }
?>
