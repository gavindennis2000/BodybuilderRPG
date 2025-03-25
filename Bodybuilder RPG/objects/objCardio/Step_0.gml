/*gmlive*/if (TEST) { if (live_call()) return live_result; }

// increment the counters
counter1++;
if (counter1 % 60 == 0)
    counter2++;

// press start to quit
if (scale == 1 && input_check_pressed("start")) {
    endMinigame = true;
	audio_sound_gain(sndBrawnPatrol, 0, 500);
}

if (scale == 0 && endMinigame) {
	with (objPlayer) {
		// let the player move again
		alarm[1] = 1;
		image_alpha = 1;
	}
	with (objMusic) {
		// resume the music
		audio_stop_sound(sndBrawnPatrol);
		audio_resume_sound(soundID);
		audio_sound_gain(soundID, 1, 200);
	}

    // destroy self
    instance_destroy();
}