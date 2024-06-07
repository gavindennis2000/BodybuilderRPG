/// @description victory fanfare
audio_stop_sound(battleMusic);
audio_sound_gain(battleMusic, 1, 0);

audio_sound_gain(currentSong, 1, 0);
audio_play_sound(currentSong, 1, true);