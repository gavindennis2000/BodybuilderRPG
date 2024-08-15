event_inherited();
y -=4;
switch(npcID) {
	case "NPC":
	default:
		switch(face) {
			case "left":
				sprite_index = sprNPCLeft;
				break;
			case "right":
				sprite_index = SprNPCRight;
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
draw_self();

y += 4;