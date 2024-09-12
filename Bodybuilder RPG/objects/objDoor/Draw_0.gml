if (place_meeting(x-1, y, objDoor)) { 
	draw_sprite_ext(sprite_index, image_index, x+32, y, -1, 1, image_angle, image_blend, image_alpha);
}

else { draw_self(); }