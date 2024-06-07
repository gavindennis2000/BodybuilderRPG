
if (gameOver) {
	
}
else if (victory) {
	
}
else {
	
	// move the cursor
	switch (dashboard) {
		case "Menu":
			displayOptions[0] = "Attack";
			displayOptions[1] = "Skill";
			displayOptions[2] = "Gymbag";
			displayOptions[3] = "Run";
			break;
		case "Skill":
			displayOptions[0] = 
				(turn.skills[0 + scroll][1] == 0) ? 
				string(turn.skills[0 + scroll][0]) :
				string(turn.skills[0 + scroll][0]) + " " +  string(turn.skills[0 + scroll][1]);
			displayOptions[1] = 
				(turn.skills[1 + scroll][1] == 0) ? 
				string(turn.skills[1 + scroll][0]) :
				string(turn.skills[1 + scroll][0]) + " " +  string(turn.skills[1 + scroll][1]);
			displayOptions[2] = 
				(turn.skills[2 + scroll][1] == 0) ? 
				string(turn.skills[2 + scroll][0]) :
				string(turn.skills[2 + scroll][0]) + " " +  string(turn.skills[2 + scroll][1]);
			displayOptions[3] = 
				(turn.skills[3 + scroll][1] == 0) ? 
				string(turn.skills[3 + scroll][0]) :
				string(turn.skills[3 + scroll][0]) + " " +  string(turn.skills[3 + scroll][1]);
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
							maxScroll = ceil(arrayTrueLength(turn.skills)/4);
							break;
						case "Gymbag":
							playSound(sndCursor);
							dashboard = "Gymbag";
							cursor = 0;
							scroll = 0;
							maxScroll = ceil(arrayTrueLength(global.gymbag)/4);
							break;
						case "Run":
							playSound(sndCursor);
							action = displayOptions[cursor];
							initiateAction(turn, displayOptions[cursor]);
							break;
					};
					break;
				case "Skill":
					// skill dashboard
					if (displayOptions[cursor] == "") { 
						playSound(sndError);
						stackPop();
						break; 
					}
					playSound(sndCursor);
					initiateAction(turn, displayOptions[cursor]);
					break;
				case "Gymbag":
					// gymbag dashboard
					if (displayOptions[cursor] == " ") { 
						playSound(sndError);
						stackPop();
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
	} 
	else if (showText and target != -1 and cancel and !wait) {
		// cancel attacks/items/etc
			var pop = stackPop();
			playSound(sndCancel);
			showText = false;
			target = -1;
			dashboard = pop[0];
			cursor = pop[1];
			scroll = pop[2];
	} 
	else if (showText and target != -1 and confirm and !wait) {
		// confirm action: attack/skill/use item/run away
		if (dashboard == "Gymbag") { confirmAction(turn, target, global.gymbag[cursor + scroll][0], "Item"); }
		else { confirmAction(turn, target, displayOptions[cursor]); }
	}
	else if (showText and target != -1 and keyDown and !wait) {
		// move the selection down
		switch (targetType) {
			case "Ally":
				if (target == fighterIDs[0]) {
					if array_length(fighterIDs) > 1 {
						target = fighterIDs[1]; 
						playSound(sndCursor);
					}
				}
				else if (target == fighterIDs[1]) {
					if array_length(fighterIDs) > 2 {target = fighterIDs[2]; }
					else target = fighterIDs[0];
					playSound(sndCursor);
				}
				else if (target == fighterIDs[2]) {
					target = fighterIDs[0];
					playSound(sndCursor);
				}
				break;
			case "Enemy":
				if (target == enemyIDs[0]) {
					if array_length(enemyIDs) > 1 {
						target = enemyIDs[1]; 
						playSound(sndCursor);
					}
				}
				else if (target == enemyIDs[1]) {
					if array_length(enemyIDs) > 2 {target = enemyIDs[2]; }
					else target = enemyIDs[0];
					playSound(sndCursor);
				}
				else if (target == enemyIDs[2]) {
					target = enemyIDs[0];
					playSound(sndCursor);
				}
				break;
			case "Self":
				break;
			case "Party":
				break;
			case "EnemyParty":
				break;
		}
		text = (targetType != "Party" && targetType != "EnemyParty") ?  string_concat(string(target.fighter), "  ", string(target.hp), "/", string(target.maxhp) ) : text;
	} 
	else if (showText and target != -1 and keyUp and !wait) {
		// move the selection up
		switch (targetType) {
			case "Ally":
				if (target == fighterIDs[0]) {
					if array_length(fighterIDs) > 2 {
						target = fighterIDs[2]; 
						playSound(sndCursor);
					} else if array_length(fighterIDs) > 1 {
						target = fighterIDs[1]; 
						playSound(sndCursor);
					}
				} else if (target == fighterIDs[1]) { 
					target = fighterIDs[0]; 
					playSound(sndCursor);
				} else if (target == fighterIDs[2]) { 
					target = fighterIDs[1]; 
					playSound(sndCursor);
				}
				break;
			
			case "Enemy":
				if (target == enemyIDs[0]) {
					if array_length(enemyIDs) > 2 {
						target = enemyIDs[2];
						playSound(sndCursor);
					}
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
		text = (targetType != "Party" && targetType != "EnemyParty") ?  string_concat(string(target.fighter), "  ", string(target.hp), "/", string(target.maxhp) ) : text;
	}
}