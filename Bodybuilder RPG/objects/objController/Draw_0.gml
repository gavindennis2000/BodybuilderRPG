/*gmlive*/if (TEST) { if (live_call()) return live_result; }

var camX = camera_get_view_x(view_camera[0]);
var camY = camera_get_view_y(view_camera[0]);

// cutscene stuff
if (global.cutscene) {
    // fade in the cutscene bars
    if (cutsceneH < 25) cutsceneH++;
} else {
    if (cutsceneH > 0) cutsceneH--;
}
if (cutsceneH > 0) {
    // actually draw the bars
    var b = c_black;
    draw_rectangle_color(camX, camY, camX + 480, camY + cutsceneH, b, b, b, b, false);
    draw_rectangle_color(camX, camY + 270, camX + 480, camY + 270 - cutsceneH, b, b, b, b, false);
}

// new room text
if (drawRoom) {
	draw_set_font(fontText);
	fontX(fa_right); fontY(fa_top);
	draw_text_border(camX + 480 - 12, camY + 4, global.roomVar, c_white, roomAlpha);
}
if (drawSub) {
	draw_set_font(fontText);
	fontX(fa_right); fontY(fa_bottom);
	draw_text_border(camX + 480 - 12, camY + 270 - 4, global.subRoom, c_white, subAlpha);
}

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