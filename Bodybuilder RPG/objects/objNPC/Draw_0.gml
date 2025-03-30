// handles npc sprite rendering including body, hair, and hair color

/*gmlive*/if (TEST) { if (live_call()) return live_result; }

// don't draw npc sprites during workout minigames
if (
	instance_exists(objGuitar) ||
	instance_exists(objCardio)
) { exit; }

event_inherited();

var hair;
// face the right direction
switch(face) {
	case "left":
		sprite_index = sprNPCLeft;
		hair = sprHairLeft;
		break;
	case "right":
		sprite_index = sprNPCRight;
		hair = sprHairRight;
		break;
	case "up":
		sprite_index = sprNPCUp;
		hair = sprHairUp;
		break;
	case "down":
	default:
		sprite_index = sprNPCDown;
		hair = sprHairDown; 
		break;
}
// get the right person sprite
switch (npcID) {
	// main characters
    case "mom":
        npcImg = 1;
        npcHair = 2;
		npcHairColor = #7a6a2b
        break;
	case "samuel":
		npcImg = 2;
		npcHair = -1;
		break;
	case "harvey":
		npcImg = 4;
		npcHair = 3;
		npcHairColor = #c91800;
		break;
	case "jim":
		npcImg = 5;
		npcHair = 3;
		npcHairColor = #e0e0e0
		break;

	// side characters
	case "harvey's mom":
        npcImg = 3;
		image_blend = c_white;
        npcHair = 4;
		npcHairColor = #c91800;
        break;
	case "mason":
		npcImg = 6;
		npcHair = 4;
		npcHairColor = #0f0d05
		break;

	// fighting enemies
	
    // npc girls
    case "person 1":
        npcImg = 3;
        npcHair = 2;
        npcHairColor = #0f0d05
        break;

	// npc boys

	// gym rats
	case "gym rat 1":
		npcImg = 3;
		npcHair = 3;
		npcHairColor = #0f0d05;
		break;
	case "gym rat 2":
		npcImg = 3;
        npcHair = 2;
        npcHairColor = #0f0d05
		break;
	case "gym rat 3":
		npcImg = 8;
		npcHair = 3;
		npcHairColor = #0f0d05;
		break;
		
	// default
    default:
        break;
}
// draw the npc
draw_sprite_part_ext(sprite_index, image_index, npcImg*32, 0, 32, 40, x, y-8, image_xscale, image_yscale, image_blend, image_alpha);
// draw the npc's hair
if (npcHair != -1) { draw_sprite_part_ext(hair, image_index, npcHair*32, 0, 32, 40, x, y-8, image_xscale, image_yscale, npcHairColor, image_alpha); }