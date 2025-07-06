function levelUp() {
    // levels up players after killing some bad dudes

    /*gmlive*/ if (TEST) { if (live_call()) return live_result; }

    global.stats.xp = 0;
    debug($"xp to next: {global.stats.xpNext}");
    global.stats.level++;
    if (room == rBattle)
        playSound(sndLevelUp);

    // get new stats
    setStats();

    return;
}