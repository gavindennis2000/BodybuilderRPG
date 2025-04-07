///@description go to new chapter
canMove = false;
if (fadeAlpha < 1) {
	depth = -200;
	canMove = false;
	fadeAlpha += 0.05;
	alarm[3] = (teleportExit != 0) ? 2 : 2;
}
else if (fadeAlpha == 1) {
	fadeAlpha += 0.05;
	alarm[3] = 60;
}
else {
	if (room == rMom) {
		room_restart();
	}
	else {
		room_goto(rMom);
		x = 384;
		y = 320;
	}
}