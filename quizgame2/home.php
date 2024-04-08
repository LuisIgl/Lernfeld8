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
            position: absolute;
            top: 15%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 400px;
            text-align: center;
            border-radius: 50px;
            padding: 30px;
            background: white;
            box-shadow: 20px 20px 50px -20px rgba(0,0,0,0.5);
            border: 2px solid rgba(0, 0, 0, 0.5); 
        }

        .sidebar {
            position: fixed;
            right: 0;
            top: 0;
            padding: 30px;
            padding-top: 10px;
            width: 25%;
            height: 100%;
            font-family: "Cabinet Grotesk Variable", sans-serif;
            background: rgba(255, 255, 255, 0.4);
            z-index: 1; /* Unter dem Hauptcontainer */
            text-align: center;
        }

        h1 {
            margin-bottom: 10px;
            font-size: 50px;
            font-family: "Cabinet Grotesk Variable", sans-serif;
            text-shadow: 4px 4px 8px rgba(0, 0, 0, 0.4);
            -webkit-text-stroke: 2px black;
        }

        h2 {
            margin-bottom: 10px;
            font-size: 40px;
            font-family: "Cabinet Grotesk Variable", sans-serif;
        }

        .category {
            background-color: #F0E939;
            font-family: "Cabinet Grotesk Variable", sans-serif;
            -webkit-text-stroke: 1px black;
            color: black;
            border: 2px solid black;
            border-radius: 5px; 
            padding: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
            margin-top: 20px;
        }
        
        .button {
            background-color: #2098BE;
            height: 150px;
            width: 300px;
            font-family: "Cabinet Grotesk Variable", sans-serif;
            -webkit-text-stroke: 1px black;
            color: black;
            border: 2px solid black; 
            border-radius: 10px;
            padding: 10px 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
            cursor: pointer;
            margin: 10px;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .button:hover {
            background-color: #75bed5;
            color: black;
            border-color: black;
            cursor: pointer;
        }

        .button-container {
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .logo {
            position: absolute;
            top: 20px;
            left: 20px;
            width: 40px;
            height: 100px;
        }
        .logo img {
            width: 150px; 
            height: 150px;
        }
        a {
          text-decoration: none;
        }
    </style>
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
