function levelUp(){
    // levels up players after killing some bad dudes

    /*gmlive*/ if (TEST) { if (live_call()) return live_result; }

    global.stats.xp = 0;
    global.stats.xpNext *= 1.1;
    global.stats.level++;
    playSound(sndLevelUp);
}