// check if game controller objs exist
if (!instance_exists(objController)) { instance_create_depth(x, y, 0-10, objController) };
if (instance_exists(objCamera)) { enemies = objCamera.enemies; }
// define the players if they don't exist
if (variable_global_exists("characters")) { global.characters = ["Ben", "Deadlynn", "Quade"]; }
if (!variable_instance_exists(self, "enemies")) { enemies = ["npc", "npc"]; }

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

// use stack to monitor the cursors previous selections
cursorPrev = ds_stack_create()
function stackPush(dbArg, cursorArg, scrollArg) {
	// pushes previous cursor input onto the stack
	ds_stack_push(cursorPrev, [dbArg, cursorArg, scrollArg]);
}
function stackPop() {
	// pops previous cursor input from the stack
	return ds_stack_pop(cursorPrev);
}
function stackClear() {
	// clears the entire stack
	ds_stack_clear(cursorPrev);
	stackPush(-1, -1, -1);
}
stackPush(-1, -1, -1);

// the fighters
fighterIDs = array_create(array_length(global.characters), -1)
enemyIDs = array_create(array_length(enemies), -1);
highestSpd = [];
if (!variable_instance_exists(self, "turn")) { turn = -1; }

target = -1;
targetType = "Enemy";
wait = false;

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
	with instance_create_depth(room_width/2 - xDis, eY + i*yDis, 2-i, objEnemy) {
		fighter = other.enemies[other.i]
		other.enemyIDs[other.i] = id;
	};

}

// decide turn order
queue = []
function enqueue(fighter) {
	// adds fighter to end of queue
	var len = array_length(queue);
	queue[len] = fighter;
}
function dequeue() {
	array_shift(queue);
}
function sortQueue() {
	// sorts queue by highest speed
	for (i = 0; i < array_length(queue)-1; i++) {
		for (j = i+1; j < array_length(queue); j++) {
			var check1 = queue[i].ctr; var check2 = queue[j].ctr;
			if check1 == check2 {
				check1 = -queue[i].spd;
				check2 = -queue[j].spd;
			}
			if queue[i].ctr > queue[j].ctr {
				var temp = queue[j];
				queue[j] = queue[i];
				queue[i] = temp;
			}
		}
	}
}
function removeQueue(deadfighter) {
	// remove fighter from queue
	for (i = 0; i < array_length(queue); i++) {
		if (queue[i] = deadfighter)
			array_delete(queue, i, 1);
	}
}
// sort array by highest speed to get initial turn order
for (i = 0; i < array_length(fighterIDs); i++) {
	enqueue(fighterIDs[i].id);
}
for (i = 0; i < array_length(enemyIDs); i++) {
	enqueue(enemyIDs[i].id);
}
// finally, sort the queue and decide whose turn
sortQueue();
turn = array_first(queue);

// go to next turn after attack
function nextTurn() {
	// first check to see if all enemies/players are dead
	var dead = true;
	var vic = true;
	for (i = 0; i < array_length(fighterIDs); i++) {
		if (!fighterIDs[i].ko)
			dead = false;
	}
	for (i = 0; i < array_length(enemyIDs); i++) {
		if (!enemyIDs[i].ko)
			vic = false;
	}
	if (dead) {
		gameOverFun();
		exit;
	}
	else if (vic) {
		victoryFun();
		exit;
	}
	enqueue(turn);
	dequeue();
	sortQueue();
	alarm[0] = 1;
	turn = array_first(queue);
	// reset status ailments
	with (turn) { brace = false; }
	if (turn.isEnemy) { enemyTurn() };
}
	
// draw text box
function drawText(text, aTime = 120) {
	// displays text dashboard for battle actions
	showText = true;
	showDesc = false;
	
	self.text = text;
	alarm[0] = aTime;
}

// stop instance of the current sound and play it
function playSound(sound) {
	// plays a sound and stops it if it's already playing
	if audio_is_playing(sound) { audio_stop_sound(sound); }
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
			text = "Invalid Skill";
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

// show predicted queue and have player decide target
function initiateAction(turn, act) {
	//action = true;
	findTarget(act);
	switch (act) {
		case "Run":
			text = "Flee from battle.";
			break;
		default:
			var str = string_concat(string(target.fighter), "  ", string(target.hp), "/", string(target.maxhp) );
			text = str;
			break;
	}
	showText = true;
}

// confirm player's action
function confirmAction(turn, target, action, actionType = "Skill") {
	// confirm action: attack/skill/use item/run away
	wait = true;
	playSound(sndCursor);
	if (turn.isEnemy)
		drawText(string_concat(turn, ": ", action));
	else
		drawText(action);
	// increment items
	if (actionType == "Item") {
		 global.gymbag[cursor + scroll][1]--;
		 gymbagSort();
	}
	// have fighter perform the action
	with (turn) {
		performAction(target, action);
	}
}

// decide enemy's action
function enemyTurn() {
	wait = true;
	// get command from enemy array and increment
	var act = turn.commands[turn.cIndex];
	turn.cIndex++;
	if (turn.cIndex > array_length(turn.commands)-1) { turn.cIndex = 0; }
	// determine target for enemy attack (cannot target ko'd player)
	findTarget(act)
	var targ = target;
	drawText(act);
	with (turn) {
		performAction(targ, act, true);
	}
}
	
// game over
gameOver = false;
function gameOverFun() {
	gameOver = true;
}

// victory
victory = false;
fadeRoom = 0;
function victoryFun() {
	victory = true;
	objMusic.battleVictory();
	alarm[1] = 300;
	fadeRoom = 0;
	instance_create_layer(0, 0, "Instances", objFade, {parent: other});
}

// get counter for temp queue using getCtr from battleFunctions
tempCtr = -1;