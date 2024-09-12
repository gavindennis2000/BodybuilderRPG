var camX = camera_get_view_x(view_camera[0]);
var camY = camera_get_view_y(view_camera[0]);


fontX(fa_left); fontY(fa_bottom);
draw_set_font(fontText);

var str = string_concat(
	"Restart Room: R",
	"\nRestart Game: G",
	"\nBunny Hood: H - ", string(global.bunnyHood),
	"\nBicycle: B - ", string(global.bicycle),
	"\nLive Room: L - ", string(live),
	"\nHide DevTools: F"
)
if (showDevTools) {
	draw_text_border(camX, camY + 270, str, c_white, 0.5);
}
else {
	draw_text_border(camX, camY + 270, "Show DevTools: F", c_white, 0.5);
}