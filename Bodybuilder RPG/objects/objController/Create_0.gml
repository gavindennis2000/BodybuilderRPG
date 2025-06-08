// objController Create

/*gmlive*/ if (TEST) { if (live_call()) return live_result; }

layer = layer_create(layer_get_depth(layer_get_id("Instances")) - 2, "Controller");
// global stuff
global.chapter = 1;
// room transitioning
global.pX = -1;
global.pY = -1;
global.roomGoto = -1;
global.roomTransition = "";
global.pFace = ""
// cutscenes
global.cutscene = -1;

fadeAmount = 0;
fadeAmountChange = 0.1;
alarmTime = 2;

goToNextRoom = function() {
    // goes to next room

    /*gmlive*/ if (TEST) { if (live_call()) return live_result; }

    alarm[0] = alarmTime;
}