<?php 
session_start();
try {
  //connexion base
  $bdd = new PDO('mysql:host=localhost;dbname=biblioweb','root','');
  //Gérer erreur
  $bdd->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" type="text/css" href="style.css">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
    <title> Title </title>
</head>

<body>
    <?php include("navbar.php"); ?>
    <main>

        <?php
          if(isset($_POST['nom'])):
            $req = $bdd->prepare('INSERT INTO livre(nom, parution, editeur, genre) VALUES(:nom,:parution,:editeur,:genre)');
            $req->bindParam(':nom', $_POST['nom'], PDO::PARAM_STR);
            $req->bindParam(':parution', $_POST['parution'], PDO::PARAM_STR);
            $req->bindParam(':editeur', $_POST['editeur'], PDO::PARAM_STR);
            $req->bindParam(':genre', $_POST['genre'], PDO::PARAM_INT);
            $req->execute();
            echo 'Le livre a bien été ajouté';
          else: ?>
            <br/>
            <p>Veuillez saisir les informations pour le jeu</p>
            <form method="post" action="addBook.php">
                <ul>
                    <li><input type="text" name="nom" placeholder="Nom" /></li>
                    <li><input type="text" name="parution" placeholder="Année parution" /></li>
                    <li><input type="text" name="editeur" placeholder="Editeur" /></li>
                    <li><input type="text" name="genre" placeholder="Genre" /></li>
                    <input type="submit" name="valider" />
                </ul>
            </form>
            <?php endif; ?>
            <?php 
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
