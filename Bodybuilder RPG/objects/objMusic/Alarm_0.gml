// objMusic alarm 0
if (TEST) { if (live_call()) {  // GMLive
    return live_result;
}}

if (global.currentSong == -1)
    audio_stop_sound(global.songPlaying);
else if (global.currentSong == global.previousSong)
    audio_sound_gain(global.songPlaying, 1, 200);
else {
    audio_stop_sound(global.songPlaying);
    global.songPlaying = audio_play_sound(global.currentSong, 1, true, 1);
}