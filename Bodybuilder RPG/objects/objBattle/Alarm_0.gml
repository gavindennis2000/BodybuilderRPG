// increase fadeblack when going back to old room

/*gmlive*/if (TEST) { if (live_call()) return live_result; }
if (instance_exists(objTextbox)) {
    alarm[0] = 1;
    exit;
}

if (fadeBlack < 1) {
    fadeBlack += 0.2;
    alarm[0] = 2;
}
else {
    if (turn == "escape") { global.stats.cardio++; }
    fadeBlack = 0;

    // stop the music
    if (audio_is_playing(global.battleSong)) { audio_stop_sound(global.battleSong); }
    if (audio_is_playing(sndFanfare)) { audio_stop_sound(sndFanfare); }

    // go back to the old room and start the old music
    room_goto(global.returnRoom);
    with (objMusic) {
        audio_resume_sound(soundID);
        audio_sound_gain(soundID, .5, 0);
        audio_sound_gain(soundID, 1, 500);
    }
    global.battle = false;
    instance_destroy();
}