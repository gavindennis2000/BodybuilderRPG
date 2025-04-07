function SetLoopPoints() {
	// set the loop points of each song (alphabetical order)
	
    /*gmlive*/if (TEST) { if (live_call()) return live_result; }

	// anabolic heights
	audio_sound_loop_start(sndAnabolicHeights, 10.5);

	// boss theme
	audio_sound_loop_start(sndBossBattle, 5);

	// brawn patrol
	audio_sound_loop_start(sndBrawnPatrol, 10.667);	

	// central prairie
	audio_sound_loop_start(sndCentralPrairie, 26.667);

	// creatine island
	audio_sound_loop_start(sndCreatineIsland, 14.769);

	// fight song	
	audio_sound_loop_start(sndBattle, 5.647);

	// leangroundburg
	audio_sound_loop_start(sndLeangroundburg, 12);

	// mom's house
	audio_sound_loop_start(sndMom, 6);

	// pump palace
	audio_sound_loop_start(sndPumpPalace, 42);
	audio_sound_loop_end(sndPumpPalace, 2*60 + 50);
    
	// space
	audio_sound_loop_start(sndSpace, 5.33);

	// wheyford
	audio_sound_loop_start(sndWheyford, 10.97);
}