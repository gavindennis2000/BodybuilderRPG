currentSong = -1;
nextSong = -1;
previousSong = -1;
tempSong = -1;
battleMusic = -1;

function setGain(arg) {

	audio_sound_gain(currentSong, arg, 0);
	return;

}

function addGain(arg) {

	var gain = audio_sound_get_gain(currentSong)
	audio_sound_gain(currentSong, gain+arg, 0);
	return;

}

// set song loop points
	// central prairie
	audio_sound_loop_start(sndCentralPrairie, 21.33);
	audio_sound_loop_end(sndCentralPrairie, 106.667);
	//mom's house
	audio_sound_loop_start(sndMom, 6);
	//fight song
	audio_sound_loop_start(sndBattle, 2.824);
	

function playNextSong() {
	
	if (currentSong == -1) { 
		
		if (nextSong != -1) {
			audio_sound_gain(nextSong, 1, 0);
			audio_play_sound(nextSong, 1, true); 
			currentSong = nextSong;
			nextSong = -1;
		}
		
	} else {

		audio_sound_gain(currentSong, 0, 1500);
		alarm[0] = 60 * 1.5;
	
	}
	
}

function playNextSongCont() {
	
	audio_stop_sound(currentSong);
	audio_sound_gain(currentSong, 1, 0);
	
	currentSong = nextSong;
	nextSong = -1;
	if (currentSong != -1) { audio_play_sound(currentSong, 1, true); }
	
}

function initiateBattle(music = sndBattle) {
	audio_pause_sound(currentSong);
	tempSong = currentSong;
	currentSong = music;
	audio_sound_gain(currentSong, 1, 0);
	audio_play_sound(currentSong, 1, true);
	audio_play_sound(sndBattleInit, 1, false);
}

function endBattle() {
	battleMusic = currentSong;
	currentSong = tempSong;
	audio_sound_gain(battleMusic, 0, 1500);
	alarm[1] = 60 * 1.5;
}

function battleVictory(sound = sndVictory) {
	battleMusic = currentSong;
	currentSong = sound;  // set new sound to victory fanfare
	audio_sound_gain(battleMusic, 0, 1500);
	alarm[2] = 60 * 1.5;
	
}	