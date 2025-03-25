// handles the 'rhythm game' style workout mini games

/*gmlive*/if (TEST) { if (live_call()) return live_result; }

// stop whatever music is currently playing
if (instance_exists(objMusic)) {objMusic.preMinigame(); }

// set the return room for if the player dies
global.returnRoom = room;

// get camera position
var camX = camera_get_view_x(view_camera[0]);
var camY = camera_get_view_y(view_camera[0]);

// stats
isPaused = false;  // boolean that checks if game is paused
isExiting = false;  // boolean that check if minigame is over
pauseSpd = 0;  // speed of notes before they are paused
reps = 0;  // number of notes gotten by player
maxReps = 0;  // total number of notes in each song
var delay = 80;  // alarm time before notes start appearing
var aTime = 50;  // alarm time before music starts playing
var extra = 0;  // extra time added to the alarm
layer = layer_create(-199, "guitar");  // assigns layer to stuff drawn by objGuitar
selection = "no";  // selection for pausing
exitSpd = 2;  // speed at which player sprite exits
msg = [""];  // message to give to player after workout
levelsToAdd = 0;  // levels to give the player after workout
alarmTemp = 0;  // hold alarm time when pausing
blackOut = false;  // the player blacks out when fatigue >= 100

// write the songs bro
notes1 = [  // [position, length] - Leg Novice
	// verse 1
	[0,4], [0,4], [0,4], [0,4],
	[2,4], [2,4], [2,4], [2,4],
	[1,4], [1,4], [1,4], [1,4],
	[0,4], [0,4], [0,4],
	
	// chorus
	[2,8], [2,14], [2, 16], [2, 16], [1, 6], [0, 8],
	[2,4], [2,14], [2, 16], [2, 16], [1, 6], [1, 8],
	
	// verse 2
	[0,4], [0,4], [0,4], [0,4],
	[2,4], [2,4], [2,4], [2,4],
	[1,4], [1,4], [1,4], [1,4],
	[0,4], [0,4], [0,4], [0,4],
	
	[0,4], [0,4], [0,4], [0,4],
	[2,4], [2,4], [2,4], [2,4],
	[1,4], [1,4], [1,4], [1,4],
	[0,4], [0,4], [0,4], [0,4],
	
	// bridge
	[1,4], [2,4], [3,2], 
	[0, 10],
	[1,16], [2,4], [3,2], 
	[0, 10],[0,4],[0,4],[0,4],
	
	// solo
	[0,4],[0,12],[1,2],[3,2],[2,4],[1,2],[2,4],[1,4],
	[3, 8],[2,4],[1,4],[0,2],[1,4],[0,2],[0,4],
	[0,6],[1,4],[0,2],[0,4], [0,6],[1,4],[2,2],[1,4],
	[3,4],[3,6],[3,4],[3,4],
	[3,4],[3,4],[3,4],[3,4],[3,2],[3,2]
]
notes2 = [  // [position, length] - push intermediate
	// verse 1
	[0, 4], [1, 4], [1, 4], [1, 4], [1, 4], [2, 4], [1, 4], [1, 4], [0, 4], [1, 4], [1, 4], [1, 4], [1, 4], [1, 4], [1, 4], [1, 4],
	[0, 4], [1, 4], [1, 4], [1, 4], [1, 4], [2, 4], [1, 4], [1, 4], [0, 4], [0, 4], [0, 4], [0, 4], [1, 4], [1, 4], [1, 4], [1, 4],
	[0, 4], [1, 4], [1, 4], [1, 4], [1, 4], [2, 4], [1, 4], [1, 4], [0, 4], [1, 4], [1, 4], [1, 4], [1, 4], [1, 4], [1, 4], [1, 4],
	[0, 4], [1, 4], [1, 4], [1, 4], [1, 4], [2, 4], [1, 4], [1, 4], [0, 4], [0, 4], [0, 4], [0, 4], [1, 4], [1, 4], [1, 4], [1, 4],
	
	// chorus 1
	[0, 2], [2, 6], [1, 4], [2, 4],
	[1, 2], [3, 6], [2, 4], [3, 4],
	[0, 2], [2, 6], [1, 4], [2, 4],
	[1, 2], [3, 6], [0, 4], [2, 4],
	
	[0, 2], [2, 6], [1, 4], [2, 4],
	[1, 2], [3, 6], [2, 4], [3, 4],
	[0, 2], [2, 6], [1, 4], [2, 4],
	[1, 2], [2, 6], [2, 4], [3, 4],
	
	[0, 2], [2, 6], [1, 4], [2, 4],
	[1, 2], [3, 6], [2, 4], [3, 4],
	[0, 2], [2, 6], [1, 4], [2, 4],
	[1, 2], [3, 6], [0, 4], [2, 4],
	
	[0, 2], [2, 6], [1, 4], [2, 4],
	[1, 2], [3, 6], [2, 4], [3, 4],
	
	[0, 2], [0, 4], [1, 2], [2, 2], [3, 2], [2, 2], [1, 2], [0, 2], [0,2],
	 //solo
	[3, 16], [3, 4], [3, 4], [3, 4],
	[3, 4], [3, 4], [3, 4], [2, 2], [1, 2],
	[2, 2], [2, 6], [2, 4], [1, 4], [1, 2],
	
	[0, 12], [1, 2], [2, 2], [2, 4], [3, 2], [2, 2],
	[2, 4], [3,2], [2,2], [3,2], [2,2], [1,2], [2,2],
	[1,4], [1,2], [2,2], [2,4], [3,2], [2,2], [2,2], [3,2], [2,2], [1,2],
	[0,12], [0,2], [2,2], 
	
	[3,2], [2,2], [1,2], 
	[3,2], [2,2], [1,2], 
	[3,2], [2,2], [1,2], 
	[3,2], [2,2], [1,2], [2,2],
	
	[1, 8], [1, 4], [2,4], [2,4], [3,4], [3,4], [3,4], [2,2],
	
	[0, 6], [2,4], [1,4], [3,4], [0, 4], [2, 4],
	[1, 4], [3,4], [0,4], [0,2], [1,2], [1,2], [2,2], [2,2], [3,2], [3,2],
	
	[0,14],[1,2],
	[1,2],[0,2],[1,2],[0,2],[1,2],[0,2],[1,2],[0,2],
	[2,2],[0,2],[2,2],[0,2],[2,2],[0,2],[2,2],[0,2],
	[2,2],[1,2],[2,2],[1,2],[2,2],[1,2],[2,2],[1,2],
	[3,2],[2,2],[1,2],[3,2],[2,2],[1,2],[3,2],[2,2],
	
	[1,2],[0,2],[1,2],[0,2],[1,2],[0,2],[1,2],[0,2],
	[2,2],[0,2],[2,2],[0,2],[2,2],[0,2],[2,2],[0,2],
	[1,2],[0,2],[1,2],[0,2],[1,2],[0,2],[1,2],[0,2],
	[3,2],[2,2],[2,2],[1,2],[1,2],[0,2],[0,2],[0,2],
	
	[1,2],[0,2],[1,2],[0,2],[1,2],[0,2],[1,2],[0,2],
	[2,2],[0,2],[2,2],[0,2],[2,2],[0,2],[2,2],[0,2],
	[2,2],[1,2],[2,2],[1,2],[2,2],[1,2],[2,2],[1,2],
	[3,2],[2,2],[1,2],[3,2],[2,2],[1,2],[3,2],[2,2],
	
	[1,2],[0,2],[1,2],[0,2],[1,2],[0,2],[1,2],[0,2],
	[2,2],[0,2],[2,2],[0,2],[2,2],[0,2],[2,2],[0,2],
	
	[3,1], [2,1], [1,1], [0,1],
	[3,1], [2,1], [1,1], [0,1],
	[3,1], [2,1], [1,1], [0,1],
	[3,1], [2,1], [1,1], [0,1],
	[3,1],
	
	 //outro
	[0, 16], [1, 4], [1, 4], [1, 4], 
	[1, 4], [2, 4], [1, 4], [1, 4], 
	[0, 4], [1, 4], [1, 4], [1, 4], 
	[2, 4], [2, 4], [3, 4], [3, 4], [1,4]
	
]
notes3 = [

	// chorus 1
	[0,0],[0,2], [2, 2], 
	[0,4], [3,1],[2,1], [0,1], [2,1],[0,1],[2,1],[1,1],
	[0,1], [0,2], [1, 2],  
	[0,4], [3,1],[2,1], [0,1], [1,1],[0,1],[1,1],[2,1],
	
	[0,1],[0,2], [2, 2], 
	[0,4], [3,1],[2,1], [0,1], [2,1],[0,1],[2,1],[1,1],
	[0,1], [0,2], [1, 2],  
	[0,4], [3,1],[2,1], [0,1], [1,1],[0,1],[1,1],[2,1],
	
	//verse 1
	[0,1],[3,1],[2,1],[0,1], [0,1],[0,1], [0,2],[0,1], [0,2],[0,1], [0,2],[0,1],[0,1],
	[0,1],[2,1],[1,1],[0,1], [0,1],[0,1], [0,2],[0,1], [0,2],[0,1], [0,2],[0,1],[0,1],
	
	[0,1],[3,1],[2,1],[0,1], [0,1],[0,1], [0,2],[0,1], [0,2],[0,1], [0,2],[0,1],[0,1],
	[0,1],[2,1],[1,1],[0,1], [0,1],[0,1], [0,2],[0,1], [0,2],[0,1], [0,2],[3,0.5],[2,0.5],[1,0.5],
	
	// chorus 2
	[0,1.5],[0,2], [2, 2], 
	[0,4], [3,1],[2,1], [0,1], [2,1],[0,1],[2,1],[1,1],
	[0,1], [0,2], [1, 2],  
	[0,4], [3,1],[2,1], [0,1], [1,1],[0,1],[1,1],[2,1],
	
	[0,1],[0,2], [2, 2], 
	[0,4], [3,1],[2,1], [0,1], [2,1],[0,1],[2,1],[1,1],
	[0,1], [0,2], [1, 2],  
	[0,4], [3,1],[2,1], [0,1], [1,1],[0,1],[1,1],[2,1],
	
	//verse 2
	[0,1],[3,1],[2,1],[0,1], [0,1],[0,1], [0,2],[0,1], [0,2],[0,1], [0,2],[0,1],[0,1],
	[0,1],[2,1],[1,1],[0,1], [0,1],[0,1], [0,2],[0,1], [0,2],[0,1], [0,2],[0,1],[0,1],
	
	[0,1],[3,1],[2,1],[0,1], [0,1],[0,1], [0,2],[0,1], [0,2],[0,1], [0,2],[0,1],[0,1],
	[0,1],[2,1],[1,1],[0,1], [0,1],[0,1], [0,2],[0,1], [0,2],[0,1], [0,2],[3,0.5],[2,0.5],[1,0.5],
	
	// verse 3
	[0,1.5],[3,1],[2,1],[0,1], [0,1],[0,1], [0,2],[0,1], [0,2],[0,1], [0,2],[0,1],[0,1],
	[0,1],[2,1],[1,1],[0,1], [0,1],[0,1], [0,2],[0,1], [0,2],[0,1], [0,2],[3,0.5],[2,0.5],[1,0.5],
	
	// solo
	[2,1],[3,1],[1,1],[2,1],[1,1],[0,1],[1,2],
	[0,6],[1,0.5],[2,0.5],[3,1],[1,1],[2,1],[2,1],
	[1,4],[2,1],[3,1],[2,1],[1,1],[1,1],[2,2],[3,1],[1,1],
	[0,6],[1,1],[2,1],[2,1],[2,1],[2,1],[1,1],[0,1],[1,1],[2,1],[2,1],
	[3,7],[2,1],[2,3],[1,1],[1,1],[0,1],
	
	[0,3],[1,1],[1,1],[1,1],[1,1],[2,1],[2,1],[2,1],[2,1],[3,1],[3,1],[3,1],[3,1],[2,1],[3,1],[2,1],
	[0,6],[1,1],[2,1],[2,1],[0,1],[2,1],[1,1],[0,1],
	[1,3],[0,5],[0,1.5],[1,1.5], [1,8],[1,2],[2,1],[2,1],[3,1],[2,1],[1,1],[0,1],[1,1],
	
	// tornado of souls thing
	[2,8],[1,0.5],[0,0.5], [2,1], [2,1],[1,0.5],[0,0.5], [2,1], [2,1],[1,0.5],[0,0.5],
	[3,1],[2,0.5],[1,0.5], [3,1], [3,1],[2,0.5],[1,0.5], [3,1], [3,1],[2,0.5],[1,0.5],
	
	[3,1],[1,0.5],[0,0.5], [3,1], [3,1],[1,0.5],[0,0.5], [3,1], [3,1],[1,0.5],[0,0.5],
	[3,1],[2,0.5],[1,0.5], [3,1], [3,1],[2,0.5],[1,0.5], [3,1], [3,1],[2,0.5],[1,0.5],
	
	[3,1],[2,0.5],[0,0.5], [3,1], [3,1],[2,0.5],[0,0.5], [3,1], [3,1],[2,0.5],[0,0.5],
	[3,1],[1,0.5],[0,0.5], [3,1], [3,1],[1,0.5],[0,0.5], [3,1], [3,1],[1,0.5],[0,0.5],
	
	[2,1],[1,0.5],[0,0.5], [2,1], [2,1],[1,0.5],[0,0.5], [2,1], [2,1],[1,0.5],[0,0.5],
	[1,1],[0,1],[1,1],[0,1], [2,1],[1,1],[2,1],[1,1], 
	
	[2,1],[2,7],
	[3,9],[3,7],
	
	// sweeping
	[0,8],[1,1],[3,1],[1,1],[0,1],[1,1],[2,1],[1,1],
	[0,1],[1,1],[3,1],[1,1],[0,1],[1,1],[2,1],[1,1],
	
	// alt legato
	[3,1],[3,1],[2,1],[1,1],[3,1],[2,1],[2,1],[1,1],
	[3,1],[2,1],[1,1],[1,1],[3,1],[3,1],[2,1],[2,1], [1,1], 
	
	// ending
	[0,1], [3,1], [2,1], [0,1], [2,1], [1,1], [0,1], [3,1], [2,1], [0,1], [2,1], [0,1], [1,1], [0,1], [0,1], [0,1],
	[0,1], [3,1], [2,1], [0,1], [2,1], [1,1], [0,1], [3,1], [2,1], [0,1], [2,1], [0,1], [1,1], [0,1], [0,1], [0,1],
	[0,1], [3,1], [2,1], [0,1], [2,1], [1,1], [0,1], [3,1], [2,1], [0,1], [2,1], [0,1], [1,1], [0,1], [0,1], [0,1],
	[0,1], [3,1], [2,1], [0,1], [2,1], [1,1], [0,1], [3,1]
	
	
]

if (!variable_global_exists("chapter")) { global.chapter = 1; }
if (!variable_global_exists("workout")) { global.workout = "novice leg"; }

switch(global.workout) {
	case "novice leg":
		extra = -20;
		break;
}
if global.workout == "intermediate push" { aTime -= 5; }
if global.workout == "advanced pull" { extra = 240; }
//if (global.workout == "advanced pull") { extra = 1.5 * 60; }

alarm[0] = aTime + delay  // play the wav file
alarm[1] = delay + extra;  // make the notes
alarm[2] = delay/2;  // create the picks

// variables for drawing stuff
pFinalX = 96
playerX = 480 + 96;
playerMove = false;
imgIndex = 0;
image_speed = 0;
tempImgSpd = 0;
levelUpY = -1;
levelUpAlpha = 0;
drawFatigue = global.stats.fatigue;
deadY = -1;  // draws the player fading when he's dead

switch(global.workout) {
	case "novice leg":
		song = sndRhythmLegNovice;
		break;
		
	case "intermediate push":
		song = sndRhythmPushIntermediate;
		break;
		
	case "advanced pull":
	default: 
		song = sndRhythmPullAdvanced;
		break;
}

function exitMinigame() {
	// returns to previous room and stuff

	/*gmlive*/if (TEST) { if (live_call()) return live_result; }

	instance_destroy(objNote);
	isExiting = true;
}

function finishExit() {
	// turns everything back to normal before ending the minigame

	// destroy the guitar picks
	instance_destroy(objPick);
	with (objPlayer) {
		// let the player move again
		alarm[1] = 1;
		image_alpha = 1;
	}
	with (objMusic) {
		// ensure the guitar music is finished
		if (audio_is_playing(workoutMusicBT)) { audio_stop_sound(workoutMusicBT); }
		if (audio_is_playing(workoutMusicLead)) { audio_stop_sound(workoutMusicLead); }
		
		// resume the music
		audio_resume_sound(soundID);
		audio_sound_gain(soundID, 1, 200);
	}
	// add on to message if the player leveled up
	if (levelsToAdd > 0) {
		array_push(msg, $"{global.characterName}'s muscles have grown!");
		switch (global.workout) {
			case "novice leg":
				array_push(msg, $"Legs: {global.stats.legs} -> {global.stats.legs + levelsToAdd}");
				global.stats.legs += levelsToAdd;
				if (global.stats.legs >= 30) { global.PRs[2].weight = "405 x "; }
				else if (global.stats.legs >= 20 && global.PRs[2].weight != " 405 x ") { global.PRs[2].weight = "315 x "; }
				if (reps > global.PRs[2].reps) { global.PRs[2].reps = reps; }
				break;
		}
	}
	// show message to player
	instance_create_layer(x, y, "Instances", objTextbox, {
		text: msg,
		npcID: -1
	});
	// destroy this object
	instance_destroy();
}

function incrementReps() {
	// increments rep count and potentially levels up

	/*gmlive*/if (TEST) { if (live_call()) return live_result; }

	reps++;

	if (global.workout == "novice leg") {
		if ((reps % 10 == 0 && reps != 100)) {
			// only improve legs if the player isn't sufficiently leveled already
			if (10 + (2 * (reps div 10 )) > global.stats.legs) { 
				levelsToAdd = levelUp(levelsToAdd, 2); 
				image_alpha = 0;
			}
		}
		else if (reps == 103 && global.stats.legs < 30) { 
			levelsToAdd = levelUp(levelsToAdd, 2); 
			image_alpha = 0;
		}
	}
}