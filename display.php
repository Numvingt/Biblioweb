<?php session_start();
try {
  //connexion base
  $bdd = new PDO('mysql:host=localhost;dbname=biblioweb','root','');
    
$reponse = $bdd->query('SELECT * FROM livre'); //stockage résultat query
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
        <p id="greet">Livres dans votre bibliothèque</p>
        <?php while ($donnees = $reponse->fetch()){ ?>
        <p>
            <strong>Livre</strong> :
            <?php echo $donnees['nom']; ?>
            <br/> Année de parution :
            <?php echo $donnees['parution']; ?> 
            <br/> Editeur :
            <?php echo $donnees['editeur']; ?> 
            <br/> Genre du livre : 
            <?php echo $donnees['genre']; ?>
        </p>
        <?php } ?>
        <?php $reponse->closeCursor(); ?>


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
