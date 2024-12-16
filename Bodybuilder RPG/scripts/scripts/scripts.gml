function dialogHandler(npcID) {
	switch(npcID) {
		case "mason":
			switch(global.chapter) {
					case 1:
						prompt = ["Let's do it!", "Not right now", 10];
						if (global.keyEvents[2][0] == "meet mason" and global.keyEvents[2][1] == false) {
							text = [
								[
								string_concat("Hey. Are you ", global.characterName, "?"), 
								"HARVEY told me about you. He said you were trying to get serious about bodybuilding, right?", 
								"I'm a pretty dedicated lifter myself. I could definitely help you out if you needed.",
								"Say, you in the mood for some pull-ups?"
								],
								[
								"Change your mind about the pull-ups?"
								]
							];
						}
						else {
							switch(global.pull) {
								case 1:
									text = [
										["Hey. Down to hit some pull-ups?"]
									];
									break;
								case 2:
									if (textIndex == 0)
									text = [
										["You still have some catching up to do!", "Don't fret. It takes a long time to build a huge back!"],		
										["Hey. Down to hit some pull-ups?"]
									]
									break;
							}
						}
						break;
						
					case 2:
						break;
				}	
			break;
	}
}

function draw_text_border(x, y, string, color, alpha, border = c_black) {
	var c = border;
	draw_text_color(x+1, y+1, string, c, c, c, c, alpha);
	draw_text_color(x, y, string, color, color, color, color, alpha);	
}

function fontX(halign) {
	draw_set_halign(halign);
}

function fontY(valign) {
	draw_set_valign(valign);
}

function save_game() {
	
}

function load_game() {
	
}

function string_replace_at(str, n, insert) {
	if (string_length(str)>=n) {
    
	    var tempString = "";
	    tempString = string_insert(insert,str,n);
	    tempString = string_delete(tempString,n+1,1);
	    return tempString;
    
	}
	else {
    
	    return str;
    
	}	
}