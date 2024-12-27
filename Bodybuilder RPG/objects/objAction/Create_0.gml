switch(prompt) {
	
	case "bench press":
		// bench press at home
		if (selection == 0) {
			with (objPlayer) {
				canMove = false;
				alarm[2] = 1;
				global.workout = "intermediate push";
				actionRoom = rWorkout;
			}
		}
		break;
	case "db bench":
		// hit some dumbbell bench
		if (selection == 0) {
			with (objPlayer) {
				canMove = false;
				alarm[2] = 1;
				/*temporary*/action = "db bench";
			}
		}
		else if (selection == 1) { instance_destroy(); }
		break;
	case "squat":
		// hit some squats
		if (selection == 0) {
			with (objPlayer) {
				canMove = false;
				action = "squat";
				alarm[2] = 1;
				global.workout = "novice leg";
				global.playerX = objPlayer.x;
				global.playerY = objPlayer.y;
				global.returnRoom = room;
			}
		}
		break;
	case "atlas stone":
		// move the atlas stone
		if (selection == 0) {
			with (objPlayer) { canMove = false; face = "left"; }
			with (objItem) { 
				if (itemID == "atlas stone") {
					y = objPlayer. y - 32;
					hspeed = -10;
					gravity = 0.2;
				}
			}
			global.keyEvents[1][1] = true;
			instance_create_layer(x, y, layer, objTextbox, { text: ["Wow! Unlimited grip strength!"] });
		}
		break;
	case "finish chapter":
		// finish chapter
		if (selection == 0) {
			global.chapter++;
			save_game();
			with (objPlayer) {
				canMove = false;
				alarm[3] = 1;
			}
		}
		break;
    case "meet jim":
            // meet jim ohner
			if (global.keyEvents.meetJim) { break; }
            global.keyEvents.meetJim = true;
            break;
	case "meet mason":
		// pullups with mason
		global.keyEvents.meetMason= true;
		if (selection == 0) {  // if the player selects yes
			with (objPlayer) {
				canMove = false;
				alarm[2] = 1;
				global.workout = "novice pull";
				actionRoom = rWorkout;
			}
		}
		else {
			instance_create_layer(x, y, layer, objTextbox, { text: ["Maybe some other time, right?"], npcID: "MASON" });
		}
		break;
	case "exit sulik":
		// after you talk to sulik, he walks away and no encounters is turned off
		with (objNPC) {
			if (npcID == "sulik") {
				alarm[2] = 30;
			}
		}
		global.noEncounters = false;
		break;
	case "escape battle":
		debug("escaped battle");
		with (objBattle) { move("escape"); }
		break;
}

instance_destroy();