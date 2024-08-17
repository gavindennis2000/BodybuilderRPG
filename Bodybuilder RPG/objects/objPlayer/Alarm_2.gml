///@description Go to minigame
// go to room after action prompt
if (fadeAlpha < 1) {
	depth = -999;
	canMove = false;
	fadeAlpha += 0.2;
	alarm[2] = 2;
}
else {
	var door = instance_place(x, y, objDoor);
	room_goto(actionRoom);
	instance_destroy();
}