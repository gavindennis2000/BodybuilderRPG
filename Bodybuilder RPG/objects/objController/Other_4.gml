// room start

if (!instance_exists(objDevTools)) { instance_create_layer(x, y, layer, objDevTools); }
if (!instance_exists(objCamera)) { instance_create_layer(x, y, layer, objCamera); }
if (!instance_exists(objMusic)) { instance_create_layer(x, y, layer, objMusic); }
if (!instance_exists(objPause)) { instance_create_layer(x, y, layer, objPause); }
if (!instance_exists(objKeyEvents)) { instance_create_layer(x, y, layer, objKeyEvents); }
if (!instance_exists(objItemTiles)) { instance_create_layer(x, y, layer, objItemTiles); }
if (!instance_exists(obj_gmlive)) { instance_create_layer(x, y, layer, obj_gmlive); }

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

drawRoom = false;
drawSub = false;

showRoom();
showSubRoom();