<?php

require "database.php";


$errors = [
    "player1" => null,
    "player2" => null
];

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $player2Username = $_POST["username2"] ?? '';
    $player2Password = $_POST["password2"] ?? '';

    // Überprüfung und Anmeldung für Spieler 1
    $player1Password = $_POST["password1"]; // Definiere die Variable für das Passwort von Spieler 1
    if (empty($_POST["username1"]) || empty($_POST["password1"])) {
        $errors["player1"] = "Please fill all fields for Player 1.";
    } else {
        $statement = $conn->prepare("SELECT * FROM account WHERE username = :username LIMIT 1");
        $statement->bindParam(":username", $_POST["username1"]);
        $statement->execute();

        if ($statement->rowCount() == 0) {
            $errors["player1"] = "Player 1: Invalid credentials.";
        } else {
            $account1 = $statement->fetch(PDO::FETCH_ASSOC);

            if (!password_verify($player1Password, $account1["password"])) {
                $errors["player1"] = "Player 1: Invalid credentials.";
            } else {
                $_SESSION["player1"] = $account1; // Speichere Spieler 1 in der Session
            }
        }
    }


    // Überprüfung und Anmeldung für Spieler 2
    $player2Password = $_POST["password2"]; // Definiere die Variable für das Passwort von Spieler 2
    if (empty($player2Username) || empty($player2Password)) {
        $errors["player2"] = "Please fill all fields for Player 2.";
    } else {
        $statement = $conn->prepare("SELECT * FROM account WHERE username = :username LIMIT 1");
        $statement->bindParam(":username", $player2Username);
        $statement->execute();

        if ($statement->rowCount() == 0) {
            $errors["player2"] = "Player 2: Invalid credentials.";
        } else {
            $account2 = $statement->fetch(PDO::FETCH_ASSOC);

            if (!password_verify($player2Password, $account2["password"])) {
                $errors["player2"] = "Player 2: Invalid credentials.";
            } else {
                $_SESSION["player2"] = $account2; // Speichere Spieler 2 in der Session
            }
        }
    }

    if (is_null($errors["player1"]) && is_null($errors["player2"])) {
        // Beide Spieler erfolgreich angemeldet
        $_SESSION["multiplayer_mode"] = true;
        header("Location: home.php");
        exit;
    }
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Retro-Quiz - Login</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #EFCF5D;
        }
        * {
            font-size: 24px;
        }
        .container {
            position: relative;
            text-align: center;
            border-radius: 50px;
            padding: 30px;
            width: 500px;
            background: white;
            box-shadow: 20px 20px 50px -20px rgba(0,0,0,0.5);
            border: 2px solid rgba(0, 0, 0, 0.5);
        }

        h1 {
            margin-bottom: 10px;
            font-size: 50px;
            font-family: "Cabinet Grotesk Variable", sans-serif;
            text-shadow: 4px 4px 8px rgba(0, 0, 0, 0.4);
            -webkit-text-stroke: 2px black;
        }
        .login-button {
            background-color: #00F562;
            color: black;
            border-top: 2px solid black;
            border-bottom: 2px solid black;
            border-left: 2px solid black;
            border-right: 2px solid black;
            border-radius: 30px;
            padding: 10px 30px;
            font-size: 25px;
            font-family: "Cabinet Grotesk Variable", sans-serif;
            cursor: pointer;
            font-weight: bold;
            text-decoration: none;
            display: inline-block;
            margin-top: 20px;
        }
        .login-button:hover {
            background-color: darkred;
        }
        .logo {
            position: absolute;
            top: -120px;
            left: 50%;
            transform: translateX(-50%);
            width: 200px;
            height: 200px;
            border-radius: 50%;
        }
        .logo img {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 200px;
            height: 200px;
            object-fit: cover;
        }
        input[type="text"],
        input[type="password"] {
            width: 60%;
            padding: 10px;
            margin: auto;
            margin-top: 20px;
            border: 2px solid black;
            border-radius: 20px;
            box-sizing: border-box;
            font-size: 20px;
            display: block;
        }
        input::placeholder {
            font-size: 16px;
        }
        .error-container {
            position: absolute;
            bottom: 20%;
            width: 100%;
            display: flex;
            justify-content: center;
        }
        .error-message {
            background-color: 	 #ee4466;
            border: 2px solid black;
            float: left;
            padding: 20px 30px;
            top: 80%;
            text-align: center;
        }
        .error-message p {
            color: black;
            font-family: "Cabinet Grotesk Variable", sans-serif;
            font-size: 18px;
            font-weight: bolder;
            line-height: 20px;
            text-shadow: 1px 1px rgba(250,250,250,.3);
            margin: 0;
        }
    </style>
</head>
<body>
    <h1>Mehrspielermodus Anmeldung</h1>

    <form method="POST">
        <div>
            <h2>Spieler 1:</h2>
            <input type="text" name="username1" placeholder="Username" required>
            <input type="password" name="password1" placeholder="Password" required>
            <?php if ($errors["player1"]): ?>
                <p><?= $errors["player1"] ?></p>
            <?php endif; ?>
        </div>

        <div>
            <h2>Spieler 2:</h2>
            <input type="text" name="username2" placeholder="Username" required>
            <input type="password" name="password2" placeholder="Password" required>
            <?php if ($errors["player2"]): ?>
                <p><?= $errors["player2"] ?></p>
            <?php endif; ?>
        </div>

        <button type="submit">Anmelden</button>
    </form>
</body>
</html>
