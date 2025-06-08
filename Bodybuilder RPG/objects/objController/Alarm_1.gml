// objController alarm 1 

// handle fade in during room start

if (TEST) { if (live_call()) {  // GMLive
    return live_result;
}}

if (fadeAmount > 0) {
    fadeAmount -= fadeAmountChange;
}
else {
    fadeAmount = 0;
    with (objPlayer)
        canMove = true;
    exit;
}

alarm[1] = alarmTime;