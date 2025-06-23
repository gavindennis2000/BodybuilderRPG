// objMusic alarm 0
if (TEST) { if (live_call()) {  // GMLive
    return live_result;
}}

debug($"\ncurrent song: {global.currentSong} \nprevious song {global.previousSong} \nsong playing: {global.songPlaying}");

if (global.currentSong == -1 && !global.cutscene)
    audio_stop_sound(global.songPlaying);
else if (global.currentSong == global.previousSong) {
    if (audio_is_paused(global.songPlaying)) {
        audio_resume_sound(global.songPlaying);
        audio_sound_gain(global.songPlaying, 0, 0.5);
    }
    audio_sound_gain(global.songPlaying, 1, 200);
}
else {
    if (global.cutscene && global.cutsceneSong != -1) {
        audio_stop_sound(global.songPlaying);
        global.songPlaying = audio_play_sound(global.cutsceneSong, 1, true, 0.25);
        audio_sound_gain(global.songPlaying, 1, 200);
    }
    else if (audio_get_name(global.songPlaying) == audio_get_name(global.currentSong)) {
        if (audio_is_paused(global.songPlaying)) {
            audio_resume_sound(global.songPlaying);
            audio_sound_gain(global.songPlaying, 0, 0.5);
        }
        audio_sound_gain(global.songPlaying, 1, 200);
    }
    else {
        audio_stop_sound(global.songPlaying);
        global.songPlaying = audio_play_sound(global.currentSong, 1, true, 0.25);
        audio_sound_gain(global.songPlaying, 1, 200);
        // set the track position for the overworld
        if (global.trackPosition.name == audio_get_name(global.songPlaying)) {
            audio_sound_set_track_position(global.songPlaying, global.trackPosition.position);
            global.trackPosition = {
                name: -1,
                position: -1
            };
        }
    }
}