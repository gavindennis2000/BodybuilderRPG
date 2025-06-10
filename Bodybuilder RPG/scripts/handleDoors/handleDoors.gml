function handleDoors(doorID){
	// returns information about where a door goes
	
	/*gmlive*/ if (TEST) { if (live_call(doorID)) return live_result; }
	
	switch (doorID) {
		// mom's house
		case inst_5A092949:
			// mom's basement -> mom's house
			global.pX = 416 -32;
			global.pY = 352;
			global.pFace = "left";
			global.roomGoto = rMom;
			global.roomTransition = "fade";
			break;
		case inst_7F4DBE81:
			// mom's house -> basement
			global.pX = 416 -32;
			global.pY = 64;
			global.pFace = "left";
			global.roomGoto = rMom;
			global.roomTransition = "fade";
			break;
		case inst_3088334D:
			// mom's house -> overworld
			global.pX = 1856;
			global.pY = 704 + 32;
			global.pFace = "down";
			global.roomGoto = rOverworld;
			global.roomTransition = "fade";
			break;
		// overworld
		case inst_7C4D478B:
			// overworld -> mom's house
			global.pX = 224;
			global.pY = 512 - 32;
			global.pFace = "up";
			global.roomGoto = rMom;
			global.roomTransition = "fade";
			break;
		// default
		default:
			global.pX = 384 - 32;
			global.pY = 192;
			global.pFace = "left";
			global.roomGoto = rMom;
			global.roomTransition = "fade";
			break;
	}
	
	return;
}