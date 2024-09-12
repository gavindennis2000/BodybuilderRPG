if (doorID == "upstairs") { image_index = 2; }
else if (doorID == "downstairs") { image_index = 3; }
else if (instance_exists(objPlayer) and doorID == "door") {
	if (place_meeting(x, y, objPlayer) and image_index == 0) {
		image_index = 1;
		playSound(sndOpenDoor);
	}
}
