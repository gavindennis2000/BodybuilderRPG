// objDevTools Step

/*gmlive*/ if (TEST) { if (live_call()) return live_result; }

if (keyboard_check_pressed(ord("R"))) {
    room_restart();
}

if (keyboard_check_pressed(ord("G"))) {
    game_restart();
}

if (keyboard_check_pressed(ord("B")) && !global.battle) {
    startBattle(["robber"], true);
}