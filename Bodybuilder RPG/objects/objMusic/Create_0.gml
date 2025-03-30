if (TEST) { if (live_call()) return live_result; }

// regular music stuff
current = -1;
next = -1;
previous = -1;
loopStart = -1;
loopEnd = -1;
songTime = -1;
soundID = -1;
cutsceneID = -1;
workoutMusicBT = -1  // music that plays during guitar workouts
workoutMusicLead = -1  // isolated guitar track during guitar workouts
musicBuffer = -1;  // holds music for functions

// set the loop points of each song
SetLoopPoints();

// function definitions below

cutscene = function(song = sndError) {
    if (audio_sound_get_gain(soundID) > 0) {
        objMusic.next = song;
        audio_sound_gain(soundID, 0, 500);
        alarm[1] = 31;
    }
    else {
        audio_pause_sound(soundID);
        audio_sound_gain(soundID, 1, 0);
		objMusic.cutsceneID = audio_play_sound(song, 1, true);
    }
}

endCutscene = function(song = sndError) {
	if (audio_sound_get_gain(cutsceneID) == 1) {
		audio_sound_gain(cutsceneID, 0, 500);
		alarm[3] = 30;
	}
}

getCurrentSong = function() {
	// get's current song at start of room
	var current = -1;
	switch (room) {
		case rOverworld:
			switch (global.roomVar) {
				case "Wheyford":
					current = sndWheyford;
					break;
				case "Anabolic Heights":
					current = sndAnabolicHeights;
					break;
				case "Leangroundburg":
					current = sndLeangroundburg;
					break;
				case "Creatine Island":
					current = sndCreatineIsland;
					break;
				case "Central Prairie":
				default:
					current = sndCentralPrairie
					break;
			}
			break;
		case rHouse:
			current = (global.roomID == "mom") ? sndMom : sndCentralPrairie;
			break;
		case rMom:
			current = sndMom
			break;
		case rPumpPalace:
			current = sndPumpPalace
			break;
	}
	return current;
}

hitNote = function() {
	audio_sound_gain(workoutMusicLead, 1, 0);
}

missNote = function() {
	audio_sound_gain(workoutMusicLead, 0, 0);
}

pauseMinigame = function() {
	// pauses and resumes guitar songs

	switch(global.workout) {
		case "novice leg":
		default:
			bt = sndRhythmLegNovice;
			lead = sndLeadLegNovice;
			break;
		case "intermediate push":
			bt = sndRhythmPushIntermediate;
			lead = sndLeadPushIntermediate;
			break;
		case "advanced pull":
			bt = sndRhythmPullAdvanced;
			lead = sndLeadPullAdvanced;
			break;
	}

	if (audio_is_paused(bt)) {
		audio_resume_sound(workoutMusicBT);
		audio_resume_sound(workoutMusicLead);
	}
	else {
		audio_pause_sound(workoutMusicBT);	
		audio_pause_sound(workoutMusicLead);	
	}
}

playMinigame = function(start = 0) {
	// play the lead and backing tracks

	if (global.silenceMusic) {
		// if dev tool is flagged, don't play any music
		exit;
	}
	
	var bt, lead, pos = start, loop = false;
	
	switch(global.workout) {
		case "intermediate push":
			bt = sndRhythmPushIntermediate;
			lead = sndLeadPushIntermediate;
			break;
		case "advanced pull":
			bt = sndRhythmPullAdvanced;
			lead = sndLeadPullAdvanced;
			break;
		case "cardio":
			bt = sndBrawnPatrol
			audio_sound_gain(sndBrawnPatrol, 1, 0);
			lead = -1;
			loop = true;
			break;
		case "novice leg":
		default:
			bt = sndRhythmLegNovice;
			lead = sndLeadLegNovice;
			break;
	}
	
	audio_pause_sound(soundID);
	
	audio_sound_set_track_position(bt, pos)
	audio_sound_set_track_position(lead, pos);
	workoutMusicBT = audio_play_sound(bt, 1, loop);
	if (lead != -1) {
		workoutMusicLead = audio_play_sound(lead, 1, loop);
	}
}

playMusic = function() {
	// plays the current song

	/*set up gmlive for this function*/ if (TEST) { if (live_call()) return live_result; }

	// if dev tool is flagged, don't play any music
	if (global.silenceMusic) {
		exit;
	}
    
    // don't interrupt the battle music
    if (audio_is_playing(sndBattle) || audio_is_playing(sndBossBattle)) { 
		exit; 
	}
	
	var playing = audio_get_name(soundID);
	if (current == previous || 
		playing == sndCentralPrairie ||
		playing == sndWheyford ||
		playing == sndAnabolicHeights ||
		playing == sndLeangroundburg ||
		playing == sndCreatineIsland
	) { 
		audio_sound_gain(soundID, 1, 150);  // reset the volume
		exit; 
	}
	
	else {
		audio_stop_sound(previous);
		audio_stop_sound(current);
		
		if (room == rOverworld && !global.cutscene &&
			previous != sndAnabolicHeights &&
			previous != sndCentralPrairie &&
			previous != sndWheyford && 
			previous != sndLeangroundburg &&
			previous != sndCreatineIsland
		) {
			audio_sound_set_track_position(current, songTime);
		}
		else {
			audio_sound_set_track_position(current, 0);
		}
		
		// play the song
		var gain = (room == rOverworld && !global.cutscene) ? 0.5 : 1;
		soundID = audio_play_sound(current, 1, true, gain);
        audio_sound_gain(soundID, 0.5, 0);
		audio_sound_gain(soundID, 1, 150);
	}
	
}

preMinigame = function() {
	// fade the room music before a minigame
	
	audio_sound_gain(soundID, 0, 1000);	
}

roomEnd = function() {
	// quiets the music when exiting a room
	
	if (room == rOverworld) {
		songTime = audio_sound_get_track_position(soundID)
	}
	audio_sound_gain(soundID, 0.5, 250)	
}


slowDown = function(song) {
	// slows down song playing when player blacks out

	/*gmlive*/if (TEST) { if (live_call(song)) return live_result; }
	
	if (!audio_is_playing(song)) { 
		exit; 
	}

	var pitch = audio_sound_get_pitch(song);
	audio_sound_pitch(song, pitch/1.0025);

	// load the song into music buffer
	musicBuffer = song;

	if (pitch > 0.1) { 
		alarm[2] = 1; 
	}
	else {
		audio_stop_sound(song);
	}
}