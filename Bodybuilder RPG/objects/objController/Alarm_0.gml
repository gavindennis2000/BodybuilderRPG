// obj
if (TEST) { if (live_call()) {  // GMLive
    return live_result;
}}

if (global.roomChange.transition == "fade") {
    if (fadeAmount < 1) {
        fadeAmount += fadeAmountChange;
    }
    else {
        if (global.battle) {
            global.battle = false;
            debug(global.battle);
            instance_create_layer(0, 0, "Instances", objPlayer);
        }
        room_goto(global.roomChange.room);
        // move the player to the right spot
        with (objPlayer) {
            x = global.roomChange.x;
            y = global.roomChange.y; 
            face = global.roomChange.face; 
            canMove = false;
        }
        exit;
    }
}

alarm[0] = alarmTime;