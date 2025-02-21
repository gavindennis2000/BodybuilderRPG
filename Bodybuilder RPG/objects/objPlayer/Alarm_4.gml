// go to game over room

/*gmlive*/if (TEST) { if (live_call()) return live_result; }

if (fadeAlpha < 1) {
	canMove = false;
	depth = -1000;
	fadeAlpha += 0.1;
	alarm[4] = 2;
}
else {
	room_goto(rGameOver);
}