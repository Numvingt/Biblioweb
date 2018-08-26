<?php 
session_start();
try {
  //connexion base
    $bdd = new PDO('mysql:host=hhva.myd.infomaniak.com;dbname=hhva_laurentns','hhva_laurentns','MDPHERE');
//Gérer erreur
$bdd->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
//$reponse = $bdd->query('SELECT id,nom FROM livre'); //stockage résultat query
$reponse = $bdd->prepare('SELECT * FROM livre where fk_id_user = :id_user'); //stockage résultat query
$reponse->bindParam(':id_user',$_SESSION['id'], PDO::PARAM_INT);
$reponse->execute();
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
        <?php if (!isset($_SESSION['id']) AND !isset($_SESSION['login'])): ?>
            <p id="greet">Page innaccessible, veuillez vous connecter</p>
        <?php else :?>
            <p id="greet">Veuillez entrer le numéro du livre à supprimer :</p>
            <?php
                      if (isset($_POST['id'])):
                        $req = $bdd->prepare('DELETE FROM livre WHERE id = :id');
                        $req->bindParam(':id', $_POST['id'], PDO::PARAM_INT);
                        $req->execute();
                        header('Location: ../laurentns/remove.php');
                     else :?>
                        <form method="post" action="remove.php">
                            <input type="number" name="id" placeholder="Numéro du livre" /><br/>
                            <input type="submit" name="valider" />
                        </form>
                        <br/>
                <?php endif;?>

                <p id="greet">Livres dans votre bibliothèque :</p>
                <?php while ($donnees = $reponse->fetch()){ ?>
                <p>
                    <?php echo $donnees['id'] .' => '. $donnees['nom']; ?>
                </p>
                <br/>
                <?php } ?>
                <?php $reponse->closeCursor();
            endif;
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