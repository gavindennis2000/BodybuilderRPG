keyPause = input_check_pressed("start");

if (variable_global_exists("chapter")) {
	if (global.chapter != chapter) { chapter = global.chapter };
} else { chapter = "I - Premonition"; }

if (!instance_exists(objPlayer))
	exit;
	
if (keyPause and !unpause and !objPlayer.walking and (global.playerCanMove or (pause and !global.playerCanMove))) {
	
	if (!pause) {
		pause = true;
		yChange = 270;
		xChange = 480;
		image_alpha = 0;
		
		global.playerCanMove = false;
		
	}
	
	else if (image_alpha == 1) {
		unpause = true;
		
	}
}


if (unpause) {
	if (image_alpha > 0) { image_alpha -= 0.1 }
	else { 
		global.playerCanMove = true; 
		unpause = false;	
		pause = false;
	};
} 
else if (pause and image_alpha < 1) {
	image_alpha += 0.1;
}
