function endCutscene() {
    // ends a cutscene and resumes the right music

    /*gmlive*/ if (TEST) { if (live_call()) return live_result; }

    global.cutscene = false;
    global.cutsceneSong = -1;
    
    // reset the music
    with (objMusic) {
        if (global.songPlaying != -1)
            audio_sound_gain(global.songPlaying, 0, 500);
        getCurrentSong();
        alarm_set(0, 30);
    }

    return;
}