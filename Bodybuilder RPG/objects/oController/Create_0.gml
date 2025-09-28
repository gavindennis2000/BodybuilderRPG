/*gmlive*/ if (TEST) { if (live_call()) return live_result; }

// variables for room changes
changingRooms = false;  // flag that checks if game is currently changing rooms
fadeAmount = 0;
fadeChangeAmount = 0.25;
fadeAlarmTime = 2;
fadeColor = c_black;
gotoNextRoom = function() {
    // goes to next room when entering door
    if (changingRooms)
        exit;
    changingRooms = true;
    alarm_set(0, 1);
};