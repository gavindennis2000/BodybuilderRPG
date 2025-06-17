// objController Room Start
if (TEST) { if (live_call()) {  // GMLive
    return live_result;
}}

// create the other controllers
if (!instance_exists(objDevTools))
    instance_create_layer(0, 0, "Instances", objDevTools);
if (!instance_exists(objCamera))
    instance_create_layer(0, 0, "Instances", objCamera);
if (!instance_exists(objHandleItems))
    instance_create_layer(0, 0, "Instances", objHandleItems);
if (!instance_exists(objHandleNPCs))
    instance_create_layer(0, 0, "Instances", objHandleNPCs);
if (!instance_exists(objMusic))
    instance_create_layer(0, 0, "Instances", objMusic);

// handle any events
handleEvents();

// find out which room the player is in
global.prevRoomVar = global.roomVar;
switch (room) {
    case rMom:
        global.roomVar = "Mom's House";
        break;
    case rOverworld:
        global.roomVar = "Overworld";
        break;
    case rPumpPalace:
        global.roomVar = "Pump Palace";
        break;

    default:
        global.roomVar = "Unknown";
        break;
}
showRoomVarFunc();

// fade in the room
fadeAmount = 1;
if (fadeAmount > 0) {
    alarm[1] = alarmTime;
}