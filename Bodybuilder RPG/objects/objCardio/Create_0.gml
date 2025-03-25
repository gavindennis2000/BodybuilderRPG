// handles cardio space invaders minigame

/*gmlive*/if (TEST) { if (live_call()) return live_result; }

scale = 0;  // scale to draw the minigame
layer = layer_create(-199, "guitar");  // assigns layer to stuff drawn by objGuitar

// stop whatever music is currently playing
if (instance_exists(objMusic)) {objMusic.preMinigame(); }
alarm[0] = 30;

// set the return room for if the player dies
global.returnRoom = room;

// initialize some counters
counter1 = 0;
counter2 = 0;

// variable and stuff
textAlpha = 1;
endMinigame = false;
state = "start";
    startX = camera_get_view_x(view_camera[0]) + 480 + 64;