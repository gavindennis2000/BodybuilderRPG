function handleDoors(doorID){
	// returns information about where a door goes
	
	/*gmlive*/ if (TEST) { if (live_call(doorID)) return live_result; }
	
	switch (doorID) {
		// mom's house
		case inst_5A092949:
			// mom's basement -> mom's house
			global.roomChange = {
				x: 416 - 32, 
				y: 352, 
				face: "left", 
				room: rMom, 
				transition: "fade"
			};
			break;
		case inst_7F4DBE81:
			// mom's house -> basement
			global.roomChange = {
				x: 416 - 32, 
				y: 64, 
				face: "left", 
				room: rMom, 
				transition: "fade"
			};
			break;
		case inst_3088334D:
			// mom's house -> overworld
			global.roomChange = {
				x: 1856, 
				y: 704 + 32, 
				face: "down", 
				room: rOverworld, 
				transition: "fade"
			};
			break;
		// overworld
		case inst_7C4D478B:
			// overworld -> mom's house
			global.roomChange = {
				x: 224, 
				y: 512 - 32, 
				face: "up", 
				room: rMom, 
				transition: "fade"
			};
			break;
		case inst_1F15BCE2:
			// overworld -> pump palace right door
			global.roomChange = {
				x: 768, 
				y: 256 - 32, 
				face: "up", 
				room: rPumpPalace, 
				transition: "fade"
			};
			break;
		case inst_6813D5EC:
			// overworld -> pump palace left door
			global.roomChange = {
				x: 768 - 32, 
				y: 256 - 32, 
				face: "up", 
				room: rPumpPalace, 
				transition: "fade"
			};
			break;
		case inst_56C4F286:
			// overworld -> bbnc
			global.roomChange = {
				x: 256, 
				y: 224 - 32, 
				face: "up", 
				room: rStores, 
				transition: "fade"
			};
			break;
		case inst_46A388A5:
			// overworld -> wheyford barbell left door
			global.roomChange = {
				x: 736,
				y: 1120 - 32,
				room: rWheyfordBarbell, 
				face: "up",
				transition: "fade"
			}
			break;
		case inst_70649281:
			// overworld -> wheyford barbell left door
			global.roomChange = {
				x: 736 + 32,
				y: 1120 - 32,
				room: rWheyfordBarbell, 
				face: "up",
				transition: "fade"
			}
			break;

		// pump palace
		case inst_9B9658A:
			// pump palace right door -> overworld
			global.roomChange = {
				x: 1280, 
				y: 448 + 32, 
				face: "down", 
				room: rOverworld, 
				transition: "fade"
			};
			break;
		case inst_1A758F22:
			// pump palace left door -> overworld
			global.roomChange = {
				x: 1280 - 32, 
				y: 448 + 32, 
				face: "down", 
				room: rOverworld, 
				transition: "fade"
			};
			break;
		case inst_2EC7C37A:
			// pump palace stairs ->
			global.roomChange = {

			};
			break;
		
		// stores
		case inst_1F9D8954:
			// bbnc -> overworld
			global.roomChange = {
				x: 1248, 
				y: 1056 + 32, 
				face: "down", 
				room: rOverworld, 
				transition: "fade"
			};
			break;

		// wheyford barbell
		// left exit
		case inst_1807F49A:
			global.roomChange = {
				x: 1728, 
				y: 1280 + 32, 
				room: rOverworld, 
				face: "down",
				transition: "fade"
			};
			break;
		// right exit
		case inst_5EB09401:
			global.roomChange = {
				x: 1728 + 32, 
				y: 1280 + 32, 
				room: rOverworld, 
				face: "down",
				transition: "fade"
			};
			break;

		// default
		default:
			global.roomChange = {
				x: self.x, 
				y: self.y + 32, 
				face: "down", 
				room: room, 
				transition: "fade"
			};
			debug(global.roomChange, -1);
			break;
	}
	
	return;
}