/// @description resume song
audio_stop_sound(battleMusic);
audio_sound_gain(battleMusic, 1, 0);

audio_sound_gain(currentSong, 0, 0);
audio_resume_sound(currentSong);
audio_sound_gain(tempSong, 1, 1500);