// dev tools
if (TEST) {
	
}

// keyboard inputs
var keyUp = input_check("up");
var keyLeft = input_check("left");
var keyRight = input_check("right");
var keyDown = input_check("down");
var keyRun = input_check("cancel");
var keyAction = input_check_pressed("confirm");



// walking speed
var spd = 2;
if (running) spd = 4;

// move to the inputted target
if (targetX > x) { x += spd; }
if (targetX < x) { x -= spd; }
if (targetY > y) { y += spd; }
if (targetY < y) { y -= spd; }
if (targetX == x and targetY == y) { walking = false; running = false; };

// input for walking
if (global.playerCanMove) {
	if (keyLeft and !walking) {
	
		running = (keyRun);
		face = left;
	
		if (!place_meeting(x-1, y, objWall)) {
			targetX -= 32;
			walking = true;
		}
	
	}

	if (keyRight and !walking) {
	
		running = (keyRun);
		face = right;
	
		if (!place_meeting(x+1, y, objWall)) {
			targetX += 32;
			walking = true;
		}
	
	}

	if (keyUp and !walking) {
	

		running = (keyRun);
		face = up;
	
		if (!place_meeting(x, y-1, objWall))  {
			targetY -= 32;
			walking = true;
		 }
	
	}

	if (keyDown and !walking) {
	
		running = (keyRun);
		face = down;
	
		if (!place_meeting(x, y+1, objWall)) {	
			targetY += 32;
			walking = true;
		}
		
	}
}

image_speed = (walking) ? 0.2 : 0;
image_speed += (running * 0.1);
if (!walking) { image_index = 0; }