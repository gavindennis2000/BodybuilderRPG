// room start

if (!instance_exists(objDevTools)) { instance_create_layer(x, y, layer, objDevTools); }
if (!instance_exists(objCamera)) { instance_create_layer(x, y, layer, objCamera); }
if (!instance_exists(objMusic)) { instance_create_layer(x, y, layer, objMusic); }
if (!instance_exists(objPause)) { instance_create_layer(x, y, layer, objPause); }
if (!instance_exists(objKeyEvents)) { instance_create_layer(x, y, layer, objKeyEvents); }
if (!instance_exists(objItemTiles)) { instance_create_layer(x, y, layer, objItemTiles); }
if (!instance_exists(obj_gmlive)) { instance_create_layer(x, y, layer, obj_gmlive); }
if (!instance_exists(objNPCSpawner)) { instance_create_layer(x, y, layer, objNPCSpawner); }

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

if (room != rBattle) {
	showRoom();
	showSubRoom();
}

// set new min and max for muscle groups
setMinAndMax()

// key event stuff
// first time at pump palace
if (room == rPumpPalace && !global.keyEvents.meetJim) {
	// block off the doors
	with (objDoor) {
		instance_create_layer(x, y, layer, objItem, {
			itemID: "locked door",
			text: [
				"I need to introduce myself to Mr. Ohner before I leave."
			]
		})
	}
}

// enter sulik cutscene
if (room == rOverworld && global.keyEvents.enterSulik && !global.keyEvents.meetSulik) {
    global.keyEvents.meetSulik = true;
    global.cutscene = true;
    with (objPlayer) { cutscene = true; }
    instance_create_layer(objPlayer.x, objPlayer.y + 128, layer, objNPC, {
        npcID: "sulik"
    });
}