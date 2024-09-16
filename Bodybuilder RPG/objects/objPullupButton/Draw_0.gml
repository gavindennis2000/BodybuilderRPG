var spr = sprButton;

if (disable)
	image_alpha = 0.7
else
	image_alpha = 1;
	
if (failure)
	spr = sprButtonRed;
else 
	spr = sprButton;
	
draw_sprite_ext(spr, button, room_width/2, room_height/2 - 32, 2, 2, image_angle, image_blend, image_alpha);	