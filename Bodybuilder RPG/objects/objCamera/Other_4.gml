if (instance_exists(objPlayer)) {
	follow = objPlayer;
	x = objPlayer.x+16; 
	y = objPlayer.y+16;
}
else { follow = noone; }

// set view parameters for battle
if (room == roomBattle) {
	camera_set_view_angle(cam, 0);
	camW = 480 - 60*4;
	camH = 270 - 60*4;
	camX = 120; camY = 120
	// set the camera pos and size
	camera_set_view_pos(cam, camX, camY);
	camera_set_view_size(cam, camW, camH);
}