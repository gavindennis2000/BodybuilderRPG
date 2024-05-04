if (finished) {
	drawAlpha -= 0.25;
	
	if (drawAlpha <= 0)
		instance_destroy();
		
	exit;
}


	
keyConfirmPress = input_check_pressed("confirm");	
	
if (keyConfirmPress) {
	
	if (next) {
		
		if (numberOfTexts > 0) {
			
			numberOfTexts--;
			
			if (numberOfTexts == 0) { 
				global.playerCanMove = true;
				finished = true;
				indexCheck = 0;
			} else {
				next = false;
				newChars = 0;
				i++;
				j = 1;
				drawText = "";
				indexCheck = 0;
				alarm[0] = aTime;
			}
			
		}
		
	} else if (!skip) { 
		skip = true;
		alarm[0] = 1;
	}
	
}