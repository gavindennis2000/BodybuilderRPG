if TEST {
	//var o = objPlayer;
	//if (instance_exists(o)) {
	
	//	var angle = point_direction(x, y, o.x, o.y);	
	//	draw_text(x, y+32, angle);
	//	draw_text(x, y+48, point_distance(x,y, o.x, o.y));
	//	draw_text(x, y+68, face);
		
	//}
}

switch (npc) {

	case "npc1":
		
		break;
		
	default:
		switch (face) {
			case "down":
				sprite_index = sprNpcDown;
				break;
				
			case "up":
				sprite_index = sprNpcUp;
				break;
				
			case "left":
				sprite_index = sprNpcLeft;
				break;
				
			default:
				sprite_index = sprNpcRight;
				break;
		}
		break;
	
}

//image_blend = c_purple;
draw_sprite_ext(sprite_index, 0, x, y-8, 1, 1, image_angle, image_blend, image_alpha);

var c = c_white;
var b = c_black;
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(fntTextBox);

// draw the collision action
if (drawAction) {
	//draw_text_color(x+17, y - 15, "Talk", b, b, b, b, daAlpha);
	//draw_text_color(x+16, y - 16, "Talk", c, c, c, c, daAlpha);
	draw_sprite_ext(sprOrbTalk, 0, x+16, y-15, 1, 1, image_angle, image_blend, daAlpha);
}