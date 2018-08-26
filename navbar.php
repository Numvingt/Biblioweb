<nav>

    <label for="show"><span class="hamburg">&#9776;</span></label>
    <input type="checkbox" id="show">

    <ul class="menu">
        <li><a href="index.php">Accueil</a></li>
        <?php  if (isset($_SESSION['id']) AND isset($_SESSION['login'])): ?>
        <li><a href="scripts/logout.php">Se déconnecter</a></li>
        <li><a href="display.php">Bibliothèque</a></li>
        <li><a href="addBook.php">Ajouter un livre</a></li>
        <li><a href="remove.php">Supprimer un livre</a></li>
        <?php else: ?>
        <li><a href="inscription.php">S'inscrire</a></li>
        <li><a href="connexion.php">Se connecter</a></li>
        <?php endif; ?>
    </ul>

</nav>
