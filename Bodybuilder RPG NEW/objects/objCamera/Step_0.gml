if (follow != noone) {
	xTo = follow.x + 16;
	yTo = follow.y + 16;
	
	x += (xTo - x) / 15;
	y += (yTo - y) / 15;
}

if (
	room == centralPrairie or 
	room == highland
) {
	
	var pX = objPlayer.x + 16;
	var pY = objPlayer.y + 16;
	
	prevSection = section;
	if (pY < room_height/2) {
		if (pX >= room_width/2) {
			section = "ne";
			global.prevSub = global.subRoom;
			global.subRoom = "Northeast";
			with (objController) { showSubRoom(); }
		} else {
			section = "nw";
			global.prevSub = global.subRoom;
			global.subRoom = "Northwest";	
			with (objController) { showSubRoom(); }
		}
	} else {
		if (pX >= room_width/2) {
			section = "se";
			global.prevSub = global.subRoom;
			global.subRoom = "Southeast";
			with (objController) { showSubRoom(); }
		} else {
			section = "sw";
			global.prevSub = global.subRoom;
			global.subRoom = "Southwest";
			with (objController) { showSubRoom(); }
		}
	}
	
	var aTime0 = 12;
	if prevSection != section { 
		transition = true;
		tempSection = prevSection;
		alarm[0] = aTime0;
	}
	
	xDist = 480 * 1.5;
	yDist = 270 * 1.5 + 32;
	
	if (section == "nw") {
		// northwest
		if (x > xDist) { 
			if (transition and tempSection == "ne") { x -= 480/aTime0; }
			else { x = xDist; }
		}
		if (y > yDist) { 
			if (transition and tempSection == "sw") { y -= 270/aTime0; }
			else { y = yDist;  }
		}
	} else if (section == "ne") {
		// northeast
		if (x < room_width - xDist) { 
			if (transition and tempSection == "nw") { x += 480/aTime0; }
			else { x = room_width - xDist; }
		}
		if (y > yDist) { 
			if (transition and tempSection == "se") { y -= 270/aTime0; }
			else { y = yDist;  }
		}
	} else if (section == "sw") {  
		// southwest
		if (x > xDist) { 
			if (transition and tempSection == "se") { x -= 480/aTime0; }
			else { x = xDist; }
		}
		if (y < room_height - yDist) { 
			if (transition and tempSection == "nw") { y += 270/aTime0; }
			else { y = room_height - yDist;  }
		}
	} else if (section == "se") {  
		// southeast
		if (x < room_width - xDist) { 
			if (transition and tempSection == "sw") { x += 480/aTime0; }
			else { x = room_width - xDist; }
		}
		if (y < room_height - yDist) { 
			if (transition and tempSection == "ne") { y += 270/aTime0; }
			else { y = room_height - yDist;  }
		}
	}
	
}
