/*gmlive*/if (TEST) { if (live_call()) return live_result; }

var camX = camera_get_view_x(view_camera[0]);
var camY = camera_get_view_y(view_camera[0]);

draw_text(camX, camY + 32, string_concat("health: ", health));
draw_text(camX, camY + 64, string_concat("score: ", score));

image_speed = 0.25;
var spr;
switch(global.workout) {
	case "novice leg":	
	global.outfit.color = 0;
		draw_sprite_part_ext(sprSquat, imgIndex, 0 + 64*global.outfit.color, 0, 64, 32, camX + playerX, camY + 170, 2, 2, image_blend, image_alpha);
		break;
	case "intermediate push":
    default:
		spr = sprBench;
		break;
}