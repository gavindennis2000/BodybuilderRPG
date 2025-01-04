/*gmlive*/if (TEST) { if (live_call()) return live_result; }


var keyLeft = input_check("left");
var keyRight = input_check("right");
var keyDown = input_check("down");
var keyUp = input_check("up");

var keyConfirm = input_check_pressed("south");
var keyRun = input_check("east");
var keyStart = input_check_pressed("start");
var keySelect = input_check_pressed("select");

// don't move if canmove is false
if (!canMove) { exit; }

// check for cutscenes or battle
if (cutscene || global.battle ) {
	image_index = 0;
	exit;
}

// dev tool
if input_check_pressed("l1") {
    initiateBattle(true);
}

// check for doors/stairs
if (targetX == 0 and targetY == 0 and place_meeting(x, y, objDoor)) {
	var door = instance_place(x, y, objDoor);
	if (door.goTo != -1) {
		if (canMove) {
			canMove = false;
            if (instance_exists(objMusic)) { objMusic.roomEnd(); }
		}
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

if (targetX != 0) {
    x += (spd * sign(targetX));
	targetX -= (spd * sign(targetX));
    if (targetX == 0) {
       checkBattle();
    }
}
if (targetY != 0) {
    y += (spd * sign(targetY));
    targetY -= (spd * sign(targetY));
    if (targetY == 0) {
       battleCounter++;
    }
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