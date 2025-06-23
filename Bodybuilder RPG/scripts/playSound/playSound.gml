function playSound(snd){
	// plays a sound and stops it if it was already playing
	
	/*gmlive*/ if (TEST) { if (live_call(snd)) return live_result; }
	
	if (audio_is_playing(snd))
		audio_stop_sound(snd);
		
	audio_play_sound(snd, 2, false);
}