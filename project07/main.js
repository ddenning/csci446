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
		animateText();
	}
	else if(value > correctGuess) {
		$('#displayResult').html("<p>That's too high.</p>");
		animateText();
	}
	else {
		updateHighScores();
		$('#toReplace').html("<h1 id='win'>You win!</h1>");
		playAgain();
		onWin();
	}

	checkLose();
	return;
}

function checkLose () {
	if(guessesLeft <= 0) {
		$('#toReplace').html("<h1 id='lose'>You Lose!</h1>");
		playAgain();
		onLose();
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
	var name;
	while(!name) {
		name = prompt("Enter your name", "");
	}
	highScores.push([guessesLeft, name]);
	highScores.sort(sortFunction);
	while(highScores.size > 5) {
		highScores.pop();
	}
	populateHighScores(highScores);
}

function sortFunction(a, b) {
	return a[0]-b[0];
}

function animateText() {
	$("#displayResult").animate({fontSize:"3em"}, 1000);
	$("#displayResult").animate({fontSize:"1em"}, 1000);
}

function onLose() {
	$("#lose").animate({opacity:0.1}, 1000);
	$("#lose").animate({opacity:1.0}, 1000);
	onLose();
}

function onWin(num) {
	$("#win").animate({opacity:0.1}, 1000);
	$("#win").animate({opacity:1.0}, 1000);
	onWin();
}