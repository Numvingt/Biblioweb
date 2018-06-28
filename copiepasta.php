<?php
session_start();

try {
  //connexion base
  $bdd = new PDO('mysql:host=localhost;dbname=test','root','');
  //Gérer erreur
  $bdd->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

//si aucune erreur
$reponse = $bdd->query('SELECT * FROM jeux_video ORDER BY nom LIMIT 0,5'); //stockage résultat query
$reponse2 = $bdd->query('SELECT nom,prix FROM jeux_video ORDER BY prix LIMIT 0, 5'); //limit tronque résultat, commence 0 et prend 10 enregistrements

$today= date("d/m/Y");
$time = date("G:i T");

?>
<!DOCTYPE html>
<html>
    <head>
        <title>ESIG Accueil</title>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
        <script src="https://use.fontawesome.com/e064ae86ba.js"></script>
        <link rel="stylesheet" type="text/css" href="style.css">
   </head>
    <body>
      <?php include("includes/mainMenu.php"); ?>
        <main>
          <p>
          <?php
          if (isset($_SESSION['nickname'])): //Si user co
            echo 'Bonjour '. $_SESSION['nickname'];
          //elseif (isset($_COOKIE['prenom'])): //si cookie existe
            //echo 'Bonjour '. $_COOKIE['prenom'];
          else:
            echo 'Bonjour';
          endif;?>, nous sommes le
            <?php echo $today ?>
            <br/>
            Il est
            <?php echo $time ?>
            <br/>
            La page a été vue
            <?php include("includes/counter.php"); ?>
             fois
          </p>

            <?php while ($donnees = $reponse2->fetch()){ ?>
              <?php echo $donnees['nom'] . ' coûte ' . $donnees['prix'] . ' EUR<br/>';?>
            <?php } ?>
            <?php $reponse2->closeCursor(); ?>
            <br/>

            <?php
            if (isset($_POST['prix']) AND ($_POST['prix']>=0)):
              $req = $bdd->prepare('SELECT nom, prix FROM jeux_video WHERE prix <= :prixMax');
              $req->bindParam(':prixMax', $_POST['prix'], PDO::PARAM_INT); //Vérification type prixMax
              $req->execute();
              echo '<ul>';
              while ($donnees = $req->fetch()){
                echo '<li>' . $donnees['nom'] . ' (' . $donnees['prix'] . ' EUR)</li>';
              }
              echo '</ul>';
              $req->closeCursor();
            else: ?>
              <p>Veuillez saisir un prix</p>
              <form method="post" action="index.php">
                <input type="text" name="prix"/>
                <input type="submit" name="valider"/>
              </form>
          <?php endif; ?>
          <?php
          if(isset($_POST['nom'])):
            $req = $bdd->prepare('INSERT INTO jeux_video(nom, possesseur, console, prix, nbre_joueurs_max, commentaires) VALUES(:nom,:possesseur,:console,:prix,:nbre_joueurs_max,:commentaires)');
            $req->bindParam(':nom', $_POST['nom'], PDO::PARAM_STR);
            $req->bindParam(':possesseur', $_POST['possesseur'], PDO::PARAM_STR);
            $req->bindParam(':console', $_POST['console'], PDO::PARAM_STR);
            $req->bindParam(':prix', $_POST['prix'], PDO::PARAM_INT);
            $req->bindParam(':nbre_joueurs_max', $_POST['nbre_joueurs_max'], PDO::PARAM_INT);
            $req->bindParam(':commentaires', $_POST['commentaires'], PDO::PARAM_STR);
            $req->execute();
            echo 'Le jeu a bien été ajouté';
          else: ?>
          <br/>
          <p>Veuillez saisir les informations pour le jeu</p>
          <form method="post" action="index.php">
            <ul>
              <li><input type="text" name="nom" placeholder="Nom"/></li>
              <li><input type="text" name="possesseur" placeholder="Possesseur"/></li>
              <li><input type="text" name="console" placeholder="Console"/></li>
              <li><input type="text" name="prix" placeholder="Prix"/></li>
              <li><input type="text" name="nbre_joueurs_max" placeholder="Nombre joueurs max"/></li>
              <li><input type="text" name="commentaires" placeholder="Commentaires"/></li>
              <input type="submit" name="valider"/>
            </ul>
          </form>
        <?php endif; ?>
          <?php
          }
          catch (PDOException $e)
          {
            echo '<pre>';
            echo $req;
            echo '</pre>';
            echo $e->getMessage();
            die;
            //Si erreur, kill connection
            //die('Erreur : ' . $e->getMessage());
          }
          ?>
        </main>
        <?php include("includes/footer.php"); ?>
    </body>
</html>
