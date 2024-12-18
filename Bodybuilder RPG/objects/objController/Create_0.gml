#macro TEST true

// global variables
global.roomVar = -1;
global.subRoom = -1;
global.prevRoom = -1;
global.prevSub = -1;

global.bicycle = false;
global.bunnyHood = false;

global.roomID = "mom";

global.chapter = 1;
global.characterName = "GAVIN";

// inventory array
global.inventory = [
    {
        name: "Choc. Milk",
        quantity: 1,
        description: "Central Prairie's flagship drink - Replenishes 50hp"
    }
]

// key items struct
global.keyItems = {
	servaGrips: false,
	yacht: false,
	bunnyHood: false,
	bicycle: false
}

// key events struct
global.keyEvents = {
    meetJim: false,
	unlockedDoor: false,
	atlasStone: false,
	meetMason: false,
}

// stats struct
global.stats = {
    chest: 1,
    shoulders: 1,
    back: 1,
    arms: 1,
    legs: 1,
    cardio: 1,
    fatigue: 0
}

global.workout = -1;
global.playerX = -1;
global.playerY = -1;
global.returnRoom = -1;
global.highScores = array_create(9, 0);

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