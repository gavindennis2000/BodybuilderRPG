///@description go to next room
if (drawAlpha < 1) { 
	drawAlpha += 0.1; 
	alarm[0] = 2;
} else {
	
	alarm[1] = 2;
	room_goto(goTo);
	draw_set_alpha(1);
	with (objPlayer) {
		x = other.pX;
		y = other.pY;
		face = other.face;
	}
	global.playerCanMove = true;
		
}