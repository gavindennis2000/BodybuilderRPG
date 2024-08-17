if (!instance_exists(objDevTools)) { instance_create_layer(x, y, layer, objDevTools); }
if (!instance_exists(objCamera)) { instance_create_layer(x, y, layer, objCamera); }
if (!instance_exists(objMusic)) { instance_create_layer(x, y, layer, objMusic); }
instance_create_layer(x, y, layer, objKeyEvents);

global.minimum = min(global.push, global.pull, global.legs);
global.maximum = max(global.push, global.pull, global.legs);
global.total = global.push + global.pull + global.legs;

if (room == roomGuitar and !instance_exists(objGuitar)) { instance_create_layer(x, y, layer, objGuitar); } 

global.prevRoom = global.roomVar;
global.prevSub = global.subRoom;

switch (room) {
	case momB:
		global.roomVar = "Mom's House";
		global.subRoom = "Basement";
		break;
		
	// pump palace
	case pumpPalaceCP:
		switch(global.roomID) {
			case "pp cp":
			default:
				global.roomVar = "Pump Palace - Central Prairie";
				global.subRoom = -1;
				break;
		}
		break;	
	// workouts
	case roomGuitar:
		global.subRoom = "roomGuitar";
		break;
		
	// houses
	case house:
		switch(global.roomID) {
			case "mom":
				global.roomVar = "Mom's House";
				global.subRoom = "Upstairs";
				break;
			case "harvey":
				global.roomVar = "Harvey's House";
				global.subRoom = -1;
				break;
			case "mason":
				global.roomVar = "Mason's House";
				global.subRoom = -1;
				break;
			default:
				global.roomVar = "House";
				global.subRoom = -1;
				break;
		}
		break;
		
	default: 
		global.roomVar = -1
		global.subRoom = -1;
		break;
}

if (global.subRoom == "roomGuitar") {
	if (global.workout == "leg novice") { 
		global.roomVar = -1;
		global.subRoom = "Leg Workout - Novice"; 
	}
}
drawRoom = false;
drawSub = false;
showRoom();
showSubRoom();