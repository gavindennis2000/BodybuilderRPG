// objMusic alarm 1 - fade battle music after dying
if (TEST) { if (live_call()) {  // GMLive
    return live_result;
}}

if (audio_sound_get_pitch(global.battleMusic) > 0.45) {
    audio_sound_pitch(global.battleMusic, audio_sound_get_pitch(global.battleMusic) - 0.01);
    audio_sound_gain(global.battleMusic, audio_sound_get_gain(global.battleMusic) - 0.012, 0);
    alarm_set(1, 5);
}