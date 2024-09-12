/// @description Insert description here
// You can write your code in this editor
var inc = 0.25;
var aTime = 1;

if (paused and !unpause) {
	if (fadeBlack < 1) {
		fadeBlack += inc;
		alarm[0] = aTime;
	}
}
else if (unpause) {
	if (fadeBlack > 0) {
		fadeBlack -= inc;
		alarm[0] = aTime;
	}
	else {
		paused = false;
		unpause = false;
		with (objPlayer) { canMove = true; }
	}
}