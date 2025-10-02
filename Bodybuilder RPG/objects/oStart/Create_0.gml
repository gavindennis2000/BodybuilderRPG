// define globals for the game

// dev stuff
#macro TEST true 
#macro CAM_WIDTH 512
#macro CAM_HEIGHT 288
#macro TEXTBOX1 #2b7eb5
#macro TEXTBOX2 #81b7db
#macro TEXTBOX3 #2b7eb5
#macro TEXTBOX4 #1f3747
// global.noEncounters = true;

// the story
enum STORY {
    WAKE_UP,
    TALK_TO_MOM,
}
global.storyProgress = STORY.WAKE_UP;
global.events = {
    
}

// players, room info, etc
global.playerSpawn = {
    spawn: true,
    doorOverride: -1,
    roomGoto: room,
    pX: 192 + 32, 
    pY: 128,
    pFace: "up"
}

// battle
global.battle = {
    camX: 0,
    camY: 0,
    battleRoom: rTest,
    init: false,
    started: false,
    party: ["andro"],
    enemies: ["npc"],
    canRun: true,
}