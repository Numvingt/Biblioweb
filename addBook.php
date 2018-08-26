<?php 
session_start();
try {
  //connexion base
$bdd = new PDO('mysql:host=hhva.myd.infomaniak.com;dbname=hhva_laurentns','hhva_laurentns','MDP');
  //Gérer erreur
  $bdd->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

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
    <title> Ajout de livre </title>
</head>

<body>
    <?php include("navbar.php"); ?>
    <main>
        <?php if (!isset($_SESSION['id']) AND !isset($_SESSION['login'])): ?>
            <p id="greet">Page innaccessible, veuillez vous connecter</p>
        <?php else: ?>
        <?php
          if(isset($_POST['nom'])):
            if($_POST['genre1']==$_POST['genre2']):
                echo 'Les deux genres ne peuvent être similaires';
                echo '<br/>';
                echo '<a href="addBook.php">OK</a>';
            else:
                $sanitized_nom = filter_var($_POST['nom'],FILTER_SANITIZE_STRING);
                $sanitized_parution = filter_var($_POST['parution'],FILTER_SANITIZE_STRING);
                $sanitized_editeur = filter_var($_POST['editeur'],FILTER_SANITIZE_STRING);
                $req = $bdd->prepare('INSERT INTO livre(nom, parution, editeur,fk_id_format,fk_id_user) VALUES(:nom,:parution,:editeur,:fk_id_format,:fk_id_user)');
                $req->bindParam(':nom', $sanitized_nom, PDO::PARAM_STR);
                $req->bindParam(':parution', $sanitized_parution, PDO::PARAM_STR);
                $req->bindParam(':editeur', $sanitized_editeur, PDO::PARAM_STR);
                $req->bindParam(':fk_id_format',$_POST['format'], PDO::PARAM_INT);
                $req->bindParam(':fk_id_user',$_SESSION['id'], PDO::PARAM_INT);
                $req->execute();
    
                $req = $bdd->prepare('SELECT id FROM livre WHERE nom = :nom'); //Stockage de l'id du livre ajouté
				$req->bindParam(':nom', $sanitized_nom, PDO::PARAM_STR);
				$req->execute();
				$result = $req->fetch();
    
                $req = $bdd->prepare('INSERT INTO genre_livre(id_livre,id_genre)VALUES(:id,:idgenre)'); //Utilisation id
                $req->bindParam(':id', $result['id'], PDO::PARAM_INT);
                $req->bindParam(':idgenre', $_POST['genre1'], PDO::PARAM_INT);
                $req->execute();
    
                $req = $bdd->prepare('INSERT INTO genre_livre(id_livre,id_genre)VALUES(:id,:idgenre)'); //Utilisation id
                $req->bindParam(':id', $result['id'], PDO::PARAM_INT);
                $req->bindParam(':idgenre', $_POST['genre2'], PDO::PARAM_INT);
                $req->execute();
    
                echo 'Le livre a bien été ajouté';
                echo '<br/>';
                echo '<a href="addBook.php">OK</a>';
            endif;
          else: ?>
            <br/>
            <p id="greet">Veuillez saisir les informations pour le livre</p>
            <form method="post" action="addBook.php">
                <ul>
                    <li><input type="text" name="nom" placeholder="Nom" /></li>
                    <li><input type="text" name="parution" placeholder="Année parution" /></li>
                    <li><input type="text" name="editeur" placeholder="Editeur" /></li>
                    <li>
                        <select name="genre1">
                            <option value="1">Bandes dessinées</option>
                            <option value="2">Cuisine et Vins</option>
                            <option value="3">Horreur</option>
                            <option value="4">Humour</option>
                            <option value="5">Jeunesse</option>
                            <option value="6">Littérature</option>
                            <option value="7">Mythes et Légendes</option>
                            <option value="8">Poésie</option>
                            <option value="9">Policier</option>
                            <option value="10">Science-fiction</option>
                            <option value="11">Suspense</option>
                            <option value="12">Théâtre</option>
                        </select>
                    </li>
                    <li>
                        <select name="genre2">
                            <option value="1">Bandes dessinées</option>
                            <option value="2">Cuisine et Vins</option>
                            <option value="3">Horreur</option>
                            <option value="4">Humour</option>
                            <option value="5">Jeunesse</option>
                            <option value="6">Littérature</option>
                            <option value="7">Mythes et Légendes</option>
                            <option value="8">Poésie</option>
                            <option value="9">Policier</option>
                            <option value="10">Science-fiction</option>
                            <option value="11">Suspense</option>
                            <option value="12">Théâtre</option>
                        </select>
                    </li>
                    <li>
                        <select name="format">
                            <option value="1">Poche</option>
                            <option value="2">Relié</option>
                        </select>
                    </li>
                    <input type="submit" name="valider" />
                </ul>
            </form>
            <?php endif; ?>
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
