if (follow != noone) {
	xTo = follow.x + 16;
	yTo = follow.y + 16;
	
	x += (xTo - x) / 15;
	y += (yTo - y) / 15;
}

if (room == overworld) {
	
	var pX = objPlayer.x + 16;
	var pY = objPlayer.y + 16;
	
	var townX = 0;
	var townY = 0;
	var townW = 1920;
	var townH = 1152;

	
	if ( objPlayer.x < 1920) {  
		// left side of the world
		if (objPlayer.y < 1152) {
			town = "end of the world nw";
			
			global.prevRoom = global.roomVar;
			global.roomVar = "The End of the World";
			with (objController) { showRoom(); }
		}
		else if (objPlayer.y >= 1152 and objPlayer.y < 1152*2) {
			town = "nesleigh";
			pY -= 1152;
			
			global.prevRoom = global.roomVar;
			global.roomVar = "Nesleigh";
			with (objController) { showRoom(); }
		}
		else {
			town = "end of the world sw";
			pY -= 1152*2;
			
			global.prevRoom = global.roomVar;
			global.roomVar = "The End of the World";
			with (objController) { showRoom(); }
		}
	} else if (objPlayer.x >= 1920 and objPlayer.x < 1920*2) {  
		// middle of the world
		if (objPlayer.y < 1152) {
			town = "dairygold";
			
			global.prevRoom = global.roomVar;
			global.roomVar = "Dairygold";
			with (objController) { showRoom(); }
		}
		else if (objPlayer.y >= 1152 and objPlayer.y < 1152*2) {
			town = "central prairie";
			
			global.prevRoom = global.roomVar;
			global.roomVar = "Central Prairie";
			with (objController) { showRoom(); }
		}
		else {
			town = "great valliou";
			
			global.prevRoom = global.roomVar;
			global.roomVar = "Great Valliou";
			with (objController) { showRoom(); }
		}
	} else if (objPlayer.x >= 1920*2) {  
		// right side of the world
		if (objPlayer.y < 1152) {
			town = "end of the world ne";
			
			global.prevRoom = global.roomVar;
			global.roomVar = "The End of the World";
			with (objController) { showRoom(); }
		}
		else if (objPlayer.y >= 1152 and objPlayer.y < 1152*2) {
			town = "highland";
			
			global.prevRoom = global.roomVar;
			global.roomVar = "Highland";
			with (objController) { showRoom(); }
		}
		else {
			town = "end of the world se";
			
			global.prevRoom = global.roomVar;
			global.roomVar = "The End of the World";
			with (objController) { showRoom(); }
		}
	}
	
	// get townX and townY for each town
	var tempTown = town;
	switch (town) {
		case "end of the world nw":
			townX = 0;
			townY = 0;
			break;
		case "dairygold":
			townX = townW;
			townY = 0;
			break;
		case "end of the world ne":
			townX = townW * 2;
			townY = 0;
			break;
			
		case "nesleigh":
			townX = 0;
			townY = townH;
			break;
		case "central prairie":
			townX = townW;
			townY = townH;
			break;
		case "highland":
			townX = townW * 2;
			townY = townH;
			break;
			
		case "end of the world sw":
			townX = townW * 0;
			townY = townH * 2;
			break;
		case "great valliou":
			townX = townW;
			townY = townH * 2;
			break;
		case "end of the world se":
			townX = townW * 2;
			townY = townH * 2;
			break;
	}
	
	prevSection = section;
	if (pY < townH/2 + townY) {
		if (pX >= townW/2 + townX) {
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
		if (pX >= townW/2 + townX) {
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
	
	// transitions
	var aTime0 = 12;
	if prevSection != section { 
		transition = true;
		tempSection = prevSection;
		alarm[0] = aTime0;
	}
	
	xDist = 480 * 1.5;
	yDist = 270 * 1.5 + 32;
	
	//if (section == "nw") {
	//	// northwest
	//	if (x > xDist + townX) { 
	//		if (transition and tempSection == "ne") { x -= 480/aTime0; }
	//		else { x = xDist + townX; }
	//	}
	//	else if (x < 240 + townX) {
	//		if (transition and tempSection == "ne") { x += 480/aTime0; }
	//		else { x = 240 + townX; }	
	//	}
	//	if (y > yDist + townY) { 
	//		if (transition and tempSection == "sw") { y -= 270/aTime0; }
	//		else { y = yDist + townY;  }
	//	}
	//	else if (y < 135 + townY) { 
	//		if (transition and tempSection == "sw") { y += 270/aTime0; }
	//		else { y =  135 + townY;  }
	//	}
	//}
	//else if (section == "ne") {
	//	// northeast
	//	if (x < 960 + 240 + townX) { 
	//		if (transition and tempSection == "nw") { x += 480/aTime0; }
	//		else { x = 960 + 240 + townX; }	
	//	}
	//	else if (x > 960*2 - 240 + townX) {
	//		if (transition and tempSection == "nw") { x -= 480/aTime0; }
	//		else { x = 960*2 - 240 + townX; }	
	//	}
	//if (y > yDist + townY) { 
	//		if (transition and tempSection == "se") { y -= 270/aTime0; }
	//		else { y = yDist + townY;  }
	//	}
	//	else if (y < 135 + townY) { 
	//		if (transition and tempSection == "se") { y += 270/aTime0; }
	//		else { y =  135 + townY;  }
	//	}
	//} 
	//if (section == "sw") {
	//	// northwest
	//	if (x > xDist + townX) { 
	//		if (transition and tempSection == "se") { x -= 480/aTime0; }
	//		else { x = xDist + townX; }
	//	}
	//	else if (x < 240 + townX) {
	//		if (transition and tempSection == "se") { x += 480/aTime0; }
	//		else { x = 240 + townX; }	
	//	}
	//	if (y < 540 + 135 + 36 + townY) { 
	//		if (transition and tempSection == "nw") { y += 270/aTime0; }
	//		else { y = 540 + 135 + 36 + townY;  }
	//	}
	//	else if (y > 270 * 3.5 + 68 + townY) { 
	//		if (transition and tempSection == "nw") { y -= 270/aTime0; }
	//		else { y =  270 * 3.5 + 68 + townY;  }
	//	}
	//}
	//else if (section == "se") {
	//	// northwest
	//	if (x < 960 + 240 + townX) { 
	//		if (transition and tempSection == "sw") { x += 480/aTime0; }
	//		else { x = 960 + 240 + townX; }	
	//	}
	//	else if (x > 960*2 - 240 + townX) {
	//		if (transition and tempSection == "sw") { x -= 480/aTime0; }
	//		else { x = 960*2 - 240 + townX; }	
	//	}
	//	if (y < 540 + 135 + 36 + townY) { 
	//		if (transition and tempSection == "ne") { y += 270/aTime0; }
	//		else { y = 540 + 135 + 36 + townY;  }
	//	}
	//	else if (y > 270 * 3.5 + 68 + townY) { 
	//		if (transition and tempSection == "ne") { y -= 270/aTime0; }
	//		else { y =  270 * 3.5 + 68 + townY;  }
	//	}
	//} 
}