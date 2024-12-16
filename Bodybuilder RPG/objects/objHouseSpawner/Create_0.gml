///@description Populate rooms with stuff
var yes = true;
switch(global.roomID) {
	
	case "harvey":
	default:
		if (yes) {
			with (objDoor) {
				roomID = -1
				goTo = rOverworld;
				pX = 3520;
				pY = 1888 + 32;
				pFace = "down";	
			}
			// create harveys mom
			with (instance_create_layer(320, 224, layer, objNPC)) {
				npcID = "harvey's mom";
				prompt = false;
			}
		
		}
		break;
		
	case "mason":
		if (yes) {
			with (objDoor) {
				roomID = -1
				goTo = rOverworld;
				pX = 3136;
				pY = 2144 + 32;
				pFace = "down";	
			}
			// create mason
			with (instance_create_layer(320, 224, layer, objNPC)) {
				npcID = "mason";
			}
		}
		break;
		
	case "mom":
		if (yes) {
			with (objDoor) {
				roomID = -1
				goTo = rOverworld;
				pX = 3520;
				pY = 2144 + 32;
				pFace = "down";	
			}
			// create bookshelves
			with instance_create_layer(128, 128, layer, objItem) { itemID = "book"; text = ["Scientific Principles of Hypertrophy Training by Dr. Mike Israetel et al.", "The GOAT of bodybuilding textbooks!"]; }
			with instance_create_layer(128 + 32, 128, layer, objItem) {itemID = "book"; text = ["ProgrammingToWin 2 by Izzy Narvaez", "Great powerlifting program!"]; }
			with instance_create_layer(128 + 64, 128, layer, objItem) {itemID = "book"; text = ["The Art and Science of Lifting by Greg Knuckols and Omar Isuf."]; }
			with instance_create_layer(128 + 96, 128, layer, objItem) {itemID = "book"; text = ["Starting Strength by Mark Rippetoe."]; }
		
			// create mom
			instance_create_layer(320, 224, layer, objNPC, {npcID: "mom"})
		
			// create stairs
			with (instance_create_layer(512, 128, layer, objDoor)) {
				doorID = "downstairs";
				roomID = -1;
				goTo = rMom;
				pX = 512 - 32;
				pY = 160;
				pFace = "left";
			}
			// we're done
		}
		break;
}