// game controller alarm 0
// dims the lights, then goes to next room
/*gmlive*/ if (TEST) { if (live_call()) return live_result; }

if (fadeAmount < 1) {
    fadeAmount += fadeChangeAmount;
    alarm_set(0, fadeAlarmTime);
}
else {
    room_goto(global.playerSpawn.roomGoto);
}