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