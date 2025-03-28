/*set up gmlive for this function*/ if (TEST) { if (live_call()) return live_result; }

// fade in new room

if (fadeAlpha > 0) {
	image_index = 0;
	image_speed = 0;
	fadeAlpha -= 0.2;
	alarm[1] = 2;
}
else {
	depth = -100;
	canMove = (!instance_exists(objTextbox));

	if (room == rSpace) {
		debug(global.chapter);

		if (global.chapter == 0) {
			canMove = false;
		}
	}
}