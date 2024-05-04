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

image_speed = 0.2;
if (running)
	image_speed *=2;
	
draw_self();