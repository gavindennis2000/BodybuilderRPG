switch(room) {
	
	case momB:
		global.roomVar = momB;
	case momF1:
		global.roomVar = momF1;
		theRoom = "Mom's House";
		break;
		
	case centralPrairie:
		global.roomVar = centralPrairie;
		theRoom = "Central Prairie";
		break;
		
	default:
		theRoom = -1;
		break;
}


displayRoom = 1;
alarm[0] = 120;
roomAlpha = 0;