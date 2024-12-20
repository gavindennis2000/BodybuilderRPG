/*gmlive*/if (TEST) { if (live_call()) return live_result; }

var camX = camera_get_view_x(view_camera[0]);
var camY = camera_get_view_y(view_camera[0]);

draw_text(camX, camY + 32, string_concat("health: ", health));
draw_text(camX, camY + 64, string_concat("score: ", score));

image_speed = 0.25;
var spr;
switch(global.workout) {
	case "novice leg":	
		spr = sprSquat;
		break;
	case "intermediate push":
		spr = sprBench;
		break;
}

draw_sprite(spr, imgIndex, camX + playerX, camY + 270*3/4 + 16);