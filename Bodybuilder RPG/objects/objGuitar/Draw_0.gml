draw_text(0, 32, string_concat("health: ", health));
draw_text(0, 64, string_concat("score: ", score));

if (rectangleX[9] < room_width) {
	for (var i = 0; i < 10; i ++) {
		draw_rectangle_color(rectangleX[i], i*27, room_width, i*27+26,c_black, c_black, c_black, c_black, false);
	}
}

image_speed = 0.25;
switch(global.workout) {
	case "novice leg":	
		draw_sprite(sprSquat, imgIndex, playerX, room_height*3/4 + 16);
		break;
		
	case "intermediate push":
	default:
		draw_sprite(sprBench, imgIndex, playerX, room_height*3/4 + 16);
		break;
}