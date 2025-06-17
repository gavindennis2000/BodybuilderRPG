// objController Create

/*gmlive*/ if (TEST) { if (live_call()) return live_result; }

layer = layer_create(layer_get_depth(layer_get_id("Instances")) - 2, "Controller");
// global stuff
global.events = {
    startCh1: false,
    meetMom: false,
    meetJim: false,
    meetAna: false,
    bbnc: false,
}
global.chapter = 1;
global.cutscene = false; 
global.cutsceneSong = -1;
global.character = "andro";
global.characterName = "andro";
global.party = ["andro"];
global.roomVar = -1;
global.prevRoomVar = -1;

// room transitioning
global.pX = -1;
global.pY = -1;
global.roomGoto = -1;
global.roomTransition = "";
global.pFace = ""
// cutscenes
global.cutscene = -1;
cutsceneY = 0;

fadeAmount = 0;
fadeAmountChange = 0.15;
alarmTime = 2;

goToNextRoom = function() {
    // goes to next room

    /*gmlive*/ if (TEST) { if (live_call()) return live_result; }

    alarm[0] = alarmTime;
    audio_sound_gain(global.songPlaying, 0.3, 600);

    return;
}

showRoomVar = false;
showRoomVarAlpha = 0;
showRoomVarFunc = function() {
    // shows the room var is the top right corner

    /*gmlive*/ if (TEST) { if (live_call()) return live_result; }

    if (global.roomVar == global.prevRoomVar)
        exit;

    alarm[2] = 120;
    showRoomVarAlpha = 0;
    showRoomVar = true;

    return;
}