// objBattle alarm 0 - fight is over

/*gmlive*/ if (TEST) { if (live_call()) return live_result; }

if (state == "start") {
    state = "first turn"
    marquee.counter = 90;
    alarm[0] = marquee.counter;
}
else if (state == "first turn") {
    turn = getNextTurn(battleQueue);
    state = turn.side == "party" ? "ready" : "enemy turn";
}
else if (state == "attacking") {
    if (!attackStatus.ready) {
        marquee.text = "";
        alarm_set(0, 1);
        exit;
    }
    // check if any fighters are dead
    checkFighterHP();

    // if the battle's over, don't do anything else
    if (state == "victory" || state == "loss")
        exit;
        
    battleQueue = sortBattleQueue(battleQueue);
    turn = getNextTurn(battleQueue);
    predictQueue = setPredictQueue(battleQueue);
    screen = "main";
    optionsOffset = optionsOffsetStart;
    previousSelections = [];
    state = turn.side == "party" ? "ready" : "enemy turn";
    selection = 0;
}