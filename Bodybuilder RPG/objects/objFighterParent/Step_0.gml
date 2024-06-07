if (fightStart and image_alpha < 1) {
	image_alpha += 0.1;
	if (image_alpha == 1) { 
		fightStart = false; 
		if (instance_exists(objBattle) and fighterID == 0) { 
			objBattle.battleStart = true; 
			objBattle.drawText("Enemy Attack")
		}
	}
}

if (act and attackWait) {
	if (!isEnemy and x <= tX) or (isEnemy and x >= tX) {
		x = tX;
		y = tY;
		yChange = y - ystart;
		state = "attack";
		speed = 0;
		alarm[1] = 30;
		act = false
	}
}