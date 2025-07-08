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
		case "smol powerlifter":
			stats = {
			    xp: 50,
			    hp: 200,
			    maxhp: 100,
			    strength: 5.5,
			    endurance: 10,
			    cardio: 30,
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
	
	// for enemies, set the max hp
	if (!variable_struct_exists(stats, "maxhp"))
		stats.maxhp = stats.hp;

	// set the skill for players to max skill each fight
	if (variable_struct_exists(stats, "maxskill"))
		stats.skill = stats.maxskill;
		
	return stats;
}