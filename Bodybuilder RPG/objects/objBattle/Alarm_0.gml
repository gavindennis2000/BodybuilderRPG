// increase fadeblack when going back to old room
/*gmlive*/if (TEST) { if (live_call()) return live_result; }

if (fadeBlack < 1) {
    fadeBlack += 0.2;
    alarm[0] = 2;
}
else {
    fadeBlack = 0;
    audio_stop_sound(global.battleSong);
    room_goto(global.returnRoom);
    with (objMusic) {
        audio_resume_sound(soundID);
        audio_sound_gain(soundID, .5, 0);
        audio_sound_gain(soundID, 1, 500);
    }
    global.battle = false;
    instance_destroy();
}