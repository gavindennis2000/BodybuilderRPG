// move the cursor
switch (dashboard) {
	case "Menu":
		displayOptions[0] = "Attack";
		displayOptions[1] = "Skill";
		displayOptions[2] = "Gymbag";
		displayOptions[3] = "Run";
		break;
	case "Skill":
		displayOptions[0] = turn.skills[0 + scroll];
		displayOptions[1] = turn.skills[1 + scroll];
		displayOptions[2] = turn.skills[2 + scroll];
		displayOptions[3] = turn.skills[3 + scroll];
		break;
	case "Gymbag":
		displayOptions[0] = string(global.gymbag[0 + scroll][0]) + " " +  string(global.gymbag[0 + scroll][1]);
		displayOptions[1] = string(global.gymbag[1 + scroll][0]) + " " +  string(global.gymbag[1 + scroll][1]);
		displayOptions[2] = string(global.gymbag[2 + scroll][0]) + " " +  string(global.gymbag[2 + scroll][1]);
		displayOptions[3] = string(global.gymbag[3 + scroll][0]) + " " +  string(global.gymbag[3 + scroll][1]);
		break;
	default:
		break;
}

var keyDown = input_check_pressed("down");
var keyUp = input_check_pressed("up");
var keyLeft = input_check_pressed("left");
var keyRight = input_check_pressed("right");

var confirm = input_check_pressed("confirm");
var cancel = input_check_pressed("cancel");

if (battleStart and !showText) {
	// cursor movement
	
	if (keyDown) {
		if (cursor < 2) {
			cursor += 2;
			playSound(sndCursor);
		} else if (dashboard != "Menu") {
			if (scroll+2 <= maxScroll) { 
				scroll += 2;
				playSound(sndCursor);
			}
		}
	}
	else if (keyUp) {
		if (cursor > 1) { 
			cursor -= 2; 
			playSound(sndCursor);
		} else if (dashboard != "Menu" && scroll > 0) {
			scroll -= 2;
			playSound(sndCursor);
		}
	}
	else if (keyLeft) {
		if cursor%2 == 1 { 
			cursor--; 
			playSound(sndCursor);
		}
	}
	else if (keyRight) {
		if cursor%2 == 0 { 
			cursor++; 
			playSound(sndCursor);
		}
	}
	
	// cancel and confirm
	if (confirm) {
		stackPush(dashboard, cursor, scroll)
		switch (dashboard) {
			case "Menu":
			// menu dashboard
				switch(displayOptions[cursor]) {
					case "Attack":
						playSound(sndCursor);
						initiateAction(turn, displayOptions[cursor]);
						break;
					case "Skill":
						playSound(sndCursor);
						dashboard = "Skill";
						cursor = 0;
						scroll = 0;
						maxScroll = arrayTrueLength(turn.skills);
						break;
					case "Gymbag":
						playSound(sndCursor);
						dashboard = "Gymbag";
						cursor = 0;
						scroll = 0;
						maxScroll = arrayTrueLength(global.gymbag, "gymbag");
						break;
					case "Run":
						playSound(sndCursor);
						initiateAction(turn, displayOptions[cursor]);
						break;
				};
				break;
			case "Skill":
				// skill dashboard
				if (displayOptions[cursor] == "") { 
					playSound(sndError);
					break; 
				}
				playSound(sndCursor);
				initiateAction(turn, displayOptions[cursor]);
				break;
			case "Gymbag":
				// gymbag dashboard
				if (displayOptions[cursor] == " ") { 
					playSound(sndError);
					break; 
				}
				playSound(sndCursor);
				initiateAction(turn, global.gymbag[cursor + scroll][0]);
				break;
		}
	}
	if (cancel) {
		switch(dashboard) {
			case "Menu":
				playSound(sndError);
				break;
			default:
				var pop = stackPop();
				playSound(sndCancel);
				dashboard = pop[0];
				cursor = pop[1];
				scroll = pop[2];
				break;
		}
	}
} else if (showText and target != -1 and cancel) {
	// cancel attacks/items/etc
		var pop = stackPop();
		playSound(sndCancel);
		showText = false;
		target = -1;
		dashboard = pop[0];
		cursor = pop[1];
		scroll = pop[2];
} else if (showText and target != -1 and keyDown) {
	// move the selection down
	switch (targetType) {
		case "Ally":
			if (target == fighterIDs[0]) {
				if array_length(fighterIDs) > 1 {target = fighterIDs[1]; }
			}
			else if (target == fighterIDs[1]) {
				if array_length(fighterIDs) > 2 {target = fighterIDs[2]; }
				else target = fighterIDs[0];
			}
			else if (target == fighterIDs[2]) {
				target = fighterIDs[0];
			}
			break;
		case "Enemy":
			if (target == enemyIDs[0]) {
				if array_length(enemyIDs) > 1 {target = enemyIDs[1]; }
			}
			else if (target == enemyIDs[1]) {
				if array_length(enemyIDs) > 2 {target = enemyIDs[2]; }
				else target = enemyIDs[0];
			}
			else if (target == enemyIDs[2]) {
				target = enemyIDs[0];
			}
			break;
		case "Self":
			break;
		case "Party":
			break;
		case "EnemyParty":
			break;
	}
	text = (targetType != "Party" && targetType != "EnemyParty") ? string(target.fighter) : text;
} else if (showText and target != -1 and keyUp) {
	// move the selection up
	switch (targetType) {
		case "Ally":
			if (target == fighterIDs[0]) {
				if array_length(fighterIDs) > 2 {target = fighterIDs[2]; }
				else if array_length(fighterIDs) > 1 {target = fighterIDs[1]; }
			}
			else if (target == fighterIDs[1]) { target = fighterIDs[0]; }
			else if (target == fighterIDs[2]) { target = fighterIDs[1]; }
			break;
			
		case "Enemy":
			if (target == enemyIDs[0]) {
				if array_length(enemyIDs) > 2 {target = enemyIDs[2]; }
				else if array_length(enemyIDs) > 1 {target = enemyIDs[1]; }
			}
			else if (target == enemyIDs[1]) { target = enemyIDs[0]; }
			else if (target == enemyIDs[2]) { target = enemyIDs[2]; }
			break;
			
		// can't change selection for self, party, or enemyparty
		case "Self":
			break;
		case "Party":
			break;
		case "EnemyParty":
			break;
	}
	text = (targetType != "Party" && targetType != "EnemyParty") ? string(target.fighter) : text;
}