if (TEST) { image_alpha = 0.5; draw_self(); }

//if (instance_exists(objPause)) {
//	if (!objPause.pause)
//		draw_set_alpha(0);
//}

var camX = camera_get_view_x(view_camera[0]);
var camY = camera_get_view_y(view_camera[0]);
var b = c_black;

if (drawAlpha > 0) {
	draw_set_alpha(drawAlpha);
	draw_rectangle_color(camX, camY, camX + 480, camY + 270, b, b, b, b, false);
}