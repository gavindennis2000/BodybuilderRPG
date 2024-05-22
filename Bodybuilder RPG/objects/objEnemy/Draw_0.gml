switch (fighter) {
	default:
		switch(state) {
			case "wait":
			default:
				sprite_index = sprPlayerRight;
				image_speed = 0;
				image_index = 0;
				break;
		}
		break;
}

if (fighter == "npc") {
	x -= 16; y -= 16;
	event_inherited();
	x += 16; y += 16;
}
else event_inherited();