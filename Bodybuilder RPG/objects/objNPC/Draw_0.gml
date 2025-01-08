/*gmlive*/if (TEST) { if (live_call()) return live_result; }

event_inherited();

switch(npcID) {
	case "NPC":
	default:
		switch(face) {
			case "left":
				sprite_index = sprNPCLeft;
				break;
			case "right":
				sprite_index = sprNPCRight;
				break;
			case "up":
				sprite_index = sprNPCUp;
				break;
			case "down":
				sprite_index = sprNPCDown;
				break;
		}
		break;
}
draw_sprite_part(sprite_index, image_index, npcImg*32, 0, 32, 40, x, y-8);