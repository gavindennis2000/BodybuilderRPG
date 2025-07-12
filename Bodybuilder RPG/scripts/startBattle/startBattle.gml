function startBattle(enemies = -1, canRun = true, party = global.party, music = sndBattle) {
    // initiates a battle

    /*gmlive*/ if (TEST) { if (live_call(enemies, canRun, party, music)) return live_result; }

    if (instance_exists(objPlayer))
        objPlayer.canMove = false;

    // end any ongoing cutscene
    if (global.cutscene) {
        global.cutscene = false;
        global.cutsceneSong = -1;
    }

    if (enemies == -1)
        enemies = ["robber"];

    global.battle = true;
    global.battleData = {
        party: party, 
        enemies: enemies,
        canRun: canRun
    }
    // debug(global.battleData, -1);

    playSound(sndBattleStart);

    if (instance_exists(objMusic))
        objMusic.playBattleMusic(music);
    
    with (objCamera)
        startBattleTransition();
}