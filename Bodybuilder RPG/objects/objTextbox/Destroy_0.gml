// objTextbox Destroy

/*set up gmlive for this function*/ if (TEST) { if (live_call()) return live_result; }

if (action != false && action != -1) {
	if (is_array(action)) {
		// easy way to keep making more text
		if (instance_exists(objPlayer)) {
			objPlayer.canMove = false;
		}
		createTextbox(action[0], action[1], action[2], action[3]);
	}
	else {
    	instance_create_layer(x, y, "Instances", objAction, { 
			prompt: action 
		});
	}
}
else if (prompt != false && prompt != -1 && is_array(prompt)) {
	if (is_array(prompt[2])) {
		// easy way to keep making more text
		if (instance_exists(objPlayer)) {
			objPlayer.canMove = false;
		}
		if (selection == 0) {
			createTextbox(prompt[2][0], prompt[2][1], prompt[2][2], prompt[2][3]);
		}
		else {
			createTextbox(prompt[2][4], prompt[2][1], prompt[2][2], prompt[2][3]);
		}
	}
	else {
		playSound(sndCursor);
		instance_create_layer(x, y, "Instances", objAction, { 
			selection: selection, 
			prompt: prompt[2] 
		});
	}
}
else {
	if (instance_exists(objPlayer)) {
		objPlayer.canMove = true;
	}
}