// objTestStart game start

if (TEST) { if (live_call()) {  // GMLive
    return live_result;
}}

// set up some important game functions
setSongLoopPoints();

// test battle
if (TEST && TEST_BATTLE) {
    global.battleData = {
        party: ["andro", "ana"],
        enemies: ["robber", "robber", "robber"],
        canRun: true
    }
}

room_goto(rOverworld);