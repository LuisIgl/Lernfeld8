<?php
require "database.php";
session_start();

if (!isset($_SESSION['gameStarted']) || $_SESSION['gameStarted'] != true) {
    $_SESSION['currentPoints'] = 0;
    $_SESSION['gameStarted'] = true;
}

$currentPoints = isset($_SESSION['currentPoints']) ? $_SESSION['currentPoints'] : 0;

if (isset($_GET['category_name'])) {
    $category_name = $_GET['category_name'];

    $statement = $conn->prepare("SELECT * FROM kategorie WHERE Kategorie = ?");
    $statement->execute([$category_name]);
    $category = $statement->fetch(PDO::FETCH_ASSOC);

    if ($category) {
        $category_id = $category['KategorieNr'];

        $statement_questions = $conn->prepare("SELECT * FROM fragen WHERE KategorieNr = ?");
        $statement_questions->execute([$category_id]);

        $questions = $statement_questions->fetchAll(PDO::FETCH_ASSOC);

        $answers = array();
        foreach ($questions as $question) {
            $statement_answers = $conn->prepare("SELECT * FROM antworten WHERE FragenNr = ? ORDER BY RAND() LIMIT 4");
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
<link rel="stylesheet" href="./static/css/game-style.css">
<script>

var currentQuestion = <?php echo $currentQuestion; ?>;
var totalQuestions = <?php echo $total_questions; ?>;
var currentPoints = getCurrentPoints();

function getCurrentPoints() {
    return parseInt(localStorage.getItem('currentPoints')) || 0;
}

function updatePoints(points) {
    localStorage.setItem('currentPoints', points);
    document.getElementById('points').textContent = points;
}

window.onload = function() {
    var currentPoints = getCurrentPoints();
    document.getElementById('points').textContent = currentPoints;
};

function selectAnswer(isCorrect, answerId) {

    if (isCorrect) {
        currentPoints += 50;
        updatePoints(currentPoints);
    }

    var answerButtons = document.querySelectorAll('.answer');
    answerButtons.forEach(function(button) {
        button.onclick = null;
    });

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
    } else if (currentQuestion === totalQuestions - 1) {
        document.getElementById('results-button-container').style.display = 'block';
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

    if (currentQuestion === totalQuestions - 1) {
        document.getElementById('next-button-container').style.display = 'none';
    }
}
function toggleHelp() {
    var popup = document.getElementById("help-popup");
    popup.style.display = (popup.style.display === "block") ? "none" : "block";
}

</script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Game</title>
<link rel="stylesheet" href="./static/css/game-style.css">
</head>
<body>
<div class="main-container">
    <div class="game-container">
        <div class="logo">
        <a href="home.php" class="logo"><img src="static/img/logo.png" alt="Logo"></a>
        </div>
        <div class="help-icon">
            <img src="static/img/help.png" alt="Help" onclick="toggleHelp()">
        </div>
        <div class="question-box" id="question-box">
            <div class="question-status">
                <div class="fragen"><?php echo ($currentQuestion + 1) . "/" . $total_questions; ?></div>
                <div id="points"><?php echo $currentPoints . ' Punkte'; ?></div>
            </div>
            <div class="category">
                <?php
                if (isset($_GET['category_name'])) {
                    echo $_GET['category_name'];
                } else {
                    echo "Es wurde keine Kategorie ausgewählt.";
                }
                ?>
            </div>
            <div class="question-box" id="question-box">
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
            <div id="next-button-container" style="display: <?php echo isset($_SESSION['lastQuestionCorrect']) ? ($_SESSION['lastQuestionCorrect'] ? 'block' : 'none') : 'none'; ?>;">
                <?php if ($currentQuestion < $total_questions - 1): ?>
                    <a href="game.php?category_name=<?php echo $category_name; ?>&currentQuestion=<?php echo $currentQuestion + 1; ?>" class="next-button">Next</a>
                <?php endif; ?>
            </div>
            <div id="results-button-container" style="display: <?php echo $currentQuestion === $total_questions - 1 ? 'block' : 'none'; ?>">
                <?php
                    echo '<div id="results-button-container">';
                    echo '<a href="results.php" class="next-button">Results</a>';
                    echo '</div>';
                ?>
            </div>
        </div>
    </div>
</div>
<div id="help-popup" class="help-popup">
    <div class="help-content">
        <span class="close-button" onclick="toggleHelp()">&times;</span>
        <h3>Hilfe</h3>
        <p>Um auf jede Frage zu antworten, klicken Sie auf die Antwort,
           die Sie für richtig halten. Nachdem Sie dies getan haben,
           können Sie auf "Next" klicken, um zur nächsten Frage zu gelangen.</p>
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
