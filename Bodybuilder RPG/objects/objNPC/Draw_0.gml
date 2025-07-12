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
	case "arnold terminager":
		sprite_index = sprArnold;
		break;
	case "clerk":
		image_index = 5;
		break;
	case "donnie swoleman":
		image_index = 9;
		break;
	case "jim":
		image_index = 2;
		break;
	case "mom":
		image_index = 3;
		break;
	case "noob 1":
	image_index = 10;
		break;
	case "robber":
		image_index = 4;
		break;
	case "smol powerlifter 1":
	case "smol powerlifter 2":
		image_index = 6;
		break;
	case "smol powerlifter 3":
		image_index = 11;
		break;
	case "super heavyweight 1":
	case "trapped guy":
		image_index = 8;
		break;
	case "thicc powerlifter 1":
	case "thicc powerlifter 2":
		image_index = 7;
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