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
        enemies: ["super heavyweight"],
        canRun: true
    }
}

var rm =
rPumpPalace;

if (!TEST)
    rm = rSpace;

room_goto(rm);