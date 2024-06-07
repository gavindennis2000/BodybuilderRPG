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
if (targetX > x) { x += spd; stepCheck(); } 
if (targetX < x) { x -= spd; stepCheck(); }
if (targetY > y) { y += spd; stepCheck(); }
if (targetY < y) { y -= spd; stepCheck(); }
if (targetX == x and targetY == y) { walking = false; running = false; };

var exitInst = instance_place(x, y, objExit);
if (exitInst != noone) {
	if (!walking and global.playerCanMove) {
		if (exitInst.goTo == -1)
			exit;
		else { exitInst.nextRoom(); }; 
	}
}

// input for walking
if (global.playerCanMove) {
	if (keyLeft and !walking) {
	
		running = (keyRun);
		face = left;
		walking = true;
	
		if (!place_meeting(x-1, y, objWall)) {
			targetX -= 32;
			steps++;
		}
	
	}

	if (keyRight and !walking) {
	
		running = (keyRun);
		face = right;
		walking = true;
	
		if (!place_meeting(x+1, y, objWall)) {
			targetX += 32;
			steps++;
		}
	
	}

	if (keyUp and !walking) {
	

		running = (keyRun);
		face = up;
		walking = true;
	
		if (!place_meeting(x, y-1, objWall))  {
			targetY -= 32;
			steps++;
		 }
	
	}

	if (keyDown and !walking) {
	
		running = (keyRun);
		face = down;
		walking = true;
	
		if (!place_meeting(x, y+1, objWall)) {	
			targetY += 32;
			steps++;
		}
		
	}
}

image_speed = (walking) ? 0.2 : 0;
image_speed += (running * 0.1);
if (!walking) { image_index = 0; }