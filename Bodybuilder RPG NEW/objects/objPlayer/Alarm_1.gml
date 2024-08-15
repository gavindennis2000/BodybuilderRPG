if (fadeAlpha > 0) {
	image_index = 0;
	image_speed = 0;
	fadeAlpha -= 0.2;
	alarm[1] = 2;
}
else {
	depth = -100;
	canMove = true;
}