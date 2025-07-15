function setStats(override = -1){
    // sets the new player stats based on the current level

    /*gmlive*/ if (TEST) { if (live_call(override)) return live_result; }

    if (override != -1)
       global.stats.level = override;
        
    var lvl = global.stats.level - 1;
    
    global.stats.xpNext = round(100 * power(1.1, global.stats.level));

	 // hp
    var oldHP = global.stats.andro.maxhp + 0;
    global.stats.andro.maxhp = 200 + lvl * 40;
    global.stats.andro.hp += global.stats.andro.maxhp - oldHP;

    oldHP = global.stats.ana.maxhp + 0;
    global.stats.ana.maxhp = 120 + lvl * 30;
    global.stats.ana.hp += global.stats.ana.maxhp - oldHP;

    oldHP = global.stats.doms.maxhp + 0;
    global.stats.doms.maxhp = 300 + lvl * 50;
    global.stats.doms.hp += global.stats.doms.maxhp - oldHP;

    // skill
    global.stats.andro.maxskill = global.stats.level < 5 ? 1 : (1 + 3 * (global.stats.level div 5))
    global.stats.ana.maxskill = global.stats.level < 5 ? 5 : (5 + 5 * (global.stats.level div 5))
    global.stats.doms.maxskill = global.stats.level < 5 ? 1 : (1 + 2 * (global.stats.level div 5))

    // strength
    global.stats.andro.strength = (floor(10 + lvl * 1.4) <= 99) ? floor(10 + lvl * 1.4) : 99;
    global.stats.ana.strength = (floor(10 + lvl * 0.95) <= 99) ? floor(10 + lvl * 0.95) : 99;
    global.stats.doms.strength = (floor(20 + lvl * 0.9) <= 99) ? floor(20 + lvl * 0.9) : 99;

    global.stats.andro.endurance = (floor(10 + lvl * 0.8) <= 99) ? floor(10 + lvl * 0.8) : 99;
    global.stats.ana.endurance = (floor(10 + lvl * 0.9) <= 99) ? floor(10 + lvl * 0.9) : 99;
    global.stats.doms.endurance = (floor(10 + lvl * 1.1) <= 99) ? floor(10 + lvl * 1.1) : 99;

    var change = 0.62;
    global.stats.andro.cardio = (floor(20 + lvl * change) <= 99) ? floor(20 + lvl * change) : 99;
    change = 0.7;
    global.stats.ana.cardio = (floor(10 + lvl * change) <= 99) ? floor(10 + lvl * change) : 99;
    change = 0.68;
    global.stats.doms.cardio = (floor(10 + lvl * change) <= 99) ? floor(10 + lvl * change) : 99;

    return;
}