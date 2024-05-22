if (follow != noone) {
	xTo = follow.x + 16;
	yTo = follow.y + 16;
	
	x += (xTo - x) / 15;
	y += (yTo - y) / 15;
}


if (!initBattle and room != roomBattle) { camera_set_view_pos(view_camera[0], x-(camWidth/2), y-(camHeight/2)); }

// rotate the camera before a battle starts
if (initBattle) {
	camX = camera_get_view_x(cam); camY = camera_get_view_y(cam);
	camW -= 4; camH -= 4;
	camX += 2; camY += 2;
	// set the camera pos and size
	camera_set_view_pos(cam, camX, camY);
	camera_set_view_size(cam, camW, camH);
	//// fix position
	//var targetX = objPlayer.x + 16 - camW/2;
	//var targetY = objPlayer.y + 16 - camH/2;
	
	//targetX = clamp(targetX, 0, room_width-camWidth/2);
	//targetY = clamp(targetY, 0, room_height-camHeight/2);
	
	//var camSmooth = 0.1;
	//camX = lerp(camX, targetX, camSmooth);
	//camY = lerp(camY, targetY, camSmooth);
	
	//// zoom in
	//var mult = -0.01;
	//var addW = camW * mult;
	//var addH = camH * mult;
	//camW += addW;
	//camH += addH;
	//// fix the position
	//var pos = 1;
	//camX -= addW/2;
	//camY -= addH/2;
	//// set the camera pos and size
	//camera_set_view_pos(cam, camX, camY);
	//camera_set_view_size(cam, camW, camH);
	// make the screen whited
	whiteAlpha += 1/aTime;
	// rotate the camera
	inc++;
	camera_set_view_angle(view_camera[0], camera_get_view_angle(view_camera[0])+inc/8)
}
if (whiteOut) {
	if camW >= 480{
		camW = 480; camH = 270;
		whiteOut = false;
		draw_set_alpha(1);
		exit;
	}
	
	if (whiteAlpha > 0) { whiteAlpha -= 1/60; }
	camW += 4; camH += 4;
	camX -= 2; camY -= 2;
	// set the camera pos and size
	camera_set_view_pos(cam, camX, camY);
	camera_set_view_size(cam, camW, camH);
}