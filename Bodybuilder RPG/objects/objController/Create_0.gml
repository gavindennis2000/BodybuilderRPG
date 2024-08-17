#macro TEST true

// global variables
global.roomVar = -1;
global.subRoom = -1;
global.prevRoom = -1;
global.prevSub = -1;

global.roomID = "mom";

global.chapter = 1;
global.characterName = "GAVIN";
global.keyItems = [
	["serva grips", true],
	["yacht", false]
]
global.keyEvents = [
	["locked door", true],
	["atlas stone", false]
]

global.push = 4;
global.pull = 4;
global.legs = 4;
global.cardio = 1;

global.minimum = min(global.push, global.pull, global.legs);
global.maximum = max(global.push, global.pull, global.legs);
global.total = global.push + global.pull + global.legs;

global.workout = -1;

// save data
var file = "save.txt"
if (!file_exists(file)) { save_game(); }
else { load_game(); }

drawRoom = false;
drawSub = false;

roomAlpha = 0;
subAlpha = 0;

aTime = 3;
layer = layer_create(-200,"Controller");

function showRoom() {
	if (global.roomVar != global.prevRoom and global.roomVar != -1) {
		drawRoom = true;
		roomAlpha = 0;
		alarm[0] = aTime;	
		alarm[1] = -1;
	}
}	
function showSubRoom() {
	if (global.subRoom != global.prevSub and global.subRoom != -1) {
		drawSub = true;
		subAlpha = 0;
		alarm[2] = aTime;
		alarm[3] = -1;
	}
}