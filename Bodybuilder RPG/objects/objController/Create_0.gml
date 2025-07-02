// objController Create

/*gmlive*/ if (TEST) { if (live_call()) return live_result; }

layer = layer_create(layer_get_depth(layer_get_id("Instances")) - 2, "Controller");

// global stuff
// events/cutscenes/actions
global.events = {
    // chapter 1
    startCh1: false,
    meetMom: false,
    meetJim: false,
    meetAna: false,
    bbnc: false,
    bbnc2: false,
    bbncTalkToOwner: false,
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
        quantity: 1, 
    }
];
global.skills = {
    andro: [],
    ana: [],
    doms: [
        {
            name: "brace",
            cost: 1
        }
    ]
}

// room transitioning
global.roomVar = -1;
global.prevRoomVar = -1;
global.roomChange = {
    x: -1,
    y: -1,
    room: -1,
    transition: "fade",
    face: "up"
}
fadeAmount = 0;
fadeAmountChange = 0.15;
alarmTime = 2;

// cutscenes
global.cutscene = -1;
cutsceneY = 0;

// battle engine
global.battle = false;
global.battleData = (variable_global_exists("battleData")) ? global.battleData : {
    party: [],
    enemies: [],
    canRun: true
};
global.battleMusic = -1;
global.noEncounters = true;
global.stats = {
    // level is a group asset
    level: 1,
    xp: 0,
    xpNext: 100,
    // the fighters
    andro: {
        hp: 200,
        maxhp: 200,
        skill: 1,
        maxskill: 1,
        strength: 10,
        endurance: 10,
        cardio: 20,
    },
    ana: {
        hp: 120,
        maxhp: 120,
        skill: 3,
        maxskill: 3,
        strength: 10,
        endurance: 10,
        cardio: 10,
    },
    doms: {
        hp: 100,
        maxhp: 100,
        skill: 1,
        maxskill: 1,
        strength: 10,
        endurance: 10,
        cardio: 10,
    },

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
showRoomVarAlpha = 0;
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