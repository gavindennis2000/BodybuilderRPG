function getStats(battleID) {
	// gets stats for enemy fighters
	
	/*gmlive*/ if (TEST) { if (live_call(battleID)) return live_result; }

	var stats;
	
	switch (battleID) {
		case "andro":
			stats = global.stats.andro;
			break;
		case "ana":
			stats = global.stats.ana;
			break;
		case "doms":
			stats = global.stats.doms;
			break;
		default:
			stats = {
			    xp: 50,
			    hp: 100,
			    maxhp: 100,
			    strength: 10,
			    endurance: 10,
			    cardio: 10,
			}
			break;
	}
	
	return stats;
}