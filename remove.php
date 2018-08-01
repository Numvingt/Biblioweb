<?php 
session_start();
try {
  //connexion base
  $bdd = new PDO('mysql:host=localhost;dbname=biblioweb','root','');
  //Gérer erreur
  $bdd->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
  $reponse = $bdd->query('SELECT id,nom FROM livre'); //stockage résultat query
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <?php include("favicon.php"); ?>
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
        <p id="greet">Veuillez entrer le numéro du livre à supprimer :</p>

        <?php
				  if (isset($_POST['id'])):
					$req = $bdd->prepare('DELETE FROM livre WHERE id = :id');
					$req->bindParam(':id', $_POST['id'], PDO::PARAM_INT);
					$req->execute();
                    header('Location: ../remove.php');
				 else :?>
                    <form method="post" action="remove.php">
                        <input type="number" name="id" placeholder="Numéro du livre" /><br/>
                        <input type="submit" name="valider" />
                    </form>
                    <br/>
            <?php endif;?>
        
            <p id="greet">Livres dans la bibliothèque :</p>
            <?php while ($donnees = $reponse->fetch()){ ?>
            <p>
                <?php echo $donnees['id'] .' => '. $donnees['nom']; ?>
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