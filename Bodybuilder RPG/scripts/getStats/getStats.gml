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
		case "robber":
			stats = {
				xp: 50,
			    hp: 180,
			    strength: 8,
			    endurance: 10,
			    cardio: 10,
			}
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
	
	if (!variable_struct_exists(stats, "maxhp"))
		stats.maxhp = stats.hp;
	if (variable_struct_exists(stats, "maxskill"))
		stats.skill = stats.maxskill;
	return stats;
}