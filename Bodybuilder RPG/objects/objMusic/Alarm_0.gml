// objMusic alarm 0
if (TEST) { if (live_call()) {  // GMLive
    return live_result;
}}

if (global.currentSong == -1)
    audio_stop_sound(global.songPlaying);
else if (global.currentSong == global.previousSong)
    audio_sound_gain(global.songPlaying, 1, 200);
else {
    if (audio_get_name(global.songPlaying) == audio_get_name(global.currentSong))  
        audio_sound_gain(global.songPlaying, 1, 200);
    else {
        audio_stop_sound(global.songPlaying);
        global.songPlaying = audio_play_sound(global.currentSong, 1, true, 0.25);
        audio_sound_gain(global.songPlaying, 1, 200);
        // set the track position for the overworld
        if (global.trackPosition.name == audio_get_name(global.songPlaying)) {
            debug("here");
            audio_sound_set_track_position(global.songPlaying, global.trackPosition.position);
            global.trackPosition = {
                name: -1,
                position: -1
            };
        }
    }
}