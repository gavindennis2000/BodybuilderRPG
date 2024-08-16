switch (face) {
	
	case "left":
		sprite_index = sprPlayerLeft;
		break;
	case "right":
		sprite_index = sprPlayerRight;
		break;
	case "up":
		sprite_index = sprPlayerUp;
		break;
	case "down":
		sprite_index = sprPlayerDown;
		break;
}
image_speed = running ? 0.4 : 0.2;
if (state == "stand") {image_index = 0; }

var yDis = 4;
y -= yDis;
draw_self();
y += yDis;

// fade during room changes
if (fadeAlpha > 0) {
	var alpha = draw_get_alpha();
	draw_set_alpha(fadeAlpha);
	var camX = camera_get_view_x(view_camera[0]);
	var camY = camera_get_view_y(view_camera[0]);
	var b = c_black;
	draw_rectangle_color(camX, camY, camX+480, camY + 270, b, b, b, b, false);
	draw_set_alpha(alpha);
}
if (test) {

}