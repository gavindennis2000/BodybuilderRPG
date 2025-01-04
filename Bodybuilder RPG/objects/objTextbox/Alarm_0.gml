/*gmlive*/if (TEST) { if (live_call()) return live_result; }
if (numberOfTexts == 1 and prompt != false) { canPress = false; alarm[1] = 15; }

if (!skip) {  // read the text normally
	stringLength = string_length(text[i]);
	if (string_length(drawText) < stringLength + newChars ) {
		
		// get the current character
		var currentI = string_char_at(text[i], j);

		// reset during manual newlines
		if (currentI == "`") {
			currentI = "\n";
			show_debug_message("worked");
			indexCheck = 0;
		}
		
		// append the current line
		drawText = string_concat(drawText, currentI);
		j++;
		indexCheck++;
	
		// reset when the line is too long
		if (currentI == " " && indexCheck > 50) {
			drawText = string_concat(drawText, "\n");
			indexCheck = 0;
			newChars++;
		}
		

		alarm[0] = aTime;

	} else { next = true; indexCheck = 0;}
	
} else {  // skip to the end
	stringLength = string_length(text[i]);
	while (string_length(drawText) < stringLength + newChars ) {

		// get the current character
		var currentI = string_char_at(text[i], j);

		// reset during manual newlines
		if (currentI == "`") {
			currentI = "\n";
			show_debug_message("worked");
			indexCheck = 0;
		}
		
		// append the current line
		drawText = string_concat(drawText, currentI);
		j++;
		indexCheck++;
	
		// reset when the line is too long
		if (currentI == " " && indexCheck > 50) {
			drawText = string_concat(drawText, "\n");
			indexCheck = 0;
			newChars++;
		}

	} 
	next = true;
	skip = false;
	indexCheck = 0;
	
}
