// obj
if (TEST) { if (live_call()) {  // GMLive
    return live_result;
}}

if (global.roomTransition == "fade") {
    if (fadeAmount < 1) {
        fadeAmount += fadeAmountChange;
    }
    else {
        room_goto(global.roomGoto);
        // move the player to the right spot
        with (objPlayer) {
            x = global.pX;
            y = global.pY; 
            face = global.pFace; 
            canMove = false;
        }
        exit;
    }
}

alarm[0] = alarmTime;