// create the notes

/*gmlive*/if (TEST) { if (live_call()) return live_result; }

var camX = camera_get_view_x(view_camera[0]);
var camY = camera_get_view_y(view_camera[0]);

var spd, dist, noteY = camY;
var song;

switch (global.workout) {
	case "novice leg":
		song = notes1;
		spd = 1;
		noteY -= 65;
        dist = 12;
		break;
	case "intermediate push":
		song = notes2;
		spd = 15;
		noteY += 5;
		break;
	case "advanced pull":
		song = notes3;
		spd = 4.8;
		noteY -= 445
        dist = 48;
		break; 
}

// play the song
for (var i = 0; i < array_length(song); i++) {
	var inst = instance_create_layer(
		camX + 496 - 32*6 + 32*song[i][0],  // x position
		noteY - song[i][1]*dist,  // y position
		layer, objNote, {
			spd: spd,  // speed
			image_index: song[i][0]  // image index
		}
	);
	if (i == 0) {
		inst.y += song[i][1]*dist;
	}
	noteY = inst.y;
}