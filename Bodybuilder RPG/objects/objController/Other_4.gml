// objController Room Start
if (TEST) { if (live_call()) {  // GMLive
    return live_result;
}}

// create the other controllers
if (!instance_exists(objDevTools))
    instance_create_layer(0, 0, "Instances", objDevTools);
if (!instance_exists(objCamera))
    instance_create_layer(0, 0, "Instances", objCamera);
if (!instance_exists(objMusic))
    instance_create_layer(0, 0, "Instances", objMusic);

// set npc id's
handleNPCs();

// set item ID's
handleItems();

// handle any events
handleEvents();

// don't go any further if in the battle room
if (room == rBattle)
    exit;
    
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
    case rStores:
        break;
    case rWheyfordBarbell:
        global.roomVar = "Wheyford Barbell";
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

if (TEST_BATTLE) {
    startBattle(true, global.battleData.enemies, true, global.battleData.party);
}