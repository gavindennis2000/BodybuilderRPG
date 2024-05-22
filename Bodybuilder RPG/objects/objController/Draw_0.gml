///@description display the room you're in

camX = camera_get_view_x(view_camera[0]);
camY = camera_get_view_y(view_camera[0]);

var w = c_white;
var b = c_black;

if (displayRoom != 0 and theRoom != -1) {
	if (roomAlpha < 1 and displayRoom == 1) { roomAlpha += 0.05; }
	else if (roomAlpha > 0 and displayRoom == 2) { roomAlpha -= 0.05; }
	
	draw_set_halign(fa_center);
	draw_set_valign(fa_top);
	draw_text_border(camX + 241, camY + 5, theRoom, w, roomAlpha);
	
}

if (displaySub != 0 and subtitle != -1) {
	if (subAlpha < 1 and displaySub == 1) { subAlpha += 0.05; }
	else if (subAlpha > 0 and displaySub == 2) { subAlpha -= 0.05; }
	
	draw_set_halign(fa_right);
	draw_set_valign(fa_bottom);
	var i = 5;
	draw_text_border(camX + 480 - i, camY + 270 - i, subtitle, w, subAlpha);
}