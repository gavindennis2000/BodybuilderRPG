function setSongLoopPoints() {
	// sets loop points for every song

	/*gmlive*/ if (TEST) { if (live_call()) return live_result; }

	// battle
	audio_sound_loop_start(sndBattle, 5.647);
	audio_sound_loop_start(sndBossBattle, 4.667);

	// character themes
	audio_sound_loop_start(sndAna, 15 - 2.625);
	audio_sound_loop_start(sndMom, 6);
	// fix duration
	audio_sound_loop_start(sndSamson, 16);

	// overworld
	audio_sound_loop_start(sndAnabolicHeights, 10.5);
	audio_sound_loop_start(sndCentralPrairie, 26.667);
	audio_sound_loop_start(sndCreatineCove, 14.769);
	audio_sound_loop_start(sndLeangroundburg, 12);
	audio_sound_loop_start(sndWheyford, 10.971);

	// gyms
	// fix duration
	audio_sound_loop_start(sndPumpPalace, 42);

	// rooms
	audio_sound_loop_end(sndBBNC, 73.846);
	audio_sound_loop_start(sndSpace, 5.333);
	 

	// misc
	audio_sound_loop_start(sndDanger, 19.636);
}