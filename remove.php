<?php 
session_start();
try {
  //connexion base
  $bdd = new PDO('mysql:host=localhost;dbname=biblioweb','root','');
  //Gérer erreur
  $bdd->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
  $reponse = $bdd->query('SELECT nom FROM livre'); //stockage résultat query
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" type="text/css" href="style.css">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
    <title> Suppression </title>
</head>

<body>
    <?php include("navbar.php"); ?>
    <main>
        <p id="greet">Veuillez entrer le titre du livre à supprimer :</p>

        <?php
				  if (isset($_POST['nom'])):
					$sanitized_name = filter_var($_POST['nom'],FILTER_SANITIZE_STRING); //Nettoyage titre livre
					$req = $bdd->prepare('DELETE FROM livre WHERE nom = :nom');
					$req->bindParam(':nom', $sanitized_name, PDO::PARAM_STR);
					$req->execute();
				 else :?>
                    <form method="post" action="remove.php">
                        <input type="text" name="nom" placeholder="Titre du livre" /><br/>
                        <input type="submit" name="valider" />
                    </form>
                    <br/>
            <?php endif;?>
        
            <p id="greet">Livres dans la bibliothèque :</p>
            <?php while ($donnees = $reponse->fetch()){ ?>
            <p>-
                <?php echo $donnees['nom']; ?>
            </p>
            <br/>
            <?php } ?>
            <?php $reponse->closeCursor();
    
              }
          catch (Exception $e)
          {
            //Si erreur, kill connection
            die('Erreur : ' . $e->getMessage());
          }
				?>

    </main>
</body>

</html>