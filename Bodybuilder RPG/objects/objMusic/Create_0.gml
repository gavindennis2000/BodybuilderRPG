if (TEST) { if (live_call()) return live_result; }

// regular music stuff
current = -1;
next = -1;
previous = -1;
loopStart = -1;
loopEnd = -1;
songTime = -1;
soundID = -1;
workoutMusicBT = -1  // music that plays during guitar workouts
workoutMusicLead = -1  // isolated guitar track during guitar workouts
musicBuffer = -1;  // holds music for functions

// set the loop points of each song
// boss theme
audio_sound_loop_start(sndBossBattle, 5);
audio_sound_loop_end(sndBossBattle, 49.667);
// pump palace
audio_sound_loop_start(sndPumpPalace, 42);
audio_sound_loop_end(sndPumpPalace, 2*60 + 50);

function cutscene(song = sndError) {
    if (audio_sound_get_gain(soundID) > 0) {
        next = song;
        audio_sound_gain(soundID, 0, 500);
        alarm[1] = 30;
    }
    else {
        audio_stop_all();
        audio_sound_gain(soundID, 1, 0);
        previous = current;
        current = next;
        playMusic();
    }
}

function hitNote() {
	audio_sound_gain(workoutMusicLead, 1, 0);
}

function missNote() {
	audio_sound_gain(workoutMusicLead, 0, 0);
}

function pauseGuitar() {
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

function playGuitar(start = 0) {
	// play the lead and backing tracks

	var bt, lead, pos = start;
	
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
	
	audio_pause_sound(soundID);
	
	audio_sound_set_track_position(bt, pos)
	audio_sound_set_track_position(lead, pos);
	workoutMusicBT = audio_play_sound(bt, 1, false);
	workoutMusicLead = audio_play_sound(lead, 1, false);
}

function playMusic() {
	// plays the current song

	if (global.silenceMusic) {
		// if dev tool is flagged, don't play any music
		exit;
	}

	/*gmlive*/if (TEST) { if (live_call()) return live_result; }
    
    // don't interrupt the battle music
    if (audio_is_playing(sndBattle)) { exit; }
	
	if (current == previous) { 
		audio_sound_gain(soundID, 1, 150);  // reset the volume
		exit; 
	}
	
	else {
		audio_stop_sound(previous);
		audio_stop_sound(current);
		
		if (room == rOverworld && !global.cutscene) {
			audio_sound_set_track_position(current, songTime)
		}
		
		// play the song
		var gain = (room == rOverworld && !global.cutscene) ? 0.5 : 1;
		soundID = audio_play_sound(current, 1, true, gain);
        audio_sound_gain(soundID, 0.5, 0);
		audio_sound_gain(soundID, 1, 150);
	}
	
}

function roomEnd() {
	// quiets the music when exiting a room
	
	if (room == rOverworld) {
		songTime = audio_sound_get_track_position(soundID)
	}
	audio_sound_gain(soundID, 0.5, 250)	
}

slowDown = function(song) {
	// slows down song playing when player blacks out

	/*gmlive*/if (TEST) { if (live_call()) return live_result; }
	
	if (!audio_is_playing(song)) { exit; }

	var pitch = audio_sound_get_pitch(song);
	audio_sound_pitch(song, pitch/1.0025);

	// load the song into music buffer
	musicBuffer = song;

	if (pitch > 0.1) { alarm[2] = 1; }
	else audio_stop_sound(song);
}

function workout() {
	// fade the room music when working out
	
	audio_sound_gain(soundID, 0, 1000);	
}