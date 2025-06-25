// objBattleInst create

/*gmlive*/ if (TEST) { if (live_call()) return live_result; }

stats = getStats(battleID);

moves = getMoves(battleID);
moveIndex = 0;

// battle animation stuff
targetX = -1;
halfwayX = -1;
targetY = -1;

// show damage when hit by oppressor
myVictim = -1;
dmgToGive = -1;
dmgToShow = -1;
dmgY = 20;
dmgYStart = dmgY
dmgYFinal = 40;
showDamage = false;

// functions

attack = function(victim, dmg) {
    // attacks another fighter

    /*gmlive*/ if (TEST) { if (live_call(victim, dmg)) return live_result; }

    myVictim = victim;

    state = "run";
    targetX = (side == "party") ? myVictim.x - 32 : myVictim.x + 32;
    targetY = myVictim.y;

    dmgToGive = dmg;

    alarm_set(0, 1);

    return;
}

getSFX = function(battleID) {
    // get's the appropriate sound effects

    /*gmlive*/ if (TEST) { if (live_call(battleID)) return live_result; }

    switch(battleID) {
        case "andro":
            return sndHitAndro;
        case "ana":
            return sndHitAna;
        case "doms":
            return sndHitDoms;
        default:
            return sndHitAndro;
    }
}

runAway = function() {
    // runs away from battle
    face = "left";
    state = "run";
    hspeed = -7;
}