/*gmlive*/if (TEST) { if (live_call()) return live_result; }

// draw the bunnyhood
if (global.bunnyHood and instance_exists(objPlayer)) {
	var spr = -1;
	switch (objPlayer.face) {
		case "left":
		default:
			spr = sprBunnyHoodLeft;
			break;
		case "right":
			spr = sprBunnyHoodRight;
			break;
		case "up":
			spr = sprBunnyHoodUp;
			break;
		case "down":
			spr = sprBunnyHoodDown;
			break;
	}
	draw_sprite(spr, objPlayer.image_index, objPlayer.x, objPlayer.y - 4);
}