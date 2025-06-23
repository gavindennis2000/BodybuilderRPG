function startBattle(enemies = ["robber"], special = false, music = sndBattle, party = global.party) {
    // initiates a battle

    /*gmlive*/ if (TEST) { if (live_call()) return live_result; }

    debug("starting battle");

    // don't start a battle if there are no encounters allowed
    if (global.noEncounters && !special)
        exit;

    global.battle = true;
    global.battleData = {
        party: party, 
        enemies: enemies, 
    }

    playSound(sndBattleStart);

    if (instance_exists(objMusic))
        objMusic.playBattleMusic(music);

    with (objCamera)
        startBattleTransition();
}