var guessesLeft = 10;
var highScores = new Array([9, "HarryJamesPotter"], [3, "ZedCthulhu"], [2, "NearlyDied"]);
var correctGuess = Math.floor(Math.random()*100) + 1;

$(function() {
  updateScore(guessesLeft);
  populateHighScores(highScores);
  $('#btnGuess').click(function () {
  	guess();
  });
});

function populateHighScores(scores) {
  for (var i = 0; i < scores.length; ++i) {
    $('div#highScores').append("<p>" + scores[i][0] + " " + scores[i][1] + "</p>");
  }
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
		alert("You win!");
		playAgain();
	}

	checkLose();
	return;
}

function checkLose () {
	if(guessesLeft <= 0) {
		$('#content').html("<h1>You Lose!</h1>");
		playAgain();
	}
}

function playAgain () {
	if (confirm("Play Again?")) {
		window.location.reload();
	};
}

function replaceContents(message) {
	var element = $('#content');
	var temp = element.html();
	element.html("<h1>" + message + "</h1>");
	element.html(temp);
}