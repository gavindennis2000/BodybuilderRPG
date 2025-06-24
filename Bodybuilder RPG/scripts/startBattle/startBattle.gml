function startBattle(enemies = -1, special = false, music = sndBattle, canRun = true, party = global.party) {
    // initiates a battle

    /*gmlive*/ if (TEST) { if (live_call(enemies, special, music, canRun, party)) return live_result; }

    // don't start a battle if there are no encounters allowed
    if (global.noEncounters && !special)
        exit;

    if (enemies == -1)
        enemies = ["robber"];

    global.battle = true;
    global.battleData = {
        party: party, 
        enemies: enemies,
        canRun: canRun
    }

    playSound(sndBattleStart);

    if (instance_exists(objMusic))
        objMusic.playBattleMusic(music);

    with (objCamera)
        startBattleTransition();
}