// handle notes going off screen during guitar minigame

/*gmlive*/if (TEST) { if (live_call()) return live_result; }

// don't do anything if destroyed by player's guitar pick
if (isDestroyed) { exit; }

// increment y position
y += spd;

// destroy when going off screen
if (y >= room_height) {
	instance_destroy();
} 
else if (y >= objPick.y+32 && image_blend != c_dkgray) {
	image_blend = c_dkgray;
	with (objGuitar) { 
		health--; 
		imgIndex = 2;
		image_speed = 0;
	}
	objMusic.missNote();	
}