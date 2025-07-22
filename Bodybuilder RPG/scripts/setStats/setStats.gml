function setStats(override = -1){
    // sets the new player stats based on the current level

    /*gmlive*/ if (TEST) { if (live_call(override)) return live_result; }

    if (override != -1)
       global.stats.level = override;
        
    var lvl = global.stats.level - 1;
    
    global.stats.xpNext = round(100 * power(1.1, global.stats.level));

	 // hp
    var oldHP = variable_clone(global.stats.andro.maxhp) + 0;
    global.stats.andro.maxhp = global.ANDRO_BASE_STATS.hp + lvl * 40;
    global.stats.andro.hp += global.stats.andro.maxhp - oldHP;

    oldHP = variable_clone(global.stats.ana.maxhp) + 0;
    global.stats.ana.maxhp = global.ANA_BASE_STATS.hp + lvl * 30;
    global.stats.ana.hp += global.stats.ana.maxhp - oldHP;

    oldHP = variable_clone(global.stats.doms.maxhp) + 0;
    global.stats.doms.maxhp = global.DOMS_BASE_STATS.hp + lvl * 50;
    global.stats.doms.hp += global.stats.doms.maxhp - oldHP;

    // skill
    global.stats.andro.maxskill = global.stats.level < 5 ? 1 : (1 + 3 * (global.stats.level div 5))
    global.stats.ana.maxskill = global.stats.level < 5 ? 5 : (5 + 5 * (global.stats.level div 5))
    global.stats.doms.maxskill = global.stats.level < 5 ? 1 : (1 + 2 * (global.stats.level div 5))

    // strength
    global.stats.andro.strength = (floor(global.ANDRO_BASE_STATS.strength + lvl * 1.4) <= 99) ? floor(global.ANDRO_BASE_STATS.strength + lvl * 1.4) : 99;
    global.stats.ana.strength = (floor(global.ANA_BASE_STATS.strength + lvl * 0.95) <= 99) ? floor(global.ANA_BASE_STATS.strength + lvl * 0.95) : 99;
    global.stats.doms.strength = (floor(global.DOMS_BASE_STATS.strength + lvl * 0.9) <= 99) ? floor(global.DOMS_BASE_STATS.strength + lvl * 0.9) : 99;

    var change = 0.62;
    global.stats.andro.cardio = (floor(global.ANDRO_BASE_STATS.cardio + lvl * change) <= 99) ? floor(global.ANDRO_BASE_STATS.cardio + lvl * change) : 99;
    change = 0.7;
    global.stats.ana.cardio = (floor(global.ANA_BASE_STATS.cardio + lvl * change) <= 99) ? floor(global.ANA_BASE_STATS.cardio + lvl * change) : 99;
    change = 0.68;
    global.stats.doms.cardio = (floor(global.DOMS_BASE_STATS.cardio+ lvl * change) <= 99) ? floor(global.DOMS_BASE_STATS.cardio + lvl * change) : 99;

    return;
}