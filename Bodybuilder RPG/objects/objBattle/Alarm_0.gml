// objBattle alarm 0

/*gmlive*/ if (TEST) { if (live_call()) return live_result; }

if (state == "start") {
    state = "first turn"
    marquee.counter = 90;
    alarm[0] = marquee.counter;
}
else if (state == "first turn") {
    state = "ready";
    turn = getNextTurn(battleQueue);
}