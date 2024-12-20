if TEST { if (live_call()) return live_result; }

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

global.cutscene = false; 
cutsceneH = 0;  // used for cinema bars during cutscenes

// inventory array
global.inventory = [
    {
        name: "Choc. Milk",
        quantity: 1,
        description: "Central Prairie's flagship drink - Replenishes 50hp"
    },
]

// key items struct
global.keyItems = [
    {
        name: "Serva Grips", 
        value: false,
        description: "Certified 'Death Grip' technology"
    },
    {
        name: "Yacht",
        value: false,
        description: "Do you need a description? It's a freakin yacht!"
    },
    {
        name: "Bunny Hood",
        value: false,
        description: "Become the fastest bodybuilder ever! Equip with 'I'"
    },
    {
        name: "Bicycle",
        value: false,
        description: "Time to hop on cycle! Use to teleport between gyms"
    },
	
]

// key events struct
global.keyEvents = {
    meetJim: false,
	unlockedDoor: false,
	atlasStone: false,
	meetMason: false,
    meetJim: false,
    enterSulik: false, 
    meetSulik: false,
}

// stats struct
global.stats = {
    chest: 10,
    shoulders: 10,
    back: 10,
    arms: 10,
    legs: 10,
    cardio: 10,
    fatigue: 0
}

// best and worst muscle groups
global.statsMin = ["",1];
global.statsMax = ["",1];

global.workout = -1;
global.playerX = -1;
global.playerY = -1;
global.returnRoom = -1;

// PRs for each exercise
global.PRs = [
    {  // chapter 1
        name: "DB Bench",
        weight: "50 x ",
        reps: irandom_range(2,9)
    },
    {
        name: "Pullups",
        weight: "",
        reps: irandom_range(2,9)
    },
    {
        name: "Squats",
        weight: "225 x ",
        reps: irandom_range(2,9)
    },
    {  // chapter 2
        name: "Bench Press",
        weight: "135 x ",
        reps: irandom_range(2,9)
    },
    {
        name: "Deadlift",
        weight: "315 x ",
        reps: irandom_range(2,9)
    },
    {
        name: "TBD",
        weight: "0 x ",
        reps: irandom_range(2,9)
    },
    {  // chapter 3
        name: "TBD",
        weight: "0 x ",
        reps: irandom_range(2,9)
    },
    {
        name: "TBD",
        weight: "0 x ",
        reps: irandom_range(2,9)
    },
    {
        name: "TBD",
        weight: "0 x ",
        reps: irandom_range(2,9)
    },
];

drawRoom = false;
drawSub = false;

roomAlpha = 0;
subAlpha = 0;

aTime = 3;
layer = layer_create(-200,"Controller");

function showRoom() {
    // displays the room name when you walk into a new area
	
    if (global.roomVar != global.prevRoom and global.roomVar != -1) {
		drawRoom = true;
		roomAlpha = 0;
		alarm[0] = aTime;	
		alarm[1] = -1;
	}
}	

function showSubRoom() {
    // displays the sub-room name when you walk into a new area
	
    if (global.subRoom != global.prevSub and global.subRoom != -1) {
		drawSub = true;
		subAlpha = 0;
		alarm[2] = aTime;
		alarm[3] = -1;
	}
}

function setMinAndMax() {
    // returns worst muscle group
    
    var stats = global.stats;
    var statsArr = [
        ["chest", stats.chest],
        ["shoulders", stats.shoulders],
        ["back", stats.back],
        ["arms", stats.arms],
        ["legs", stats.legs]
    ]
    
    // sort the temporary array
    array_sort(statsArr, function(i, j) {
        return (i[1] > j[1])    
    });
    
    // set max
    variable_global_set("statsMax", statsArr[0]);
    
    // set min
    variable_global_set("statsMin", statsArr[4]);
}

function exitGame() {
    // goes back to the main menu
    
    game_end();
}