/*set up gmlive for this function*/ if (TEST) { if (live_call()) return live_result; }

// fade during room changes
if (fadeAlpha > 0) {
	var alpha = draw_get_alpha();
	draw_set_alpha(fadeAlpha);
	var color = (teleport != 0 || teleportExit != 0) ? c_white : c_black;
	draw_rectangle_color(0, 0, 480, 270, color, color, color, color, false);
	draw_set_alpha(alpha);
}