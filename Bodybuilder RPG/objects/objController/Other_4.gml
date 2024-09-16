if (!instance_exists(objDevTools)) { instance_create_layer(x, y, layer, objDevTools); }
if (!instance_exists(objCamera)) { instance_create_layer(x, y, layer, objCamera); }
if (!instance_exists(objMusic)) { instance_create_layer(x, y, layer, objMusic); }
if (!instance_exists(objPause)) { instance_create_layer(x, y, layer, objPause); }
if (!instance_exists(objKeyEvents)) { instance_create_layer(x, y, layer, objKeyEvents); }
if (!instance_exists(objItemTiles)) { instance_create_layer(x, y, layer, objItemTiles); }
if (!instance_exists(obj_gmlive)) { instance_create_layer(x, y, layer, obj_gmlive); }

global.minimum = min(global.push, global.pull, global.legs);
global.maximum = max(global.push, global.pull, global.legs);
global.total = global.push + global.pull + global.legs;

global.workout = "novice pull";
if (room == rWorkout) {
	switch(global.workout) {
		case "novice leg":
		case "intermediate push":
		case "advanced pull":
			if (!instance_exists(objGuitar)) { instance_create_layer(x, y, layer, objGuitar); } 
			break;
		case "novice pull":
			if (!instance_exists(objPullup)) { instance_create_layer(x, y, layer, objPullup); } 
			break;
	}
}
global.prevRoom = global.roomVar;
global.prevSub = global.subRoom;

switch (room) {
	case rMom:
		global.roomVar = "Mom's House";
		global.subRoom = "Basement";
		break;
		
	// pump palace
	case rPumpPalace:
		switch(global.roomID) {
			case "pp cp":
			default:
				global.roomVar = "Pump Palace - Central Prairie";
				global.subRoom = -1;
				break;
		}
		break;	
	// workouts
	case rWorkout:
		global.subRoom = "roomGuitar";
		break;
		
	// houses
	case rHouse:
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
	// novice
	if (global.workout == "novice push") { 
		global.roomVar = -1;
		global.subRoom = "Push Workout - Novice"; 
	}
	else if (global.workout == "novice pull") { 
		global.roomVar = -1;
		global.subRoom = "Pull Workout - Novice"; 
	}
	else if (global.workout == "novice leg") { 
		global.roomVar = -1;
		global.subRoom = "Leg Workout - Novice"; 
	}
	// intermediate
	if (global.workout == "intermediate push") { 
		global.roomVar = -1;
		global.subRoom = "Push Workout - Intermediate"; 
	}
	else if (global.workout == "intermediate pull") { 
		global.roomVar = -1;
		global.subRoom = "Pull Workout - Intermediate"; 
	}
	else if (global.workout == "intermediate leg") { 
		global.roomVar = -1;
		global.subRoom = "Leg Workout - Intermediate"; 
	}
	// advanced
	if (global.workout == "advanced push") { 
		global.roomVar = -1;
		global.subRoom = "Push Workout - Advanced"; 
	}
	else if (global.workout == "advanced pull") { 
		global.roomVar = -1;
		global.subRoom = "Pull Workout - Advanced"; 
	}
	else if (global.workout == "advanced leg") { 
		global.roomVar = -1;
		global.subRoom = "Leg Workout - Advanced"; 
	}
}
drawRoom = false;
drawSub = false;
showRoom();
showSubRoom();