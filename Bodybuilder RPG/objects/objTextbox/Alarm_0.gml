if (numberOfTexts == 1 and prompt != false) { canPress = false; alarm[1] = 15; }

if (!skip) {  // read the text normally
	stringLength = string_length(text[i]);
	if (string_length(drawText) < stringLength + newChars ) {
		
		var currentI = string_char_at(text[i], j);
		
		drawText = string_concat(drawText, currentI);
		j++;
		indexCheck++;
	
		if ( (currentI == " ") and indexCheck > 50) {  // check if text is past margin
			drawText = string_concat(drawText, "\n");
			indexCheck = 0;
			newChars++;
		}

		alarm[0] = aTime;

	} else { next = true; indexCheck = 0;}
	
} else {  // skip to the end
	stringLength = string_length(text[i]);
	while (string_length(drawText) < stringLength + newChars ) {

		var currentI = string_char_at(text[i], j);
		
		drawText = string_concat(drawText, currentI);
		j++;
		indexCheck++;
	
		if ( (currentI == " ") and indexCheck > 50) {  // check if text is past margin
			drawText = string_concat(drawText, "\n");
			indexCheck = 0;
			newChars++;
		}

	} 
	next = true;
	skip = false;
	indexCheck = 0;
	
}
