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
	draw_text_color(camX + 241, camY + 17, theRoom, b, b, b, b, roomAlpha);
	draw_text_color(camX + 240, camY + 16, theRoom, w, w, w, w, roomAlpha);
	
}