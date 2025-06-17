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
		case inst_1F15BCE2:
			// overworld -> pump palace right door
			global.pX = 768;
			global.pY = 256 - 32;
			global.pFace = "up";
			global.roomGoto = rPumpPalace;
			global.roomTransition = "fade";
			break;
		case inst_6813D5EC:
			// overworld -> pump palace left door
			global.pX = 768 - 32;
			global.pY = 256 - 32;
			global.pFace = "up";
			global.roomGoto = rPumpPalace;
			global.roomTransition = "fade";
			break;
		case inst_56C4F286:
			// overworld -> bbnc
			global.pX = 256;
			global.pY = 256 - 32;
			global.pFace = "up";
			global.roomGoto = rStores;
			global.roomTransition = "fade";
			break;

		// pump palace
		case inst_9B9658A:
			// pump palace right door -> overworld
			global.pX = 1280;
			global.pY = 448 + 32;
			global.pFace = "down";
			global.roomGoto = rOverworld;
			global.roomTransition = "fade";
			break;
		case inst_1A758F22:
			// pump palace left door -> overworld
			global.pX = 1280 - 32;
			global.pY = 448 + 32;
			global.pFace = "down";
			global.roomGoto = rOverworld;
			global.roomTransition = "fade";
			break;

		// stores
		case inst_1F9D8954:
			// bbnc -> overworld
			global.pX = 1248;
			global.pY = 1056 + 32;
			global.pFace = "down";
			global.roomGoto = rOverworld;
			global.roomTransition = "fade";
			break;

		// default
		default:
			global.pX = self.x;
			global.pY = self.y + 32;
			global.pFace = "down";
			global.roomGoto = room;
			global.roomTransition = "fade";
			break;
	}
	
	return;
}