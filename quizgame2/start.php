<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Retro-Quiz</title>
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
        .start-button {
            background-color: #FF3737;
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
        }
        .start-button:hover {
            background-color: darkred;
        }

        a {
          text-decoration: none;
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
    </style>
</head>
<body>
    <div class="container">
        <div class="logo">
            <img src="static/img/logo.png" alt="Logo">
        </div>
        <h1>Retro-Quiz</h1>
        <br>
        <a href="register.php" class="start-button">Registrieren</a>
        <a href="login.php" class="start-button">Anmelden</a>
    
    </div>
</body>
</html>
