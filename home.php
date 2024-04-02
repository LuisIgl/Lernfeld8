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
        
        h1 {
            margin-bottom: 10px;
            font-size: 50px;
            font-family: "Cabinet Grotesk Variable", sans-serif;
            text-shadow: 4px 4px 8px rgba(0, 0, 0, 0.4);
            -webkit-text-stroke: 2px black;
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
    </style>
</head>
<body>
    <div class="logo">
        <img src="static/img/logo.png" alt="Logo">
    </div>
    <div class="container">
        <h1>Hi, YourName</h1>
        <div class="category">Choose your category</div>
    </div>
    <div class="button-container">
        <div class="button">Random Category 1</div>
        <div class="button">Random Category 2</div>
    </div>
</body>
</html>
