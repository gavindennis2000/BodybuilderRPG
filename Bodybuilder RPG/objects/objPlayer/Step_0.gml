var keyLeft = input_check("left");
var keyRight = input_check("right");
var keyDown = input_check("down");
var keyUp = input_check("up");

var keyConfirm = input_check_pressed("confirm");
var keyRun = input_check("cancel");
var keyCancel = input_check_pressed("cancel");
var keyStart = input_check_pressed("start");

// don't move if canmove is false

if (!canMove) { exit; }

// check for doors/stairs
if (targetX == 0 and targetY == 0 and place_meeting(x, y, objDoor)) {
	var door = instance_place(x, y, objDoor);
	if (door.goTo != -1) {
		canMove = false;
		alarm[0] = 2;
		exit;
	}
}

// move the player if targets aren't 0
var spd = 0;
spd = (running) ? 4 : 2;
if (global.bunnyHood and running) spd *= 2;
if (global.bicycle) spd *= 2;

if (targetX != 0 and targetY != 0) { spd = (running) ? 32/10 : 32/20; }

if (targetX > 0) {
	targetX -= spd;
	x += spd;
}
else if (targetX < 0) {
	targetX += spd;
	x -= spd;
}

if (targetY > 0) {
	targetY -= spd;
	y += spd;
}
else if (targetY < 0) {
	targetY += spd;
	y -= spd;
}

// look for input if targets are 0
if (targetX == 0 and targetY == 0 and !place_meeting(x, y, objDoor)) {
	// up and left
	if (keyLeft or keyRight or keyUp or keyDown) { state = "run"; } else { state = "stand" }
	 if (keyLeft) {
		face = left;
		state = run;
		targetX = -32;
		// check wall collision
		if (place_meeting(x-1, y, objWall)) { targetX = 0; }
	}
	// right
	else if (keyRight) {
		face = right;
		state = run;
		targetX = 32;
		// check wall collision
		if (place_meeting(x+1, y, objWall)) { targetX = 0; }
	}
	// up
	else if (keyUp) {
		face = up;
		state = run;
		targetY = -32;
		// check wall collision
		if (place_meeting(x, y-1, objWall)) { targetY = 0; }
	}
	// down
	else if (keyDown) {
		face = down;
		state = run;
		targetY = 32;
		// check wall collision
		if (place_meeting(x, y+1, objWall)) { targetY = 0; }
	}
	
	// check running
	running = keyRun;
}