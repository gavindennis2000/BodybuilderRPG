// objNPC draw

if (TEST) { if (live_call()) {  // GMLive
    return live_result;
}}

var imageY = 0;

// get the npc's sprite_index
sprite_index = sprNPC;  // default
switch (npcID) {
	case "ana":
		sprite_index = sprAna;
		break;
	case "andro":
		sprite_index = sprAndro;
		break;
	case "doms":
		sprite_index = sprDoms;
		break;
	case "samson":
		sprite_index = sprSamson;
		break;
	case "mom":
		image_index = 3;
		break;
	case "jim":
		image_index = 2;
		break;
	default:
		image_index = 0;
		break;
}

// get the npc's direction
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

if (instance_exists(objPlayer) && y >= objPlayer.y)
	depth = objPlayer.depth - 1;
else if (instance_exists(objPlayer))
	depth = objPlayer.depth + 1;
else depth = depthStart;

draw_sprite_part_ext(sprite_index, image_index, 0, 0 + 32 * imageY, 32, 32, x - 16, y - 21, 2, 2, image_blend, image_alpha);