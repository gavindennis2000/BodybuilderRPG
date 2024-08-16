if (dist < 40) {
	var alpha = 1/(dist/32)
	// draw the action icon
	if (objPlayer.canMove) { 
		if (instance_exists(objPlayer)) {
			gpu_set_depth(-1000);
			draw_sprite_ext(sprAction, 0, x+16, y+ 16 - 32 + (dist/2 - 16), 1, 1, image_angle, image_blend, alpha); 
		}
	}
}