/// @description time's up
with (objPullupButton) { instance_destroy(); }
image_speed = 0; // stop player animation
alarm[2] = -1;
highscore = global.highScores[1] = playerPullups;

if (victoryTextScale == 0) {
	alarm[3] = 60;
}