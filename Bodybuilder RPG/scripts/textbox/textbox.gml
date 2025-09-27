function textbox(text, canMove = true) {
	// simple, easy way to create a textbox and configure the player's movement
	/*gmlive*/ if (TEST) { if (live_call(text, canMove)) return live_result; }

	var final;
	if (is_array)
		final = variable_clone(text);
	else if (is_struct)
		final = [text];
	else if (is_string(text))
		final = [{
			text: text
		}];

	debug(final)
	instance_create_layer(0, 0, "Instances", oTextbox, {
		textArr: final, 
		canMove: canMove,
	});
}