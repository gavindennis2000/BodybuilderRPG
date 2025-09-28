// game controller alarm 1
// fades in new room
/*gmlive*/ if (TEST) { if (live_call()) return live_result; }

if (fadeAmount > 0) {
    fadeAmount -= fadeChangeAmount;
    alarm_set(1, fadeAlarmTime);
}
else {
    fadeAmount = 0;
    changingRooms = false;
    if (!instance_exists(oTextbox) && instance_exists(oPlayer))
        oPlayer.canMove = true;
    exit;
}