keyPause = input_check_pressed("start");
var dAlpha = draw_get_alpha();

if (variable_global_exists("chapter")) {
	if (global.chapter != chapter) { chapter = global.chapter };
} else { chapter = "I - Premonition"; }

if (!instance_exists(objPlayer))
	exit;
	
if (keyPause and !unpause and (global.playerCanMove or (pause and !global.playerCanMove))) {
	
	if (!pause) {
		pause = true;
		yChange = 270;
		xChange = 480;
		draw_set_alpha(0);
		
		global.playerCanMove = false;
		
	}
	
	else if (dAlpha == 1) {
		unpause = true;
		
	}
}


if (unpause) {
	if (dAlpha > 0) { draw_set_alpha(dAlpha - 0.1) }
	else { 
		global.playerCanMove = true; 
		unpause = false;	
		pause = false;
	};
} 
else if (pause and dAlpha < 1) {
	draw_set_alpha(dAlpha+0.1);
}
