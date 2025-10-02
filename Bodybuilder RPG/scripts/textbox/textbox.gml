function textbox(text, canMove = true) {
	// simple, easy way to create a textbox and configure the player's movement
	/*gmlive*/ if (TEST) { if (live_call(text, canMove)) return live_result; }

	// fix the value passed into the function to make it work with textbox object
	var final;
	if (is_array(text))
		final = variable_clone(text);
	else if (is_struct(text))
		final = [text];
	else if (is_string(text)) {
		debug("here")
		final = [{
			text: text
		}];
	}

	// create the textbox and pass it the fixed value
	instance_create_layer(0, 0, "Instances", oTextbox, {
		textArr: final, 
		canMove: canMove,
	});
}