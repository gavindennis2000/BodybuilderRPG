if (fadeBlack > 0 and fadeIn) { fadeBlack -= 8; }
else if (fadeIn) {
	fadeBlack = 0;
	drawLifters = true;
}

if (drawLifters) {
	if (playerX > playerFinalX) {
		var dist = abs(playerX - playerFinalX)/10;
		playerX -= dist;
		otherX += dist;
	}
	if (countdown == 0 and countdownNum != "BEGIN!") {
		countdown = 1;
		playSound(snd321go);
	}
	else if (countdown == 2) {
		countdown = 3;
	}
	
	// slow down player animation
	if (image_speed > 0) {
		image_speed -= 0.001;	
	}
	if (round(image_index) mod 4 == 3 and round(image_index) != lastRep) {
		lastRep = round(image_index);
		playerPullups++;
	}
}

// level up the player if he gets enough
if (
	(global.pull < 2 and playerPullups >= 30) or 
	(global.pull < 3 and playerPullups >= 53) or 
	(global.pull < 4 and playerPullups >= 100)
	) {	levelUp(); 	}