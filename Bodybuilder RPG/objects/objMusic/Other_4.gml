if (TEST) { if (live_call()) return live_result; }

if (room == rBattle) { 
    exit; 
}

// set previous music
previous = current;
current = getCurrentSong();

// play the music
alarm[0] = 30
debug(audio_get_name(previous));
debug(audio_get_name(current));
