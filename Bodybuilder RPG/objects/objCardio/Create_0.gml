// handles cardio space invaders game
/*gmlive*/if (TEST) { if (live_call()) return live_result; }
scale = 0;  // scale to draw the minigame
layer = layer_create(-199, "guitar");  // assigns layer to stuff drawn by objGuitar

// stop whatever music is currently playing
if (instance_exists(objMusic)) {objMusic.workout(); }

// set the return room for if the player dies
global.returnRoom = room;

// initialize some counters
counter1 = 0;
counter2 = 0;

// variable and stuff
textAlpha = 1;
endMinigame = false;