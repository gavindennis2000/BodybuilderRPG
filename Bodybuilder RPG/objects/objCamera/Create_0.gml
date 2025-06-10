// objCamera create
if (TEST) { if (live_call()) {  // GMLive
    return live_result;
}}

target = (instance_exists(objPlayer)) ? objPlayer : noone;
xTo = x;
yTo = y;

// overworld section
divX = xTo div CAM_WIDTH;
prevDivX = -1;
divY = yTo div CAM_HEIGHT;
prevDivY = -1;