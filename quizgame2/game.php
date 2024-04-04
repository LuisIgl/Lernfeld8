<?php
require "database.php";
session_start();

if(isset($_GET['category_name'])) {
    $category_name = $_GET['category_name'];

    $statement = $conn->prepare("SELECT * FROM kategorie WHERE Kategorie = ? LIMIT 1");
    $statement->execute([$category_name]);
    $category = $statement->fetch(PDO::FETCH_ASSOC);

    if($category) {
        $category_id = $category['KategorieNr'];

        $statement_question = $conn->prepare("SELECT * FROM fragen WHERE KategorieNr = ? LIMIT 1");
        $statement_question->execute([$category_id]);
    
        $question = $statement_question->fetch(PDO::FETCH_ASSOC);

        if($question) {
            $question_text = $question['Frage'];

            $statement_answers = $conn->prepare("SELECT * FROM antworten WHERE FragenNr = ?");
            $statement_answers->execute([$question['FragenNr']]);
    
            $answers = $statement_answers->fetchAll(PDO::FETCH_ASSOC);
        } else {
            $question_text = "Keine Fragen für diese Kategorie gefunden.";
            $answers = [];
        }
    } else {
        $question_text = "Keine richtige Kategorie ausgewählt.";
        $answers = [];
    }
} else {
    $question_text = "Keine Kategorie ausgewählt.";
    $answers = [];
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
<script>
        function selectAnswer(isCorrect, answerId) {
            var pointsElement = document.getElementById('points');
            var currentPoints = parseInt(pointsElement.textContent);

            if (isCorrect) {
                currentPoints += 50;
            }

            pointsElement.textContent = currentPoints;

            var answerButtons = document.querySelectorAll('.answer');
            var selectedButton = document.getElementById('answer_' + answerId);
            
            answerButtons.forEach(function(button) {
                var isCorrectAnswer = button.getAttribute('data-correct') === '1';
                
                if (isCorrectAnswer) {
                    button.style.backgroundColor = '#00F562';
                } else {
                    button.style.backgroundColor = '#FF3737';
                }
                
                button.onclick = null;
            });

            selectedButton.style.backgroundColor = isCorrect ? '#4CAF50' : '#FF3737';

            document.getElementById('next-button-container').style.display = 'block';
        }
    </script>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Game</title>
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

        .main-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            width: 100%;
            margin: 0 auto;
        }
        .game-container {
            text-align: center;
            width: 35%;
        }
        .question-box {
            background-color: #FAEDB7;
            padding: 20px;
            margin-bottom: 10%;
            font-family: "Cabinet Grotesk Variable", sans-serif;
            -webkit-text-stroke: 1px black;
        }
        .category {
            background-color: #2098BE;
            font-family: "Cabinet Grotesk Variable", sans-serif;
            -webkit-text-stroke: 1px black;
            width: 30%;
            color: black;
            border: 2px solid black;
            border-radius: 5px; 
            padding: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
            margin-top: 2%;
            margin-bottom: 3%;
            display: inline-block;
        }
        .answers-container {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            grid-gap: 10px;
            margin: 0 auto;
            margin-bottom: 3%;
            margin-top: 3%;
            margin-left: 10%;
        }

        .answer {
            width: 55%;
            background-color: #F03986;
            border: 2px solid #000;
            border-radius: 10px;
            padding: 20px;
            margin: 5px;
            margin-top: 1%;
            cursor: pointer;
            font-size: 20px;
            font-family: "Cabinet Grotesk Variable", sans-serif;
            -webkit-text-stroke: 1px black;
        }
        .answer:hover {
            background-color: #F0C419;
            color: white;
            border-color: #F0C419;
            cursor: pointer;
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
        .question-status {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            margin-bottom: 10px;
        }
        .punkte{
          margin-right: 10px; 
        }
        .fragen {
          margin-left: 10px;
        }

        .start-button {
            background-color: #ffe28a;
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
            text-decoration: none;
            font-weight: bold;
            margin-top: -2%;
        }
        .start-button:hover {
            background-color: darkred;
        }
    </style>
</head>
<body>
    <div class="main-container">
        <div class="game-container">
                <div class="logo">
                    <img src="static/img/logo.png" alt="Logo">
                </div>
                    <div class="question-box">
                        <div class="question-status">
                            <div class="fragen">1/3</div>
                            <div class="punkte" id="points">0</div>
                        </div>
                        <div class="category">
                        <?php
                            if(isset($_GET['category_name'])) {
                                echo $_GET['category_name'];
                            } else {
                                echo "Es wurde keine Kategorie ausgewählt.";
                            }
                        ?>
                        </div>
                        <div class="question">
                            <?php echo $question_text; ?>
                        </div>
                        <div class="answers-container">
                            <?php foreach($answers as $answer): ?>
                                <div class="answer" id="answer_<?php echo $answer['AntwortenNr']; ?>" data-correct="<?php echo $answer['Richtig'] ? '1' : '0'; ?>" onclick="selectAnswer(<?php echo $answer['Richtig'] ? '1' : '0'; ?>, <?php echo $answer['AntwortenNr']; ?>)">
                                    <?php echo $answer['Antwort']; ?>
                                </div>
                            <?php endforeach; ?>
                        </div>
                    </div>
         </div>
         
        <div id="next-button-container" style="display: none;">
            <a href="register.php" class="start-button">Next</a>
        </div>
    </div>
</body>
</html>
