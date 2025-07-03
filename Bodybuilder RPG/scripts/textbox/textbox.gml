function textbox(text, canMove = true, stopMove = true, forceScreen = -1) {
	// simple, easy way to create a textbox and configure the player's movement

	/*gmlive*/ if (TEST) { if (live_call(text, canMove, stopMove, forceScreen)) return live_result; }
	if (instance_exists(objPlayer))
		objPlayer.canMove = stopMove ? false : true;
	instance_create_layer(0, 0, "Instances", objTextbox, {
		text: text, 
		canMove: canMove,
		forceScreen: forceScreen
	});
}