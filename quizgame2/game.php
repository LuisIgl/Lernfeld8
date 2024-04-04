<?php
require "database.php";
session_start();

if(isset($_GET['category_name'])) {
    $category_name = $_GET['category_name'];

    $statement = $conn->prepare("SELECT * FROM kategorie WHERE Kategorie = ?");
    $statement->execute([$category_name]);
    $category = $statement->fetch(PDO::FETCH_ASSOC);

    if($category) {
        $category_id = $category['KategorieNr'];

        $statement_questions = $conn->prepare("SELECT * FROM fragen WHERE KategorieNr = ?");
        $statement_questions->execute([$category_id]);

        $questions = $statement_questions->fetchAll(PDO::FETCH_ASSOC);

        $answers = array();
        foreach($questions as $question) {
            $statement_answers = $conn->prepare("SELECT * FROM antworten WHERE FragenNr = ?");
            $statement_answers->execute([$question['FragenNr']]);
            $answers[$question['FragenNr']] = $statement_answers->fetchAll(PDO::FETCH_ASSOC);
        }

        $total_questions = count($questions);
    } else {
        $questions = [];
        $answers = [];
        $total_questions = 0;
    }
} else {
    $questions = [];
    $answers = [];
    $total_questions = 0;
}

$currentQuestion = isset($_GET['currentQuestion']) ? $_GET['currentQuestion'] : 0;
?>

<!DOCTYPE html>
<html lang="en">
<head>
<script>
        var currentQuestion = <?php echo $currentQuestion; ?>;
        var totalQuestions = <?php echo $total_questions; ?>;

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

            if (currentQuestion < totalQuestions - 1) {
                document.getElementById('next-button-container').style.display = 'block';
            }
        }

        function nextQuestion() {
            currentQuestion++;

            var questionBox = document.getElementById('question-box');
            questionBox.innerHTML = `
                <div class="question">
                    <?php echo $questions[$currentQuestion]['Frage']; ?>
                </div>
                <div class="answers-container">
                    <?php foreach($answers[$questions[$currentQuestion]['FragenNr']] as $answer): ?>
                        <div class="answer" id="answer_<?php echo $answer['AntwortenNr']; ?>" data-correct="<?php echo $answer['Richtig'] ? '1' : '0'; ?>" onclick="selectAnswer(<?php echo $answer['Richtig'] ? '1' : '0'; ?>, <?php echo $answer['AntwortenNr']; ?>)">
                            <?php echo $answer['Antwort']; ?>
                        </div>
                    <?php endforeach; ?>
                </div>
            `;

            var questionStatus = document.querySelector('.fragen');
            questionStatus.textContent = (currentQuestion + 1) + "/" + totalQuestions;

            // Ocultar el botón Next si es la última pregunta
            if (currentQuestion === totalQuestions - 1) {
                document.getElementById('next-button-container').style.display = 'none';
            }
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
            background-color: #f584b3;
            color: black;
            border-color: black;
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

        .next-button {
            background-color: #ffe28a;
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
            text-decoration: none;
            font-weight: bold;
            margin-top: -2%;
        }
        .next-button:hover {
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
    <div class="question-box" id="question-box">
        <div class="question-status">
            <div class="fragen"><?php echo ($currentQuestion + 1) . "/" . $total_questions; ?></div>

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
            <?php echo $questions[$currentQuestion]['Frage']; ?>
        </div>
        <div class="answers-container">
            <?php foreach($answers[$questions[$currentQuestion]['FragenNr']] as $answer): ?>
                <div class="answer" id="answer_<?php echo $answer['AntwortenNr']; ?>" data-correct="<?php echo $answer['Richtig'] ? '1' : '0'; ?>" onclick="selectAnswer(<?php echo $answer['Richtig'] ? '1' : '0'; ?>, <?php echo $answer['AntwortenNr']; ?>)">
                    <?php echo $answer['Antwort']; ?>
                </div>
            <?php endforeach; ?>
        </div>
    </div>
</div>        
        <div id="next-button-container" style="display: none;">
                <?php if ($currentQuestion < $total_questions - 1): ?>
                    <a href="game.php?category_name=<?php echo $category_name; ?>&currentQuestion=<?php echo $currentQuestion + 1; ?>" class="next-button">Next</a>
                <?php else: ?>
                    <span>Es gibt keine weitere Fragen.</span>
                <?php endif; ?>
            </div>
        </div>
</body>
</html>
