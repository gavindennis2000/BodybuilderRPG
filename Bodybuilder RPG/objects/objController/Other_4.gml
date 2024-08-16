if (!instance_exists(objDevTools)) { instance_create_layer(x, y, layer, objDevTools); }
if (!instance_exists(objCamera)) { instance_create_layer(x, y, layer, objCamera); }
if (!instance_exists(objMusic)) { instance_create_layer(x, y, layer, objMusic); }

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
	case momF1:
		global.roomVar = "Mom's House";
		global.subRoom = "Upstairs";
		break;
	case roomGuitar:
		global.subRoom = "roomGuitar";
		break;
	default: 
		global.roomVar = -1
		global.subRoom = -1;
		break;
}

if (global.subRoom == "roomGuitar") {
	if (global.workout == "leg novice") { global.subRoom = "Leg Workout - Novice"; }
}
drawRoom = false;
drawSub = false;
showRoom();
showSubRoom();