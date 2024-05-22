if (fightStart and image_alpha < 1) {
	image_alpha += 0.1;
	if (image_alpha == 1) { 
		fightStart = false; 
		if (instance_exists(objBattle) and fighterID == 0) { 
			objBattle.battleStart = true; 
			objBattle.drawText("Joe Mama has attacked.")
		}
	}
}