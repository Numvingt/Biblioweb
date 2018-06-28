<?php
session_start();
try {
  //connexion base
$bdd = new PDO('mysql:host=localhost;dbname=biblioweb','root','');
?>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link rel="stylesheet" type="text/css" href="style.css">
        <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
        <title> Se connecter </title>
    </head>

    <body>
        <?php include("navbar.php"); ?>
        <main>
            <?php  if (isset($_SESSION['id']) AND isset($_SESSION['login'])):
				echo 'Bonjour '. $_SESSION['login']; ?>
            </br>
            <a href="scripts/logOut.php">Logout</a>
            <?php
			   else:
				  if ((isset($_POST['login']) AND isset($_POST['password']))):
					$sanitized_nickname = filter_var($_POST['login'],FILTER_SANITIZE_STRING); //Nettoyage nickname
					$sanitized_password = filter_var($_POST['password'],FILTER_SANITIZE_STRING); //Nettoyage password
					$req = $bdd->prepare('SELECT id, password FROM user WHERE login = :login');
					$req->bindParam(':login', $sanitized_nickname, PDO::PARAM_STR);
					$req->execute();
					$result = $req->fetch();
					if(password_verify($sanitized_password,$result['password'])):
                        $_SESSION['id'] = $result['id'];
				        $_SESSION['login'] = $sanitized_nickname;
                        header('Location: ../connexion.php');
						echo 'Bonjour '. $_SESSION['login']; ?>
                </br>
                <a href="scripts/logOut.php">Logout</a>
                <?php
					else:?> Erreur dans le mot de passe
                <br/>
                <a href="connexion.php">Retour à la connexion</a>
                <?php 
					endif;
				 else :?>
                <p id="greet">Veuillez vous connecter</p>
                <form method="post" action="connexion.php">
                    Nom d'utilisateur :<br/>
                    <input type="text" name="login" /><br/> Mot de passe :<br/>
                    <input type="password" name="password" /><br/>
                    <input type="submit" name="valider" />
                </form>
                <br/>
                <a href="inscription.php">S'inscrire</a>
                <?php 
				 endif;
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
