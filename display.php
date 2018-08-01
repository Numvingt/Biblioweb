<?php session_start();
try {
    //connexion base
    $bdd = new PDO('mysql:host=localhost;dbname=biblioweb','root','');
    
    $reponse = $bdd->query('SELECT * FROM livre'); //stockage résultat query
        while ($donnees = $reponse->fetch()){ 
                       
        $req = $bdd->prepare('SELECT * FROM genre_livre WHERE id_livre = :id_livre ');
        $req->bindParam(':id_livre', $donnees['id'], PDO::PARAM_INT);
        $req->execute();
        $result = $req->fetch();
            
    ?>
    <!DOCTYPE html>
<html lang="en">

    <head>
        <?php include("favicon.php"); ?>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="style.css">
        <title> Bibliothèque </title>
    </head>

    <body>
        <?php include("navbar.php"); ?>
        <main>
            <p id="greet">Livres dans votre bibliothèque</p>
            <p>
                <strong>Livre</strong> :
                <?php echo $donnees['nom']; ?>
                <br/> Année de parution :
                <?php echo $donnees['parution']; ?>
                <br/> Editeur :
                <?php echo $donnees['editeur']; ?>
                <br/> Genre du livre :
            <?php
                $req2 = $bdd->prepare('SELECT nom_genre FROM genre WHERE id_genre = :id_genre ');
				$req2->bindParam(':id_genre', $result['id_genre'], PDO::PARAM_INT);
				$req2->execute();
				$result2 = $req2->fetch();
                echo $result2['nom_genre'];
                echo '</br>';
            ?>

            </p>
            <br/>
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