// objMusic room start
if (TEST) { if (live_call()) {  // GMLive
    return live_result;
}}

// set the previous played song and get the current
if (room == rBattle) {
    if (alarm_get(0) >= 0)
        alarm_set(0, -1);
    exit;
}
    
getCurrentSong();
alarm_set(0, aTime);