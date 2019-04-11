<?php
        include "config.php";
        //Add the new data to the database.

            if(isset($_POST))
            {
                $msg = array();
                $userID=trim(htmlspecialchars($_POST['userID']));
           
               $fetch_user=mysqli_query($con, "select id_operation, fullname as nomProprio, phoneNumber, adresseAppart, prixAppart, imageAppart, typeOperation, dateOperation from toperation inner join tappart on tappart.id_appart=toperation.id_appart inner join tuser on tuser.id_user=tappart.id_proprio where id_client='".$userID."' order by id_operation desc");

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
