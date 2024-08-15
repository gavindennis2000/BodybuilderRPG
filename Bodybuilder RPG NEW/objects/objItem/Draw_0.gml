if TEST and object_index != objNPC draw_self();
if (dist < 40) {
	var alpha = 1/(dist/32)
	// draw the action icon
	if (objPlayer.canMove) { 
		if (instance_exists(objPlayer)) {

			draw_sprite_ext(sprAction, 0, x+16, y+ 16 - 32 + (dist/2 - 16), 1, 1, image_angle, image_blend, alpha); 
		}
	}
}