function startBattle(special = false, enemies = -1, canRun = true, party = global.party, music = sndBattle) {
    // initiates a battle

    /*gmlive*/ if (TEST) { if (live_call(special, enemies, canRun, party, music)) return live_result; }

    if (instance_exists(objPlayer))
        objPlayer.canMove = false;

    // don't start a battle if there are no encounters allowed
    if (global.noEncounters && !special) {
        debug("Can't start battle. Check special flag.", -1);
        exit;
    }

    if (enemies == -1)
        enemies = ["robber"];

    global.battle = true;
    global.battleData = {
        party: party, 
        enemies: enemies,
        canRun: canRun
    }
    debug(global.battleData, -1, "startBattle");

    playSound(sndBattleStart);

    if (instance_exists(objMusic))
        objMusic.playBattleMusic(music);
    
    with (objCamera)
        startBattleTransition();
}