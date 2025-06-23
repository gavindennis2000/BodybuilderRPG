// objCamera create
if (TEST) { if (live_call()) {  // GMLive
    return live_result;
}}

target = (instance_exists(objPlayer)) ? objPlayer : noone;
layer = layer_create(layer_get_depth(layer_get_id("Instances")) - 1, "Camera");
xTo = x;
yTo = y;

// overworld section
divX = xTo div CAM_WIDTH;
prevDivX = -1;
divY = yTo div CAM_HEIGHT;
prevDivY = -1;

// store section
if (room == rStores) {
    if (x % CAM_WIDTH == 0)
        global.roomVar = "BBNC";
}

// battle transition stuff
battle = false;
camAngleChange = 0.8;
whiteOut = 0;

startBattleTransition = function() {
    // sets the flag to true so drawGUI stuff can happen

    /*gmlive*/ if (TEST) { if (live_call()) return live_result; }

    battle = true;
    
    return;
}