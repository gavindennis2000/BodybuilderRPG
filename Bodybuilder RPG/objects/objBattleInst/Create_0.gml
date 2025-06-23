// objBattleInst create

/*gmlive*/ if (TEST) { if (live_call()) return live_result; }

stats = getStats(battleID);

runAway = function() {
    // runs away from battle
    face = "left";
    state = "run";
    hspeed = -7;
}