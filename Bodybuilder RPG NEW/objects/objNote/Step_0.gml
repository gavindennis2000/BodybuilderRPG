y += spd;

if (y >= room_height) {
	instance_destroy();
} else if (y > objPick.y+6 and image_blend != c_gray) {
	image_blend = c_gray;
	with (objGuitar) { 
		health--; 
		imgIndex = 2;
		image_speed = 0;
	}
	objMusic.missNote();	
}