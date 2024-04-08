<?php

require "database.php";

session_start();
$statement = $conn->prepare("SELECT * FROM kategorie ORDER BY RAND() LIMIT 2");
$statement->execute();

?>

<script>
        localStorage.removeItem('currentPoints');
</script>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Retro-Quiz - Home</title>
    <link rel="stylesheet" href="./static/css/home-style.css">
</head>
<body>
    <div class="logo">
        <img src="static/img/logo.png" alt="Logo">
    </div>
    <div class="container">
        <h1>Hi, <?php print_r($_SESSION["account"]["Username"]);?></h1>
        <div class="category">Choose your category</div>
    </div>
    <div class="button-container">
    <?php
        if ($statement->rowCount() == 0) {
            echo "keine Kategorien verfügbar.";
        } else {
            while ($categories = $statement->fetch(PDO::FETCH_ASSOC)) {
                $categoryName = $categories['Kategorie'];
                echo "<a href='game.php?category_name=$categoryName'><div class='button'>$categoryName</div></a>";
            }
        }
    ?>
    </div>
    <div class="sidebar">
    <?php

    require "database.php";

    try {
        $query = "SELECT Username, Punkte FROM Account ORDER BY Punkte DESC";
        $statement = $conn->prepare($query);
        $statement->execute();

        $players = $statement->fetchAll(PDO::FETCH_ASSOC);
    } catch (PDOException $e) {
        die("Datenbankfehler: " . $e->getMessage());
    }

    ?>
    <h2>Rangliste</h2>
    <hr>
    <br>
    <?php foreach ($players as $player): ?>
        <p><?php echo htmlspecialchars($player['Username']); ?>: <?php echo $player['Punkte']; ?> Punkte</p>
    <?php endforeach; ?>
    </div>
</body>
</html>
