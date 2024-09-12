
image_index = input_check(trigger) ? 1: 0;

if (move) x += 8;

var press = input_check_pressed(trigger);

if (press) {
	if (place_meeting(x, y, objNote)) {
		var note = instance_place(x, y, objNote);
		if (note.y <= y+8 and note.y >= y-14) {

			// increment score
			var scr = 100;
			scr -= 10 * abs(note.y - y);
			score += scr;
			
			// destroy the note
			instance_destroy(note);
			
			// play the music if it's stopped
			objMusic.hitNote();
			with objGuitar { 
				imgIndex = -1; 
				image_speed = image_speed > 0 ? 0.1 : image_speed * 1.5;
			}
		}
		else { 
			objMusic.missNote();
			playSound(sndMiss);
			with objGuitar { imgIndex = 2; image_speed = 0; health--;}
		}
	} else { 
		health -= 1; 
		objMusic.missNote();
		playSound(sndMiss);
		with objGuitar { imgIndex = 2; image_speed = 0; }
		playSound(sndMiss);
	}
}