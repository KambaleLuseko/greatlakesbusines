
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
                                Image de la maison <br><br>
                                <input type="file" name="photo" accept="image/gif, image/jpeg , image/jpg, image/png" required>
                            </div>

						</div>
					<div class="row">
						<input type="submit" name="inserer" class="btn btn-info pull-right" value="Ajouter la maison">
					</div>
					</form>

					<br> <br>
				</div>
			</div>
			

	</body>


</html>