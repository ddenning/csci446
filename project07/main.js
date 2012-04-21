var guessesLeft = 10;
var highScores = new Array([9, "HarryJamesPotter"], [3, "ZedCthulhu"], [2, "NearlyDied"]);
var correctGuess = Math.floor(Math.random*100) + 1;

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
	/*if(!(validateResponse($('#guess').value)){
		checkLose();
	}*/
}

function validateResponse(value) {
	if(value < correctGuess) {
		//TODO: Diplay Too Low
	}
	else if(value > correctGuess) {
		//TODO: Display Too High
	}
	else {
		//TODO: Display you win, prompt for name for high score, update high score, prompt for play again
	}
}

function checkLose () {
	if(guessesLeft <= 0) {
		//TODO: Display Losing Condition, prompt play again
	}
}

function playAgain () {
	if (confirm("Play Again?")) {
		window.location.reload();
	};
}