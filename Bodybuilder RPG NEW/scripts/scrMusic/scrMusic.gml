function playSound(snd, loop = false) {
	if (audio_is_playing(snd)) { audio_stop_sound(snd); }
	audio_play_sound(snd, 1, false);
}