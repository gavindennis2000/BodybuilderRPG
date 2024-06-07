// get enemies depending on area
function getEnemies() {
	var enemies = -1;
	switch (global.roomVar) {
		default:
			enemies = ["npc"];
	}
	return enemies;
}

// checks action to see if it should target enemy or player	
function findTarget(action) {
	
	// player actions
	if (!turn.isEnemy) {
		switch(action) {
			case "Attack":  // attack
			default:
				var i = 0;
				while (enemyIDs[i].ko) { i++; }
				target = enemyIDs[i];
				targetType = "Enemy";
				break;
			// run
			case "Run":
				target = turn;
				targetType = "Party";
				break;
			// skills
			case "Brace":  
				target = turn;
				targetType = "Self";
				break;
			// gymbag
			case "Hydro20":
				target = turn;
				targetType = "Ally";
				break;
		}
	}
	
	// enemy actions
	else if (turn.isEnemy) {
		switch(action) {
			case "Attack":  // attack
			default:
				var i = irandom_range(0, array_length(fighterIDs)-1);
				while (fighterIDs[i].ko) { 
					i++; 
					if (i > array_length(fighterIDs)-1) { i = 0; }
				}
				target = fighterIDs[i];
				targetType = "Enemy";
				break;
			// run
			case "Run":
				target = turn;
				targetType = "Party";
				break;
			// skills
			case "Brace":  
				target = turn;
				targetType = "Self";
				break;
			// gymbag
			case "Hydro20":
				target = turn;
				targetType = "Ally";
				break;
		
		}
	}
	//else target = fighterIDs[0];
}
	