// objBattleInst alarm 1

// stop displaying damage after being attacked

/*gmlive*/ if (TEST) { if (live_call()) return live_result; }

showDamage = false;
// state = "wait";
dmgY = dmgYStart;

if (stats.hp == 0 && side == "enemies")
    death();