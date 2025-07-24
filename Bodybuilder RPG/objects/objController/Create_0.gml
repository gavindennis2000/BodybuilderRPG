// objController Create

/*gmlive*/ if (TEST) { if (live_call()) return live_result; }

layer = layer_create(layer_get_depth(layer_get_id("Instances")) - 2, "Controller");

// global stuff
global.paused = false;

// events/cutscenes/actions
global.events = {
    // chapter 1
    prologueStart: false,
    prologueDecision: false,
    prolgueConfirmation: false,
    startCh1: false,
    meetMom: false,
    meetJim: false,
    meetAna: false,
    bbnc: false,
    bbnc2: false,
    bbncTalkToOwner: false,
    firstPay: false,
    meetSamson: false,
    firstTimeAtWheyfordBarbell: false,
    defeatDonnie: false,
    meetSamson: false,
    endCh1: false,
    goodbyeAna: false,
    meetArnold: false,

    // chapter 2
    atlasStone: false,
}
global.chapter = 1;
global.cutscene = false; 
global.cutsceneSong = -1;

// the party
global.character = "andro";
global.characterName = "andro";
global.party = ["andro"];
global.inventory = [
    {
        name: "Choc. Milk",
        quantity: 2, 
    }
];
global.keyItems = {
    wheyfordBarbellKey: false,
}
global.skills = {
    andro: [
        {
            name: "Talk", 
            cost: 1
        },
    ],
    ana: [
        {
            name: "Train", 
            cost: 1
        }
    ],
    doms: [
        {
            name: "Brace",
            cost: 1
        }
    ]
}

// room transitioning
global.roomVar = -1;
global.prevRoomVar = -1;
global.subRoomVar = -1;
global.prevSubRoomVar = -1;
global.roomChange = {
    x: -1,
    y: -1,
    room: -1,
    transition: "fade",
    face: "up"
}
global.apology = false;
global.defeated = [];  // enemies that have been defeated will be destroyed before you can talk to them
global.openedChests = [];  // chests that are opened get added here
fadeAmount = 0;
fadeAmountChange = 0.15;
alarmTime = 2;

// cutscenes
global.cutscene = -1;
cutsceneY = 0;

// battle engine
// base stats for playable characters
global.ANDRO_BASE_STATS = {
    hp: 200,
    maxhp: 200,
    skill: 1,
    maxskill: 1,
    strength: 10,
    cardio: 20,
}

global.ANA_BASE_STATS = {
    hp: 120,
    maxhp: 120,
    skill: 5,
    maxskill: 3,
    strength: 9,
    cardio: 10,
}

global.DOMS_BASE_STATS = {
    hp: 100,
    maxhp: 100,
    skill: 1,
    maxskill: 1,
    strength: 20,
    cardio: 10,
}

global.battle = false;
global.battleData = (variable_global_exists("battleData")) ? global.battleData : {
    party: [],
    enemies: [],
    canRun: true
};
global.battleMusic = -1;
global.noEncounters = true;
global.enemiesToDestroy = [];
global.enemiesDestroyed = [];
global.stats = {
    // level is a group asset
    level: 1,
    xp: 0,
    xpNext: 100,
    // the fighters
    andro: variable_clone(global.ANDRO_BASE_STATS),
    ana: variable_clone(global.ANA_BASE_STATS),
    doms: variable_clone(global.DOMS_BASE_STATS),
}

setStats();
if (TEST && KILL_EVERYTHING) {
    setStats(4);
}

goToNextRoom = function() {
    // goes to next room

    /*gmlive*/ if (TEST) { if (live_call()) return live_result; }

    alarm[0] = alarmTime;

    if (room == rBattle) {
        if (audio_is_playing(global.battleMusic))
            audio_sound_gain(global.battleMusic, 0, 600);
    }
    else
        audio_sound_gain(global.songPlaying, 0.3, 600);

    return;
}

showRoomVar = false;
showSubRoomVar = false;
showRoomVarAlpha = 0;
showSubRoomVarAlpha = 0;
showSubRoomAlarm = 0;

showRoomVarFunc = function() {
    // shows the room var is the top right corner

    /*gmlive*/ if (TEST) { if (live_call()) return live_result; }

    if (global.roomVar == global.prevRoomVar)
        exit;

    alarm[2] = 120;
    showRoomVarAlpha = 0;
    showRoomVar = true;

    return;
}
showSubRoomVarFunc = function() {
    // shows the room var is the top right corner

    /*gmlive*/ if (TEST) { if (live_call()) return live_result; }

    if (global.subRoomVar == global.prevSubRoomVar || global.subRoomVar == -1)
        exit;

    showSubRoomAlarm = 120;
    showSubRoomVarAlpha = 0;
    showSubRoomVar = true;

    return;
}