// objTestStart game start

if (TEST) { if (live_call()) {  // GMLive
    return live_result;
}}

// set up some important game functions
setSongLoopPoints();

// test battle
if (TEST_BATTLE) {
    global.battleData = {
        party: ["andro", "ana"],
        enemies: ["robber", "robber"],
        canRun: true
    }
}

room_goto(rMom);