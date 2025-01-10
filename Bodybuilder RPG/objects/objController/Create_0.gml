
// global variables
global.roomVar = -1;
global.subRoom = -1;
global.prevRoom = -1;
global.prevSub = -1;

global.outfit = {
    color: 0,
    hair: 0,
    hairColor: 0
}
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
    bunnyHoodCoupon: false,
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
    ultimate: 0,
    money: 0
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

        // scan description
        description: [
            "DYEL: A powerlifter with ~5 years experience that `doesn't even look like he lifts.",
            "His lackluster bench make him vulnerable to push `attacks.",
            "Don't sleep on his deadlift, however. He claims to have a junior record in the 75kg weight class."
        ],

        // attacks
        attacks: [
            {
                name: "Unsolicited Advice",  // the name of the attack
                announcement: "DYEL gives Unsolicited Advice.",
                description: $"The terrible bench press tips cause psychological harm to {global.characterName}.",
                coefficient: 1,  // multiplies by strength for attack damage (e.g. str:5 * coeff:1.5 = 7.5 fatigue)
                effect: "none"  // special ailment inflicted by the attack, if any
            },
            {
                name: "Sumo Deadlift Smash",  // the name of the attack
                announcement: $"DYEL attacks with Sumo Deadlift Smash.",
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

        // scan description
        description: [
            "STRONGMAN: A local strongman with absurd strength `and endurance.",
            "Despite his power, his size slows him down `considerably.",
            "Your best bet is to take him out quickly or run away before he attacks."
        ],

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
                announcement: "STRONGMAN's energy is fully charged!",
                description: $"He hurls an at atlas stone at {global.characterName}.",
                coefficient: 1,  // multiplies by strength for attack damage (e.g. str:5 * coeff:1.5 = 7.5 fatigue)
                effect: "none"  // special ailment inflicted by the attack, if any
            }
        ],
        attackIndex: 0,

        // health
        hp: 150,

        // attack power
        strength: 50,

        // defense/vulnerabilities
        pushDef: 1,
        pullDef: 1,
        legDef: 1,
    },

    gymbro: {
        // drawing info
        name: "GYM BRO",
        spr: sprPlayerDown,
        imgSpd: 0,
        x: 240 - 32,
        y: 135 - 32 - 30,

        // scan description
        description: [
            "A recreational bodybuilder with an impressive physique and awesome tattoos.",
            "Everyday is chest day for him so watch out for his sizable upper body strength.",
            "His baggy sweatpants might suggest a weakness. Maybe he skips a certain day..."
        ],

        // attacks
        attacks: [
            {
                name: "Rerack",  // the name of the attack
                announcement: "GYM BRO refuses to rerack his weights after training.",  // first line of dialog
                description: $"His inconsiderate action lead to a plate falling on {global.characterName}'s foot.",
                coefficient: 1,  // multiplies by strength for attack damage (e.g. str:5 * coeff:1.5 = 7.5 fatigue)
                effect: "none"  // player get's extra ultimate
            },
            {
                name: "Bench Press Blast",  // the name of the attack
                announcement: "GYM BRO attacks with Bench Press Blast.",  // first line of dialog
                description: $"The three plate power overwhelms {global.characterName}. `GYM BRO laughs.",
                coefficient: 1.5,  // multiplies by strength for attack damage (e.g. str:5 * coeff:1.5 = 7.5 fatigue)
                effect: "ultimate"  // special ailment inflicted by the attack, if any
            },
            {
                name: "BCAA",  // the name of the attack
                announcement: "GYM BRO takes intraworkout BCAAs.",  // first line of dialog
                description: $"GYM BRO's health and strength have increased.",
                coefficient: 0,  // multiplies by strength for attack damage (e.g. str:5 * coeff:1.5 = 7.5 fatigue)
                effect: "none"  // special ailment inflicted by the attack, if any
            },
            {
                name: "Rerack",  // the name of the attack
                announcement: "GYM BRO refuses to rerack his weights after training.",  // first line of dialog
                description: $"His inconsiderate action lead to a plate falling on {global.characterName}'s foot.",
                coefficient: 1,  // multiplies by strength for attack damage (e.g. str:5 * coeff:1.5 = 7.5 fatigue)
                effect: "none"  // player get's extra ultimate
            },
            {
                name: "Bench Press Blast",  // the name of the attack
                announcement: "GYM BRO attacks with Bench Press Blast.",  // first line of dialog
                description: $"The three plate power overwhelms {global.characterName}. `GYM BRO laughs.",
                coefficient: 1.5,  // multiplies by strength for attack damage (e.g. str:5 * coeff:1.5 = 7.5 fatigue)
                effect: "ultimate"  // special ailment inflicted by the attack, if any
            },
        ],
        attackIndex: 0,

        // health
        hp: 50,

        // attack power
        strength: 15,

        // defense/vulnerabilities
        pushDef: 2,
        pullDef: 2,
        legDef: 0.5,
    },
    
    stoiclifter: {
        // drawing info
        name: "STOIC LIFTER",
        spr: sprPlayerDown,
        imgSpd: 0,
        x: 240 - 32,
        y: 135 - 32 - 30,

        // scan description
        description: [
            "A chill lifter who minds his own business and never misses a workout.",
            "He loves training every muscle group and has no apparent weakness.",
            "His earbuds seem to give him special powers. But how much battery do they have?"
        ],

        // attacks
        attacks: [
            {
                name: "Earbuds",  // the name of the attack
                announcement: "STOIC LIFTER puts in his earbuds.",  // first line of dialog
                description: "His defense has greatly improved.",
                coefficient: 0,  // multiplies by strength for attack damage (e.g. str:5 * coeff:1.5 = 7.5 fatigue)
                effect: "none",
            },
            {
                name: "Efficient Overhead Press",  // the name of the attack
                announcement: "STOIC LIFTER attacks with Efficient Overhead Press",  // first line of dialog
                description: "Wow! His technique is even better than yours!",
                coefficient: 1,  // multiplies by strength for attack damage (e.g. str:5 * coeff:1.5 = 7.5 fatigue)
                effect: "none"  // special ailment inflicted by the attack, if any
            },
            {
                name: "Weighted Pullup Pounce",  // the name of the attack
                announcement: "STOIC LIFTER continues his assault with Weighted Pullup Pounce",  // first line of dialog
                description: "His chest to bar capability is remarkable, but ow! That hurt!",
                coefficient: 0.75,  // multiplies by strength for attack damage (e.g. str:5 * coeff:1.5 = 7.5 fatigue)
                effect: "none"  // special ailment inflicted by the attack, if any
            },
            {
                name: "Weighted Dip Destruction",  // the name of the attack
                announcement: "STOIC LIFTER finishes his workout with his strongest move: Weighted Dip Destruction.",  // first line of dialog
                description: $"His watermelon pecs and lobster claw triceps completely mog {global.characterName}!",
                coefficient: 1.5,  // multiplies by strength for attack damage (e.g. str:5 * coeff:1.5 = 7.5 fatigue)
                effect: "none"  // player get's extra ultimate
            },
            {
                name: "Remove Earbuds",  // the name of the attack
                announcement: "STOIC LIFTER is finished with his workout so he removes his earbuds.",
                description: "His defense has greatly decreased.",
                coefficient: 0,  // multiplies by strength for attack damage (e.g. str:5 * coeff:1.5 = 7.5 fatigue)
                effect: "none"  // special ailment inflicted by the attack, if any
            },
            {
                name: "Skip",
                effect: "forever"
            }
        ],
        attackIndex: 0,

        // health
        hp: 50,

        // attack power
        strength: 12,

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
        description: "Upper body assault - Some would call it an uppercut of sorts.",
    },
    {
        name: "Pulldown",
        description: "Back attack - A menacing takedown.",
    },
    {
        name: "Leg Press",
        description: "An aerial doublekick - Good thing you didn't skip leg day!",
    },
    {
        name: "Max Out",
        description: "Full body obliteration - Combines the power of every muscle group.",
    },
]
global.skills = [
    // an array of skill objects
    // starting skills - scan
    {
        name: "Scan",
        description: "Act like a science-based lifter and overanalyze the enemy",
        unlocked: true,
        uses: -1,
        limit: -1,
    },
    // chapter 1 skills
    {
        name: "Brace",
        description: "Ancient powerlifting technique - Cut the enemy's next attack damage by 75%",
        unlocked: false,
        uses: -1,
        limit: -1,
    },
    {
        name: "Hype",
        description: "Amp up for the next attack - Increase damage by up to 200%",
        unlocked: false,
        uses: 5, 
        limit: 5
    },
    // chapter 2 skills
    {
        name: "Deload",
        description: "Recovery tactic - Reduces fatigue by 30%",
        unlocked: false,
        uses: 3,
        limit: 3
    },
    {
        name: "Superset",
        description: "Time saving gym hack - Combine two attacks",
        unlocked: false,
        uses: 2,
        limit: 2
    },
    // chapter 3 skills
    {
        name: "Deficit RDL",
        description: "Bulletproof your back - Cut enemy's future attacks by 50%",
        unlocked: false,
        uses: 1,
        limit: 1
    },
    {
        name: "Berserk & Bulk",
        description: "All the food, all the gains - Increase damage by 300% for one turn, but take double damage",
        unlocked: false,
        uses: 1,
        limit: 1
    }
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
        return (i[1] < j[1])    
    });
    
    // set max
    global.statsMax = statsArr[0];
    
    // set min
    global.statsMin = statsArr[4];
}

function useItem(item) {
    // uses item from inventory during battle or pause menu

    // text that will be returned
    var txt = "";

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