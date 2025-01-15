// go to game over room

/*gmlive*/if (TEST) { if (live_call()) return live_result; }

if (fadeAlpha < 1) {
	canMove = false;
	depth = -999;
	fadeAlpha += 0.2;
	alarm[4] = 2;
}
else {
	room_goto(rGameOver);
	instance_destroy();
}