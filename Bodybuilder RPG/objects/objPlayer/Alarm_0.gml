///@description go to room from door
if (fadeAlpha < 1) {
	canMove = false;
	depth = -999;
	fadeAlpha += 0.2;
	alarm[0] = 2;
}
else {
	var door = instance_place(x, y, objDoor);
	x = door.pX;
	y = door.pY;
	face = door.pFace;
	global.roomID = door.roomID;
	room_goto(door.goTo);
}