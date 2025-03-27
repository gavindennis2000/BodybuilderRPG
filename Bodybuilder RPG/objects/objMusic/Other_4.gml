if (TEST) { if (live_call()) return live_result; }

if (room == rBattle) { 
    exit; 
}

// set previous music
previous = current;
if (variable_instance_exists(self, "getCurrentSong")) {
    current = getCurrentSong();
}

// play the music
alarm[0] = 30