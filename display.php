<?php session_start();
try {
    //connexion base
    $bdd = new PDO('mysql:host=hhva.myd.infomaniak.com;dbname=hhva_laurentns','hhva_laurentns','MDPHERE');
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
        <?php if (isset($_POST['format'])): ?>
            <p id="greet">Livres dans votre bibliothèque</p>
            <?php
                $reponse = $bdd->prepare('SELECT * FROM livre where fk_id_user = :id_user AND fk_id_format = :format'); //sélection livre(s) de l'utilisateur
                $reponse->bindParam(':id_user',$_SESSION['id'], PDO::PARAM_INT);
                $reponse->bindParam(':format',$_POST['format'],PDO::PARAM_INT);
                $reponse->execute();
                while ($donnees = $reponse->fetch()){ 

                $req = $bdd->prepare('SELECT * FROM genre_livre WHERE id_livre = :id_livre ');//select données genre_livre pour livre
                $req->bindParam(':id_livre', $donnees['id'], PDO::PARAM_INT);
                $req->execute();
                $result = $req->fetch(); ?>
                <p>
                    <strong>Livre</strong> :
                    <?php echo $donnees['nom']; ?>
                    <br/> Année de parution :
                    <?php echo $donnees['parution']; ?>
                    <br/> Editeur :
                    <?php echo $donnees['editeur']; ?>
                    <br/> Genre du livre :
                    <?php
                    $req2 = $bdd->prepare('SELECT nom_genre FROM genre WHERE id_genre = :id_genre');
                    $req2->bindParam(':id_genre', $result['id_genre'], PDO::PARAM_INT);
                    $req2->execute();
                    while ($result2 = $req2->fetch()){ 
                    echo $result2['nom_genre'];
                    echo '</br>';
                    } ?>
                </p>
                <br/>
                <?php } ?>
                <?php $reponse->closeCursor(); ?>
                <a href="../laurentns/display.php">Retour au choix du format</a>
            <?php else: ?>
                <p id="greet">Livres dans votre bibliothèque</p>
                <?php
                    $reponse = $bdd->prepare('SELECT * FROM livre where fk_id_user = :id_user'); //sélection livre(s) de l'utilisateur
                    $reponse->bindParam(':id_user',$_SESSION['id'], PDO::PARAM_INT);
                    $reponse->execute();
                    while ($donnees = $reponse->fetch()){ 

                    $req = $bdd->prepare('SELECT * FROM genre_livre WHERE id_livre = :id_livre ');//select données genre_livre pour livre
                    $req->bindParam(':id_livre', $donnees['id'], PDO::PARAM_INT);
                    $req->execute();
                    $result = $req->fetch();
                ?>
                    <p>
                        <strong>Livre</strong> :
                        <?php echo $donnees['nom']; ?>
                        <br/> Année de parution :
                        <?php echo $donnees['parution']; ?>
                        <br/> Editeur :
                        <?php echo $donnees['editeur']; ?>
                        <br/> Genre du livre :
                        <?php
                        $req2 = $bdd->prepare('SELECT nom_genre FROM genre WHERE id_genre = :id_genre');
                        $req2->bindParam(':id_genre', $result['id_genre'], PDO::PARAM_INT);
                        $req2->execute();
                        while ($result2 = $req2->fetch()){ 
                        echo $result2['nom_genre'];
                        echo '</br>';
                        }
                    ?>
                    </p>
                    <br/>
                    <?php } ?>
                    <?php $reponse->closeCursor(); ?>
                    <p id="greet">Tri selon le format :</p>
                    <form method="post" action="display.php">
                        <ul>
                            <li>
                                <select name="format">
                                    <option value="1">Poche</option>
                                    <option value="2">Relié</option>
                                </select>
                            </li>
                            <input type="submit" name="valider" />
                        </ul>
                    </form>       
            <?php endif;?>
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