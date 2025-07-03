// objNPC draw

if (TEST) { if (live_call()) {  // GMLive
    return live_result;
}}

var imageY = 0;

// get the npc's sprite_index
sprite_index = sprNPC;  // default
switch (npcID) {
	// main characters
	case "andro":
		sprite_index = sprAndro;
		break;
	case "ana":
		sprite_index = sprAna;
		break;
	case "doms":
		sprite_index = sprDoms;
		break;
	case "samson":
		sprite_index = sprSamson;
		break;
	// alphabetical order for the rest
	case "clerk":
		image_index = 5;
		break;
	case "jim":
		image_index = 2;
		break;
	case "mom":
		image_index = 3;
		break;
	case "robber":
		image_index = 4;
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

// flash the sprite when having food poisoning or whatever
if (flashing) {
	flashCounter++;
	var modCheck = 15;
	if (flashCounter % modCheck > (modCheck / 2))
		image_alpha = 0.5;
	else 
		image_alpha = 0.9;
}

draw_sprite_part_ext(sprite_index, image_index, 0, 0 + 32 * imageY, 32, 32, x - 16, y - 21, 2, 2, image_blend, image_alpha);