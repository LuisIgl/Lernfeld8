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

        if (isset($account["password"]) && !password_verify($_POST["password"], $account["password"])) {
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
            border-left: 2px solid rgba(0, 0, 0, 0.2);
            border-right: 6px solid rgba(0, 0, 0, 0.5);
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
    <div class="container">
        <div class="logo">
            <img src="static/img/logo.png" alt="Logo">
        </div>
        <h1>Retro-Quiz</h1>
        <form method="POST" action="login.php">
            <input type="text" name="username" placeholder="Username" required>
            <input type="password" name="password" placeholder="Password" required>
            <button type="submit" class="login-button">Login</button>
        </form>
    </div>
    <?php if ($error): ?>
        <div class="error-container">
            <div class="error-message">
                <p><?= $error ?></p>
            </div>
        </div>
    <?php endif ?>
</body>
</html>
