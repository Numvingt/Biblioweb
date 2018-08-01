<?php session_start();?>
<!DOCTYPE html>
<html>

<head>
    <?php include("favicon.php"); ?>
    <title>BiblioWeb</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="style.css">
    <script src="js.js" refer></script>
</head>

<body>

    <?php include("navbar.php"); ?>

    <div class="boop">

        <div id="time"></div>
        <div id="greet"></div>

        <!-- js -->

        <!-- random quote -->


        <script>
            quotes = [];
            quotes[0] = "When we feel alive I know she'll let me go.";
            quotes[1] = "Be the change that you wish to see in the world.";
            quotes[2] = "Man is the only creature who refuses to be what he is.";
            quotes[3] = "Believe those who are seeking the truth; doubt those who find it.";
            quotes[4] = "Gazing at the stars will not save you from the abyss at your feet.";
            quotes[5] = "Before enlightenment — chop wood, carry water. After enlightenment — chop wood, carry water.";

            index = Math.floor(Math.random() * quotes.length);

            // document.write("<span>" + "“ " + "</span>");
            document.write("<quote>" + "<span>" + "“ " + "</span>" + quotes[index] + "<span>" + "“ " + "</span>" + "</quote>");

        </script>

        <!-- random bg  -->
        <script>
            function randomImage() {
                var images = [
                    'img/1.jpg',
                    'img/2.jpg',
                    'img/3.jpg',
                    'img/4.jpg',
                    'img/5.jpg',
                    'img/6.jpg',
                    'img/7.jpg'
                ];
                var size = images.length;
                var x = Math.floor(size * Math.random());
                console.log(x);
                var element = document.getElementsByClassName('beep');
                console.log(element);
                element[0].style["background"] = "url(" + images[x] + ")";
            }

            document.addEventListener("DOMContentLoaded", randomImage);

        </script>

    </div>
    <div class="beep">
    </div>

</body>

</html>
