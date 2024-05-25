function findTarget(action) {
	// checks action to see if it should target enemy or player	
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