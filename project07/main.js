var guessesLeft = 10;
var highScores = new Array();
var correctGuess = Math.floor(Math.random()*100) + 1;

$(function() {
  updateScore(guessesLeft);
  populateHighScores(highScores);
  $('#btnGuess').click(function () {
  	guess();
  });
  onEnter();
});

function populateHighScores(scores) {
	$('div#highScores').html("<table><tr><td id=\"rank\">Rank</td><td id=\"scores\">Score</td><td id=\"name\">Name</td></tr>");
  for (var i = 0; i < scores.length; ++i) {
    $('div#highScores').append("<tr><td id=\"rank\">" + (i+1) + "</td><td id=\"scores\">" + scores[i][0] + "</td><td id=\"name\">" + scores[i][1] + "</td></tr>");
  }
   $('div#highScores').append("</table>");
}

function updateScore(score) {
  $('span#guessesLeft').html(score);
}

function guess() {
	guessesLeft--;
	updateScore(guessesLeft);
	var value = $('#guess').val();
	validateResponse(value);
}

function validateResponse(value) {
	if(value < correctGuess) {
		$('#displayResult').html("<p>That's too low.</p>");
	}
	else if(value > correctGuess) {
		$('#displayResult').html("<p>That's too high.</p>");
	}
	else {
		$('#toReplace').html("<h1>You win!</h1>");
		updateHighScores();
		playAgain();
	}

	checkLose();
	return;
}

function checkLose () {
	if(guessesLeft <= 0) {
		$('#toReplace').html("<h1>You Lose!</h1>");
		playAgain();
	}
}

function playAgain () {
	$('#toReplace').append('<br><button type="button" id="again" onclick="window.location.reload();">Play Again?</button>');
}

function onEnter() {
	$("#guess").keyup(function(event){
    if(event.keyCode == 13){
        $("#btnGuess").click();
    }
	});
}

function updateHighScores() {
	var name = prompt("Enter your name", "");
	highScores.push([10-guessesLeft, name]);
	highScores.sort(sortFunction);
	while(highScores.size > 5) {
		highScores.pop();
	}
	populateHighScores(highScores);
}

function sortFunction(a, b) {
	return a[0]-b[0];
}

function replaceContents() {
	$('#content').html('<h1>Guess-the-Number</h1>	<div id="toReplace"> <p class="subtitle">Fool! You have followed a link here and now your life depends on guessing my magic number!</p> <p>Between 1 and 100! Because it is magic!</p> <h2 id="score"><span id="guessesLeft"></span> Guesses Left</h2> <div id="displayResult"></div>	<div id="guessTheNumber">	<input type="text" size="3" name="guess" id="guess"> <br>	<button type="button" id="btnGuess">Guess!</button>	</div> </div> <h2><span class="highScore">High</span> Scores</h2>	<div id="highScores"></div>');
}

function resetGame() {
	var guessesLeft = 10;
	var correctGuess = Math.floor(Math.random()*100) + 1;
	replaceContents();
}