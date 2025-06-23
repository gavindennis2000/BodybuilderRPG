// objMusic room start
if (TEST) { if (live_call()) {  // GMLive
    return live_result;
}}

// set the previous played song and get the current
if (room == rBattle)
    exit;
    
getCurrentSong();
alarm_set(0, aTime);