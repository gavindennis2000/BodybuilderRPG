
if TEST and object_index != objNPC and drawSelf { draw_self(); }
if (dist < 40) {
	var alpha = 1/(dist/32)
	// draw the action icon
	if (objPlayer.canMove) { 
		if (instance_exists(objPlayer)) {
			if (dist <= 36)
				draw_sprite_ext(sprActionGlow, 0, x+16, y+ 16 - 32, 1, 1, image_angle, image_blend, glowAlpha); 
			else
				glowAlpha = 0;
			
			draw_sprite_ext(sprAction, 0, x+16, y+ 16 - 32 + (dist/2 - 16), 1, 1, image_angle, image_blend, alpha); 
		}
	}
}