// handle 'guitar note strumming' during minigame

/*gmlive*/if (TEST) { if (live_call()) return live_result; }

missNote = function() {
	objMusic.missNote();
	playSound(sndMiss);
	with (objGuitar) { image_speed = 0; }
	global.stats.fatigue += 1;
}

if (objGuitar.isPaused || objGuitar.blackOut) {
	image_index = 0;
	exit;
}

image_index = input_check(trigger) ? 1: 0;
var press = input_check_pressed(trigger);

if (press) {
	if (place_meeting(x, y, objNote)) {
		var note = instance_place(x, y, objNote);
		if (note.y <= y+16 && note.y >= y-28 && !note.isDestroyed) {

			// increment score
			objGuitar.incrementReps();
			
			// destroy the note
			note.isDestroyed = true;
			
			// play the music if it's stopped
			objMusic.hitNote();
			with objGuitar { 
				imgIndex = -1;
				image_speed = 0.25;
			}
		}
		else { 
			missNote();
		}
	} else { 
		missNote();
	}
}