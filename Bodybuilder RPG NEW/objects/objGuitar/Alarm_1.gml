/// @description create the notes
var bpm = 120;
var spaceTime = 0;
var noteY = 0;
switch (global.chapter) {
	
	case 1:
	default:
		bpm = 75;
		spaceTime = 5;
		// create the notes
		noteY = -spaceTime;
		for (var i = 0; i < array_length(notes1); i++) {
			var inst = instance_create_layer(
				room_width - 32*6 + 32*notes1[i][0], 
				noteY - notes1[i][1]*12,  // y position
				layer, objNote, 
				{spd: 1}  // speed
			);
			noteY = inst.y;
		}
		break;
		
	case 2:
		bpm = 150;
		spaceTime = 75;
		// create the notes
		noteY = -spaceTime;
		for (var i = 0; i < array_length(notes2); i++) {
			var inst = instance_create_layer(
				room_width - 32*6 + 32*notes2[i][0], 
				noteY - notes2[i][1]*12,  // y position
				layer, objNote, 
				{spd: 2}  // speed
			);
			noteY = inst.y;
		}
		break;
}