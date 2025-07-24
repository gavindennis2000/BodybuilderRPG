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
        enemies: ["donnie swoleman"],
        canRun: true
    }
}

var rm =
rMom;

if (!TEST)
    rm = rSpace;

room_goto(rm);