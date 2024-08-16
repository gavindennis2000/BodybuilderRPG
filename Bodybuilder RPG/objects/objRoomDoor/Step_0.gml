if (instance_exists(objPlayer)) {
	if place_meeting(x, y, objPlayer) {
		switch(doorID) {
			case 1:
			default:
				if (objPlayer.x <= x)		
					active = true;
				else
					active = false;
				break;
			case 2:
				if (objPlayer.y <= y)		
					active = true;
				else
					active = false;
				break;
			case 3:
				if (objPlayer.x >= x)		
					active = true;
				else
					active = false;
				break;
		}
	}
}