<?php
    
    if (isset($_SESSION))
    {

    }
    else
    {
        session_start();
    }
    $message="";
    $successMessage="";

    include "includes/config.php";

    if (isset($_POST['inserer'])){

        $id_proprio =trim(htmlspecialchars($_SESSION['id_user']));
        $typeAppart = trim(htmlentities($_POST["typeAppart"]));
        $adresseAppart = trim(htmlentities($_POST["adresseAppart"]));
        $prixAppart = trim(htmlentities($_POST["prixAppart"]));
            if (isset($_FILES['photo']) AND $_FILES['photo']['error']== 0) {
                if ($_FILES['photo']['size'] <= 5000000) {
                    $infosfichier = pathinfo($_FILES['photo']['name']);
                    $extension_upload = $infosfichier['extension'];
                    $extensions_autorisees = array('jpg', 'jpeg', 'gif', 'png', 'JPG', 'PNG', 'JPEG', 'GIF');

                    $target = "images/apparts/";
                    //                $target=$target . basename($_FILES["photo"]["name"]);
                    $rand = md5(uniqid() . rand());
                    $imgName = $rand . "." . $extension_upload;

                    if (in_array($extension_upload, $extensions_autorisees)) {
                        if (move_uploaded_file($_FILES['photo']['tmp_name'], $target . $imgName)) {
                            //Inserting data in database
//                        $fournisseur = trim(htmlentities($_POST["fournisseur"]));
                            $sql = "insert into tappart(id_proprio,typeAppart, prixAppart, adresseAppart, imageAppart) values('$id_proprio','$typeAppart', '$prixAppart', '$adresseAppart', '$imgName')";
                            if (mysqli_query($con, $sql)) {
                                $successMessage = "Enregistrement reussi";
//                        echo $successMessage;
                            } else {
                                $message = "Error occured while inserting data";
                            }
                        }
                    }
                }
            }

        

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

    <title>Great Lakes Businness</title>
	</head>

	<body>
		<div id="container">
			<div class="container-fluid" id="header">
				<?php include('includes/header.php');?>

			</div>

			<div id="menu" >
				<?php include('includes/menu.php');?>

			</div>


			<div class="container" style="margin-top:20px;">
				<div class="panel panel-default" id="content">
					<span class="page-title">Ajouter une maison</span>
					<form action="" method="post" enctype="multipart/form-data">
					<br> <br>
						<div class="row">
							<div class="col-md-4">
								Type de la maison
								<select class="form-control" name="typeAppart" id="typeAppart">
									<option value="default">--Selectionner--</option>
									<option value="A louer">A louer</option>
									<option value="A vendre">A vendre</option>
								</select>
								<!-- <input type="text" class="form-control" name="nomArticle" placeholder="Nom de l'article" required> -->
							</div>
							<div class="col-md-4">
								Adresse de la maison
								<input type="text" class="form-control" name="adresseAppart" placeholder="Adresse de la maison" required>
							</div>
							<div class="col-md-4">
								Prix de la maison
								<input type="number" class="form-control" name="prixAppart" placeholder="Prix de la maison" required>
							</div>
						</div>
					<br>
						<div class="row">
							<!-- <div class="col-md-4">
								Poids
								<input type="text" class="form-control" placeholder="Poids" name="poidsArticle" required>
							</div>

							<div class="col-md-4">
								Prix
								<input type="text" class="form-control" placeholder="Prix unitaire" name="prixUnitaire" required>
							</div>
							<div class="col-md-4">

							</div> -->
                             
                            <div class="col-md-4">
                                Image de l'article <br><br>
                                <input type="file" name="photo" accept="image/gif, image/jpeg , image/jpg, image/png" required>
                            </div>

						</div>
					<div class="row">
						<input type="submit" name="inserer" class="btn btn-info pull-right" value="Ajouter l'article">
					</div>
					</form>

					<br> <br>
					<div id="returnMessage" style="color: red; background: rgba(255, 0, 0, 0.1)">
                		<?php echo $message;?>
					</div>
					<div id="returnMessage" style="color: green; background: rgba(0, 255, 0, 0.1)">
						<?php echo $successMessage;?>
					</div>
				</div>
			</div>
			

	</body>


</html>