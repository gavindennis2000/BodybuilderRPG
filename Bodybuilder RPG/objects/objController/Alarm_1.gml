// objController alarm 1 

// handle fade in during room start

if (TEST) { if (live_call()) {  // GMLive
    return live_result;
}}

if (fadeAmount > 0) {
    if (room == rMom && !global.events.startCh1) {
        fadeAmount -= 0;
    }
    else
        fadeAmount -= fadeAmountChange;
}
else {
    fadeAmount = 0;
    with (objPlayer)
        canMove = (!instance_exists(objTextbox) && !global.cutscene);
    if (global.apology) {
        global.apology = false;
        textbox("This room hasn't been created yet. Sorry! - Gavin");
    }
    exit;
}

alarm[1] = alarmTime;