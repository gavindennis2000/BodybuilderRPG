var keyPause = input_check_pressed("start");

if (instance_exists(objPlayer)) {
	if (keyPause) {
		// pause the game
		if (!paused and !unpause and objPlayer.canMove) {
			paused = true;
			with (objPlayer) { canMove = false; }
			alarm[0] = 1;
		}
		else if (fadeBlack >= 1 and !unpause) {
			unpause = true;
			alarm[0] = 1;
		}
	}
}