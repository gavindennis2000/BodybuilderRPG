// check if game controller objs exist
if (!instance_exists(objController)) { instance_create_depth(x, y, 0-10, objController) };

// define the players if they don't exist
if (variable_global_exists("characters")) { global.characters = ["Ben", "Deadlynn", "Quade"]; }
if (!variable_instance_exists(self, "enemies")) { enemies = ["npc"]; }

//declare variables and stuff
battleStart = false;
char = array_length(global.characters);
showText = false;
showDesc = false;
text = "";
draw_set_font(fntTextBox);
// dashboard stuff
dashboard = "Menu";  // attack, skill, item, run
cY = c_yellow;
cW = c_white;
c = array_create(100, c_white);
displayOptions = ["Attack", "Skill", "Gymbag", "Run", -1];
cursor = 0;
cursorX = -1;
cursorY = -1;
scroll = 0;
maxScroll = 20;
cantRun = false;
// monitor the cursors previous selections
cursorPrev = ds_stack_create()
function stackPush(dbArg, cursorArg, scrollArg) {
	// pushes previous cursor input onto the stack
	ds_stack_push(cursorPrev, [dbArg, cursorArg, scrollArg]);
}
function stackPop() {
	// pops previous cursor input from the stack
	return ds_stack_pop(cursorPrev);
}
stackPush(-1, -1, -1);

// the fighters
fighterIDs = array_create(array_length(global.characters), -1)
enemyIDs = array_create(array_length(enemies), -1);
highestSpd = [-1, -1];
turn = -1;

target = -1;
targetType = "Enemy";

// how far apart each fighter and enemy are
	var xDis = 128;
	var yDis = 36;
	
// create the fighters
for (i = 0; i < char; i++) {
	// determine the y position of Ben
	benY = room_width/2;
	switch(char) {
		case 1:
			benY = room_height/2;
			break;
		case 2:
			benY = room_height/2 - yDis/2;
			break;
		case 3:
			benY = room_height/2 - yDis;
			break;
	}
	// create the fighter instance
	with instance_create_depth(room_width/2 + xDis + 10*i, benY + i*yDis, 2-i, objFighter) {
		fighter = global.characters[other.i];
		fighterID = other.i
		other.fighterIDs[other.i] = id;
	};
}

// create the enemies
var eCount = array_length(enemies);
for (i = 0; i < eCount; i++) {
	// determine the y position of the first enemy
	var eY = room_height/2 - ( yDis/2 * (eCount-1) );
	// create the fighter instance
	with instance_create_depth(room_width/2 - xDis, eY + i*yDis, 0, objEnemy) {
		fighter = other.enemies[other.i]
		other.enemyIDs[other.i] = id;
	};

}

// decide who gets the first turn
for (i = 0; i < array_length(fighterIDs); i++) {
	if (fighterIDs[i].spd > highestSpd[1]) { highestSpd = [fighterIDs[i], fighterIDs[i].spd]; }
}
for (i = 0; i < array_length(enemyIDs); i++) {
	if (enemyIDs[i].spd > highestSpd[1]) { highestSpd = [enemyIDs[i], enemyIDs[i].spd]; }	
}
turn = highestSpd[0];

function drawText(text) {
	showText = true;
	showDesc = false;
	
	
	
	
	self.text = text;
	alarm[0] = 120;
}

function playSound(sound) {
	if audio_is_paused(sound) { audio_stop_sound(sound); }
	audio_play_sound(sound, 1, false);
}

// draw skill description
function drawSkillDescription(skill) {
	// shows description of skill when highlighted
	showDesc = true;
	switch (skill) {
		case "Brace":
			text = "Forfeit attack and prepare for enemy assault.";
			break;
		case "":
			showDesc = false;
			break;
		default:
			text = "Unknown Skill";
			break;
	}
}

// draw gymbag description
function drawGymbagDescription(item) {
	// shows description of skill when highlighted
	showDesc = true;
	switch (item) {
		case "Hydro20":
			text = "Replenish 50HP.";
			break;
		case "":
			showDesc = false;
			break;
		default:
			text = "Unknown Item";
			break;
	}
}

function initiateAction(turn, act) {
	//action = true;
	findTarget(act);
	showText = true;
	switch (act) {
		case "Run":
			text = "Flee from battle.";
			break;
		default:
			text = string(target.fighter)
			break;
	}
}

