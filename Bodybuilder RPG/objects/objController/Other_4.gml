switch(room) {
	
	case momB:
		global.roomVar = momB;
		theRoom = "Mom's House";
		subtitle = "Basement";
		break;
	case momF1:
		global.roomVar = momF1;
		theRoom = "Mom's House";
		subtitle = "Floor 1";
		break;
		
	case centralPrairie:
		global.roomVar = centralPrairie;
		theRoom = "Central Prairie";
		subtitle = -1;
		break;
		
	default:
		theRoom = -1;
		subtitle = -1;
		break;
}

if (theRoom != prevRoomVar) {
	displayRoom = 1;
	alarm[0] = 120;
	roomAlpha = 0;
}

if (subtitle != prevSubtitle) {
	displaySub = 1;
	alarm[1] = 120;
	subAlpha = 0;
}