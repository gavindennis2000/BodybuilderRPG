var b = c_black;
var check = false;
	with (objRoomDoor) {
		if active = true
			check = true;
	}
switch(room) {
	case rPumpPalace:
			
		if (active) {
			switch(doorID) {
				case 1:  // left door
					draw_rectangle_color(416, 128, 543, 319, b, b, b, b, false);  // middle room
					draw_rectangle_color(576, 128, 832, 448, b, b, b, b, false);  // right room
					draw_rectangle_color(416, 352, 543, 447, b, b, b, b, false); // hallway
					break;
				case 2:  // top door
					draw_rectangle_color(576, 128, 832, 448, b, b, b, b, false);  // right room
					draw_rectangle_color(128, 128, 383, 448, b, b, b, b, false);  // left room
					draw_rectangle_color(416, 352, 543, 447, b, b, b, b, false); // hallway
					break;
				case 3:
					draw_rectangle_color(128, 128, 383, 448, b, b, b, b, false);  // left room
					draw_rectangle_color(416, 128, 543, 319, b, b, b, b, false);  // middle room
					draw_rectangle_color(416, 352, 543, 447, b, b, b, b, false); // hallway
					break;
			}
			break;
		}
	
		else if (!check) {
			draw_rectangle_color(576, 128, 832, 448, b, b, b, b, false);  // right room
			draw_rectangle_color(128, 128, 383, 448, b, b, b, b, false);  // left room
			draw_rectangle_color(416, 128, 543, 319, b, b, b, b, false);  // middle room
		}
}

if (!active) { draw_self(); }