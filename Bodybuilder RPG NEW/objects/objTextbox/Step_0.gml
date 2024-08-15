if (finished) {
	drawAlpha -= 0.25;
	
	if (drawAlpha <= 0)
		instance_destroy();
		
	exit;
}

if (next) {
	glowAlpha += glowAlphaChange;
	if (glowAlpha >= 1) { glowAlphaChange = -0.025; }
	else 	if (glowAlpha <= 0) { glowAlphaChange = 0.025; }
	
	nextAlpha += .2;
}


	
keyConfirmPress = input_check_pressed("confirm");

// change selection during prompts
if (next and numberOfTexts == 1 and prompt != false) {
	if (input_check_pressed("left")) { 
		selection = 0; 
	} else if (input_check_pressed("right")) { 
		selection = 1; 
	}
}
		
// go to next set of text
if (keyConfirmPress and canPress) {
	
	if (next) {
		
		
		if (numberOfTexts > 0) {
			
			numberOfTexts--;
			
			if (numberOfTexts == 0) { 
				objPlayer.canMove = true;
				finished = true;
				indexCheck = 0;
			} else {
				next = false;
				newChars = 0;
				i++;
				j = 1;
				drawText = "";
				indexCheck = 0;
				nextAlpha = 0;
				glowAlpha = 0;
				alarm[0] = aTime;
			}
			
		}
		
	} else if (!skip) { 
		skip = true;
		alarm[0] = aTime;
	}
	
}
