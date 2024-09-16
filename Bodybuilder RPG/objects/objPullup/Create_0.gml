fadeBlack = room_height;
fadeIn = false;
countdown = 0;
countdownNum = 3;
countdownScale = 1;
drawLifters = false;
playerX = room_width + 64;
otherX = -64;
playerFinalX = room_width/4;
otherFinalX = room_width*3/4;
alarm[0] = 30;
image_speed = 0;
lastRep = image_index;

victor = "YOU LOSE.";
victoryTextScale = 0;

playerPullups = 0;
otherPullups = 0;
playerIndex = 0;
otherIndex = 0;
otherSpr = sprPullupPlayer;
highscore = global.highScores[1];
levelUpY = -1;
levelUpAlpha = 0;
timerY = room_height/2 + 20;

fadeAlpha = 0;

function drawScore(x, y, str) {
	var d = 3;
	draw_text_color(x + 1, y + d, str, c_black, c_black, c_black, c_black, 1);
	draw_text_color(x, y, str, c_white, c_white, c_white, c_white, 1);	
}

function drawScoreAlpha(x, y, str, alpha) {
	var d = 3;
	draw_text_color(x + 1, y + d, str, c_black, c_black, c_black, c_black, alpha);
	draw_text_color(x, y, str, c_white, c_white, c_white, c_white, alpha);	
}

function drawScoreExt(x, y, str, xscale, yscale) {
	var d = 3;
	draw_text_transformed_color(x + 1, y + d, str, xscale, yscale, 0, c_black, c_black, c_black, c_black, 1);
	draw_text_transformed_color(x, y, str, xscale, yscale, 0, c_white, c_white, c_white, c_white, 1);
}

function levelUp() {
	global.pull++;
	playSound(sndLevelUp);
	levelUpY = room_height;
	levelUpAlpha = 1;
}