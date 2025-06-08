function handleDoors(doorID){
	// returns information about where a door goes
	
	/*gmlive*/ if (TEST) { if (live_call(doorID)) return live_result; }
	
	switch (doorID) {
		
		case inst_5A092949:
			// mom's basement
			global.pX = 416 -32;
			global.pY = 352;
			global.pFace = "left";
			global.roomGoto = rMom;
			global.roomTransition = "fade";
			break;
		case inst_7F4DBE81:
			// mom's basement
			global.pX = 416 -32;
			global.pY = 64;
			global.pFace = "left";
			global.roomGoto = rMom;
			global.roomTransition = "fade";
			break;
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