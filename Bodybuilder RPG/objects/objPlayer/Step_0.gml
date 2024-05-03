// reset movement
if (x % 32 == 0 and y % 30 == 0) {
	state = stand;
	spd = 0;
}

// walk left
if (input_check("left")) {
	face = left;
	direction = 180;
	spd = 1;
}

// walk right
else if (input_check("right")) {
	face = right;
	direction = 0;
	spd = 1;
}

// walk up
else if (input_check("up")) {
	face = up;
	direction = 90;
	spd = 1;
}

// walk down
else if (input_check("down")) {
	face = down;
	direction = 270;
	spd = 1;
}

if (running and x % 32 == 0 and y % 30 == 0) { speed *= 2; }
speed = spd;