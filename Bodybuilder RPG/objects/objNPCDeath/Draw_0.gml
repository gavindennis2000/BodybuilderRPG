// objNPCDeath draw

/*gmlive*/ if (TEST) { if (live_call()) return live_result; }

if (instance_exists(objPlayer) && y >= objPlayer.y)
	depth = objPlayer.depth - 1;
else if (instance_exists(objPlayer))
	depth = objPlayer.depth + 1;

var imageY = 0;
switch (face) {
	case "down":
		imageY = 0;
		break;
	case "up":
		imageY = 1;
		break;
	case "right":
		imageY = 2;
		break;
	case "left":
		imageY = 3
		break;
}

draw_sprite_part_ext(sprite_index, image_index, 0, imageY * 32, 32, 32 - deathY, x - 16, y - 21, image_xscale * 2, image_yscale * 2, c_black, image_alpha);

// make the body disinigrate
deathY += 0.75;
if (deathY >= 32)
    instance_destroy();