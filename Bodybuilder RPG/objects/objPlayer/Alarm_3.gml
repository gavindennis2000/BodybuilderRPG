///@description go to new chapter
if (fadeAlpha < 1) {
	depth = -999;
	canMove = false;
	fadeAlpha += 0.05;
	alarm[3] = 2;
}
else if (fadeAlpha == 1) {
	fadeAlpha += 0.05;
	alarm[3] = 120;
}
else {
	room_restart();
}