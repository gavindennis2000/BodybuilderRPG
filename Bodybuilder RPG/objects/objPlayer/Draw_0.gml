/// @description Insert description here
if (face == left) {
	sprite_index = sprPlayerLeft;
}

if (face == right) {
	sprite_index = sprPlayerRight;
}

if (face == up) {
	sprite_index = sprPlayerUp;
}

if (face == down) {
	sprite_index = sprPlayerDown;
}


if (running)
	image_speed *=2;
	
draw_sprite_ext(sprite_index, -1, x, y-6, image_alpha, image_yscale, image_angle, image_blend, image_alpha);