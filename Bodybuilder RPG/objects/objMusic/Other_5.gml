// objMusic room end
if (TEST) { if (live_call()) {  // GMLive
    return live_result;
}}

// remember the track position for the overworld
if (room == rOverworld) {
    global.trackPosition = {
        name: audio_get_name(global.songPlaying),
        position: audio_sound_get_track_position(global.songPlaying)
    }
}