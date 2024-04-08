<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Retro-Quiz</title>
    <link rel="stylesheet" href="./static/css/start-style.css">
</head>
<body>
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
    <div class="container">
        <div class="logo">
            <img src="static/img/logo.png" alt="Logo">
        </div>
        <h1>Retro-Quiz</h1>
        <br>
        <a href="register.php" class="start-button">Registrieren</a>
        <a href="login.php" class="start-button">Anmelden</a>
    </div>
    <div class="sidebar">
    <h2>Rangliste</h2>
    <hr>
    <br>
    <?php foreach ($players as $player): ?>
        <p><?php echo htmlspecialchars($player['Username']); ?>: <?php echo $player['Punkte']; ?> Punkte</p>
    <?php endforeach; ?>
    </div>
</body>
</html>
