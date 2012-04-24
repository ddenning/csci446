var guessesLeft = 10;
var highScores = new Array([1, "D"], [2, "Dy"], [3, "Dyl"], [4, "Dyla"], [5, "Dylan"], [6, "Dylan D"], [7, "Dylan De"], [8, "Dylan Den"]);
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
	if (confirm("Play Again?")) {
		window.location.reload();
	};
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

function replaceContents(message) {
	var element = $('#toReplace');
	var temp = element.html();
	element.html("<h1>" + message + "</h1>");
	element.html(temp);
}