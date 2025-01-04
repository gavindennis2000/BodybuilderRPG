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
        description: "Central Prairie's flagship drink - Reduces fatigue by 50%"
    },
]

// key items struct
global.keyItems = [
    {
        name: "Serva Grips", 
        value: false,
        description: "Certified death grip technology"
    },
    {
        name: "Yacht",
        value: false,
        description: "Do you need a description? It's a freakin yacht!"
    },
    {
        name: "Bunny Hood",
        value: false,
        description: "Become the fastest bodybuilder ever! Equip with 'B'"
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
    fatigue: 0,
    ultimate: 0
}

// best and worst muscle groups
global.statsMin = ["",1];
global.statsMax = ["",1];

global.workout = -1;
global.returnRoom = -1;
global.battleSong = -1;

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

// battle stuff
global.battle = false;
global.noEncounters = true;
global.enemies = {
    dyel: {
        // drawing info
        name: "DYEL",
        spr: sprPlayerDown,
        imgSpd: 0,
        x: 240 - 32,
        y: 135 - 32 - 30,

        // attacks
        attacks: [
            {
                name: "Unsolicited Advice",  // the name of the attack
                description: $"The terrible bench press tips cause psychological harm to {global.characterName}.",
                coefficient: 1,  // multiplies by strength for attack damage (e.g. str:5 * coeff:1.5 = 7.5 fatigue)
                effect: "none"  // special ailment inflicted by the attack, if any
            },
            {
                name: "Sumo Deadlift Smash",  // the name of the attack
                description: "It's only strong because he's doing sumo! If he did conventional, it wouldn't have hurt so bad (allegedly).",
                coefficient: 1.5,  // multiplies by strength for attack damage (e.g. str:5 * coeff:1.5 = 7.5 fatigue)
                effect: "none"  // special ailment inflicted by the attack, if any
            }
        ],
        attackIndex: 0,

        // health
        hp: 50,

        // attack power
        strength: 5,

        // defense/vulnerabilities
        pushDef: 0.75,
        pullDef: 1,
        legDef: 1,
    },

    strongman: {
        // drawing info
        name: "STRONGMAN",
        spr: sprPlayerDown,
        imgSpd: 0,
        x: 240 - 32,
        y: 135 - 32 - 30,

        // attacks
        attacks: [
            {
                name: "Charge",  // the name of the attack
                description: $"STRONGMAN begins charging his power.",
                coefficient: 0,  // multiplies by strength for attack damage (e.g. str:5 * coeff:1.5 = 7.5 fatigue)
                effect: "none"  // special ailment inflicted by the attack, if any
            },
            {
                name: "Charge",  // the name of the attack
                description: $"STRONGMAN continues charging his power.",
                coefficient: 0,  // multiplies by strength for attack damage (e.g. str:5 * coeff:1.5 = 7.5 fatigue)
                effect: "none"  // special ailment inflicted by the attack, if any
            },
            {
                name: "Release",  // the name of the attack
                description: $"STRONGMAN hurls an at atlas stone at {global.characterName}.",
                coefficient: 1,  // multiplies by strength for attack damage (e.g. str:5 * coeff:1.5 = 7.5 fatigue)
                effect: "none"  // special ailment inflicted by the attack, if any
            }
        ],
        attackIndex: 0,

        // health
        hp: 200,

        // attack power
        strength: 50,

        // defense/vulnerabilities
        pushDef: 1,
        pullDef: 1,
        legDef: 1,
    }
}

global.attacks = [
    // an array of attack objects
    // you start with all of these
    {
        name: "Overhead Press",
        description: "Upper body assault - Some would call it an uppercut of sorts",
        limit: 10,
        power: 1
    },
    {
        name: "Pulldown",
        description: "Back attack - A menacing takedown",
        limit: 10,
        power: 1
    },
    {
        name: "Leg Press",
        description: "An aerial doublekick - Good thing you didn't skip leg day!",
        limit: 10,
        power: 1
    },
]
global.skills = [
    // an array of skill objects
    // starting skills - scan
    {
        name: "Scan",
        description: "Act like a science-based lifter and overanalyze the enemy",
        unlocked: true,
        limit: -1,
        limitMax: -1,
    },
    // chapter 1 skills
    {
        name: "Brace",
        description: "Ancient powerlifting technique - Cut the enemy's next attack damage by 75%",
        unlocked: false,
        limit: -1,
        limitMax: -1,
    },
    {
        name: "Flex",
        description: "Scare away shrimps with your freak physique!",
        unlocked: false,
        limit: -1, 
        limitMax: -1,
    },
    {
        name: "Hype",
        description: "Amp up for the next attack - Increase damage by up to 200%",
        unlocked: false,
        limit: 5, 
        limitMax: 5
    },
    // chapter 2 skills
    {
        name: "Deload",
        description: "Recovery tactic - Reduces fatigue by 30%",
        unlocked: false,
        limit: 3, 
        limitMax: 3
    },
    {
        name: "Superset",
        description: "Time saving gym hack - Combine two attacks",
        unlocked: false,
        limit: 2,
        limitMax: 2
    },
    // chapter 3 skills
    {
        name: "Berserker Bulk",
        description: "All the food, all the gains - Increase damage by 300%, but take double damage",
        unlocked: false,
        limit: 1,
        limitMax: 1
    },
    {
        name: "Deficit RDL",
        description: "Bulletproof your back - Cut enemy's future attacks by 50%",
        unlocked: false,
        limit: 1,
        limitMax: 1
    },
]
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

function useItem(item) {
    // uses item from inventory during battle or pause menu

    // text that will be returned
    var txt = "";

    debug(item);

    switch (item) {
        case "Choc. Milk":
            for (var i = 0; i < array_length(global.inventory); i++) {
                // reduce the quantity of the item in the inventory
                if (global.inventory[i].name == item) {
                    global.inventory[i].quantity--;
                    // delete the item if quantity is 0
                    if (global.inventory[i].quantity <= 0) {
                        array_delete(global.inventory, i, 1);
                    }
                }
            }
            // subtract 20 fatigue
            txt = $"The delicious chocolate milk reduces {global.characterName}'s `fatigue!"
            global.stats.fatigue = (global.stats.fatigue >= 50) ? global.stats.fatigue - 50 : 0;
            break;
    }
    return txt;
}

function exitGame() {
    // goes back to the main menu
    
    game_end();
}