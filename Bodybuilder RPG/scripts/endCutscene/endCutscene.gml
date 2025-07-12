function endCutscene() {
    // ends a cutscene and resumes the right music

    /*gmlive*/ if (TEST) { if (live_call()) return live_result; }

    global.cutscene = false;
    global.cutsceneSong = -1;
    
    // reset the music
    with (objMusic) {
        audio_sound_gain(global.songPlaying, 0, 0.5);
        getCurrentSong();
        alarm_set(0, 30);
    }

    return;
}