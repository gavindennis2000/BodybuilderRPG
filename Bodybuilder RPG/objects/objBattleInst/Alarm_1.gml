// objBattleInst alarm 1

// stop displaying damage after being attacked

/*gmlive*/ if (TEST) { if (live_call()) return live_result; }

showDamage = false;
dmgY = dmgYStart;
dmgToShow = -1;

if (stats.hp == 0 && side == "enemies")
    death();