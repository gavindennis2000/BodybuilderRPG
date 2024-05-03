// reset movement
var onGrid = (x % 32 == 0 and y % 30 == 0);
if (onGrid) {
	state = stand;
	spd = 0;
}

// horizontal movement
left = input_check("left");
right = input_check("right");
hsp = left - right;

// vertical movement
up = input_check("up");
down = input_check("down");
vsp = up - down;

if (place_meeting(x+32*hsp, y, objWall)) { hsp = 0 };
if (place_meeting(x, y+30*vsp, objWall)) { vsp = 0 };

if (running and x % 32 == 0 and y % 30 == 0) { speed *= 2; }
speed = spd;