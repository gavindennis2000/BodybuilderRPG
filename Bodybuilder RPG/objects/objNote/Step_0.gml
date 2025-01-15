// handle notes going off screen during guitar minigame

/*gmlive*/if (TEST) { if (live_call()) return live_result; }

// don't do anything if destroyed by player's guitar pick
if (isDestroyed) { exit; }

// increment y position
if (objGuitar.blackOut) { spd /= 1.02; }
y += spd;

// destroy when going off screen
var camY = camera_get_view_y(view_camera[0]);
if (y >= camY + 286) {
	instance_destroy();
} 
else if (y >= objPick.y+32 && image_blend != c_dkgray) {
	image_blend = c_dkgray;
	global.stats.fatigue += 5;
	objMusic.missNote();	
}