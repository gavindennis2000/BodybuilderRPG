var camX = camera_get_view_x(view_camera[0]);
var camY = camera_get_view_y(view_camera[0]);
var c = c_black;

if (paused) {
	var tempAlpha = draw_get_alpha();
	draw_set_alpha(fadeBlack)
	draw_rectangle_color(camX, camY, camX + 480, camY + 270, c, c, c, c, false);
	draw_set_alpha(tempAlpha);
}