//instance_destroy();
if (TEST) { if (live_call()) return live_result; }

// regular music stuff
current = -1;
previous = -1;
loopStart = -1;
loopEnd = -1;
songTime = -1;
soundID = -1;

function playMusic() {
	// plays the current song
	
	if (current == previous) { 
		audio_sound_gain(soundID, 1, 250);  // reset the volume
		exit; 
	}
	
	else {
		audio_stop_sound(previous);
		audio_stop_sound(current);
		audio_sound_gain(previous, 1, 0);  // reset the volume
		
		if (room == rOverworld) {
			audio_sound_set_track_position(current, songTime)
		}
		
		// play the song
		var gain = (room == rOverworld) ? 0.5 : 1;
		soundID = audio_play_sound(current, 1, true, gain);
		audio_sound_gain(soundID, 1, 250);
	}
	
}

function roomEnd() {
	// quiets the music when exiting a room
	
	if (room == rOverworld) {
		songTime = audio_sound_get_track_position(soundID)
	}
	audio_sound_gain(soundID, 0.5, 500)	
}

// workout stuff
bt = -1;
lead = -1;

function playGuitar(start = 0) {
	// play the lead and backing tracks
	
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
	
	audio_stop_all();
	var pos = start;
	
	audio_sound_set_track_position(bt, pos)
	audio_sound_set_track_position(lead, pos);
	audio_play_sound(bt, 1, false);
	audio_play_sound(lead, 1, false);
}

function hitNote() {
	audio_sound_gain(lead, 1, 0);
}

function missNote() {
	audio_sound_gain(lead, 0, 0);
}