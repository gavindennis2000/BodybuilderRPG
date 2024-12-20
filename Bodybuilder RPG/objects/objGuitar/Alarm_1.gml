// create the notes

/*gmlive*/if (TEST) { if (live_call()) return live_result; }

var camX = camera_get_view_x(view_camera[0]);
var camY = camera_get_view_y(view_camera[0]);

var spaceTime, spd, noteY = camY;
var song;

switch (global.workout) {
	case "novice leg":
		song = notes1;
		spd = 10;
		noteY += 5;
		break;
	case "intermediate push":
		song = notes2;
		spd = 10;
		noteY = 75;
		break;
	case "advanced pull":
		song = notes3;
		spd = 10;
		noteY = 245
		break; 
}

// play the song
for (var i = 0; i < array_length(song); i++) {
	var inst = instance_create_layer(
		camX + 480 - 32*6 + 32*song[i][0], 
		noteY - song[i][1]*spd,  // y position
		layer, objNote, 
		{spd: 1}  // speed
	);
	noteY = inst.y;
}