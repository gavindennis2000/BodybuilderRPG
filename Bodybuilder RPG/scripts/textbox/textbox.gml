function textbox(text, canMove = true, stopMove = true) {
	// simple, easy way to create a textbox and configure the player's movement

	/*gmlive*/ if (TEST) { if (live_call(text, canMove, stopMove)) return live_result; }
	if (instance_exists(objPlayer))
		objPlayer.canMove = stopMove ? false : true;
	instance_create_layer(0, 0, "Instances", objTextbox, {
		text: text, 
		canMove: canMove,
	});
}