<?php

require "database.php";

$error = null;

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (empty($_POST["username"]) || empty($_POST["password"])) {
        $error = "Please fill all the fields.";
    } else {
        $statement = $conn->prepare("SELECT * FROM account WHERE username = :username");
        $statement->bindParam(":username", $_POST["username"]);
        $statement->execute();

        if ($statement->rowCount() > 0) {
            $error = "This username is taken.";
        } else {
            $conn
                ->prepare("INSERT INTO account (username, password) VALUES (:username, :password)")
                ->execute([
                    ":username" => $_POST["username"],
                    ":password" => password_hash($_POST["password"], PASSWORD_BCRYPT),
                ]);

            $statement = $conn->prepare("SELECT * FROM account WHERE username = :username LIMIT 1");
            $statement->bindParam(":username", $_POST["username"]);
            $statement->execute();
            $user = $statement->fetch(PDO::FETCH_ASSOC);

            session_start();

            unset($user["Password"]);

            $_SESSION["account"] = $user;

            header("Location: home.php");
            exit();
        }
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Retro-Quiz - Register</title>
    <link rel="stylesheet" href="./static/css/register-style.css">
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
    <form method="POST" action="register.php">
        <input type="text" name="username" placeholder="Username" required>
        <input type="password" name="password" placeholder="Password" required>
        <button type="submit" class="register-button">Registrieren</button>
    </form>
</div>
<?php if ($error): ?>
    <div class="error-container">
        <div class="error-message">
            <p><?= $error ?></p>
        </div>
    </div>
<?php endif ?>
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
