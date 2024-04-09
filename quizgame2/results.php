<?php

require "database.php";

session_start();

$playerAccountNr = null;
$playerUsername = isset($_SESSION["account"]["Username"]) ? $_SESSION["account"]["Username"] : null;

if ($playerUsername) {
    try {
        $query = "SELECT AccountNr FROM Account WHERE Username = :username";
        $statement = $conn->prepare($query);
        $statement->bindParam(':username', $playerUsername);
        $statement->execute();

        if ($statement->rowCount() > 0) {
            $result = $statement->fetch(PDO::FETCH_ASSOC);
            $playerAccountNr = $result['AccountNr'];
        }
            // Entscheide, welches Bild basierend auf der AccountNr angezeigt werden soll
            if ($playerAccountNr <= 10) {
                $Top10 = "static/achievements/Top10.png"; // Pfad zum Top-10-Bild
            } else {
                $Top10 = "static/achievements/nTop10.png"; // Pfad zum anderen Bild
            }

    } catch (PDOException $e) {
        die("Datenbankfehler: " . $e->getMessage());
    }
}

?>

<script>
        localStorage.removeItem('currentPoints');
</script>

<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Retro-Quiz</title>
    <link rel="stylesheet" href="./static/css/results-style.css">
</head>
<body>

    <div class="main-container">
        <div class="game-container">
            <div class="logo">
                <a href="home.php" class="logo"><img src="static/img/logo.png" alt="logo"></a>
            </div>
                <div class="result">
                <h1>Hi, <?php echo htmlspecialchars($playerUsername); ?></h1>
                <p>Hier siehts du deine erreichten Achievements!</p>
                    <div class="achievements-container">
                        <figure>
                            <img src="<?php echo htmlspecialchars($Top10); ?>" alt="Top 10 Achievement">
                            <figcaption>Du bist unter den ersten 10 Spielern die sich angemeldet haben!</figcaption> <!-- Hier deinen Untertitel einfügen -->
                        </figure>
                        <figure>
                            <img src="<?php echo htmlspecialchars($Top10); ?>" alt="Top 10 Achievement">
                            <figcaption>Du bist unter den ersten 10 Spielern die sich angemeldet haben!</figcaption> <!-- Hier deinen Untertitel einfügen -->
                        </figure>
                    </div>
                </div>
            </div>
        </div>
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
