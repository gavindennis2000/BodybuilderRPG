// objController Room Start
if (TEST) { if (live_call()) {  // GMLive
    return live_result;
}}

// create the other controllers
if (!instance_exists(objDevTools))
    instance_create_layer(0, 0, "Instances", objDevTools);
if (!instance_exists(objCamera))
    instance_create_layer(0, 0, "Instances", objCamera);
if (!instance_exists(objItemHandler))
    instance_create_layer(0, 0, "Instances", objItemHandler);
if (!instance_exists(objNPCHandler))
    instance_create_layer(0, 0, "Instances", objNPCHandler);

// find out which room the player is in
global.prevRoomVar = global.roomVar;
switch (room) {
    case rMom:
        global.roomVar = "Mom's House";
        break;
    case rOverworld:
        global.roomVar = "Overworld";
        break;
    default:
        global.roomVar = "Unknown";
        break;
}
showRoomVarFunc();

// fade in the room
if (fadeAmount > 0) {
    alarm[1] = alarmTime;
}