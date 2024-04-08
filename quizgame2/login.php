<?php

  require "database.php";

  $error = null;

  if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (empty($_POST["username"]) || empty($_POST["password"])) {
      $error = "Please fill all the fields.";
    } else {
      $statement = $conn->prepare("SELECT * FROM account WHERE username = :username LIMIT 1");
      $statement->bindParam(":username", $_POST["username"]);
      $statement->execute();

      if ($statement->rowCount() == 0) {
        $error = "Invalid credentials.";
      } else {
        $account = $statement->fetch(PDO::FETCH_ASSOC);

        if (isset($account["username"]) && !password_verify($_POST["password"], $account["password"])) {
          $error = "Invalid credentials.";
        } else {
          session_start();

          unset($account["password"]);

          $_SESSION["account"] = $account;

          header("Location: home.php");
        }
      }
    }
  }
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Retro-Quiz - Login</title>
    <link rel="stylesheet" href="./static/css/login-style.css">
</head>
<body>
    <?php

    require "database.php";

    try {
        $query = "SELECT username, Punkte FROM Account ORDER BY Punkte DESC";
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
        <form method="POST" action="login.php">
            <input type="text" name="username" placeholder="Username" required>
            <input type="password" name="password" placeholder="Password" required>
            <button type="submit" class="login-button">Anmelden</button>
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
        <p><?php echo htmlspecialchars($player['username']); ?>: <?php echo $player['Punkte']; ?> Punkte</p>
    <?php endforeach; ?>
    </div>
</body>
</html>
