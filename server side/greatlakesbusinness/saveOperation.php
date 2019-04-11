<?php
    
        include "config.php";

        if (isset($_POST)) {
            $msg = "";
            
            $id_client  = trim(htmlentities($_POST['id_client']));
            $id_appart  = trim(htmlentities($_POST['id_appart']));
            $typeOperation =trim(htmlentities($_POST['typeOperation'])) ;
            $dateOperation=trim(htmlentities($_POST['dateOperation'])) ;
            $statutsAppart="";
            if($typeOperation=="Vente")
            {
                $statutsAppart="Vendu";
            }
            else if($typeOperation=="Location")
            {
                $statutsAppart="En location";
            }
                    
                    $querry="insert into toperation(id_client, id_appart, typeOperation, dateOperation) values('".$id_client."', '".$id_appart."', '".$typeOperation."', '".$dateOperation."')";
                    // $query2="update tappart set statutsAppart="
                    $sql= mysqli_query($con,$querry);

                    if ($sql) {
                        $msg='success';
                    }
                    else
                    {
                        $msg='Erreur enregistrement';
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
