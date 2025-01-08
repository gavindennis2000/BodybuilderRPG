/*gmlive*/if (TEST) { if (live_call()) return live_result; }

switch(prompt) {
	case "first paycheck":
		global.stats.money += 1000;
		instance_create_layer(x, y, layer, objTextbox, {
			npcID: "jim",
			text: [
				"I'm paying you in advance so you can buy supplements and equipment.",
				"Go find the Bodybuilding Nutrition Company (BBNC)  down south in Great Valliou.",
				"Good luck, kid."
			]
		});
		with (objItem) {
			if (itemID = "locked door") { instance_destroy(); }
		}
		break;
	case "bench press":
		// bench press at home
		if (selection == 0) {
			with (objPlayer) {
				canMove = false;
				alarm[2] = 1;
				global.workout = "intermediate push";
			}
		}
		break;
	case "bunny hood coupon":
		global.keyEvents.bunnyHoodCoupon = true;
		instance_create_layer(x, y, "Instances", objTextbox, {
			text: [
				$"{global.characterName} received a Bunny Hood Coupon.",
				"Go buy one at the college shop in Central Prairie Northeast."
			],
			npcID: -1
		})
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
            // meet jim ohner and get first pay check
			if (global.keyEvents.meetJim) { break; }
            global.keyEvents.meetJim = true;
			var txt = string_concat(global.characterName, " received $1000."); 
			playSound(sndLevelUp);
			instance_create_layer(x, y, "Instances", objTextbox, {
				text: [txt],
				action: "first paycheck"
			})
            break;
	case "pullups":
		// pullups with mason
		global.keyEvents.meetMason= true;
		if (selection == 0) {  // if the player selects yes
			with (objPlayer) {
				// canMove = false;
				// alarm[2] = 1;
				// global.workout = "novice pull";
				// actionRoom = rWorkout;
			}
		}
		else {
			instance_create_layer(x, y, layer, objTextbox, { 
				text: ["Maybe some other time, right?"], 
				npcID: "mason" 
			});
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
		with (objBattle) { move("escape"); }
		break;
	case "mason philosophy":
		if (selection == 0) {  // if the player selects work ethic
			instance_create_layer(x, y, layer, objTextbox, { 
				text: [
					"Work ethic is very important! But...", 
					"Don't think for a second that you're going to get huge without the love of lifting.",
					"I've achieved my size and strength because training is my passion!",
					"As far as serious lifters go I'm really quite lazy!",
					"Shoot, I could really go for a lift right now...",
					"How about we have a little pullup contest?"
				], 
				npcID: "mason",
				prompt: ["Let's do it!", "Maybe later", "pullups"]
			});
		}
		else {  // if the player selects passion
			instance_create_layer(x, y, layer, objTextbox, { 
				text: [
					"I agree whole-heartedly!", 
					"I've achieved my size and strength because training is my passion!",
					"As far as serious lifters go I'm really quite lazy!",
					"It's still important to push past our comfort zones, however. Hard work is essential.",
					"Competition with others is a great way to push yourself to the limit!",
					"How about we have a little pullup contest?"
				], 
				npcID: "mason",
				prompt: ["Let's do it!", "Maybe later", "pullups"]
			});
		}
		break;
		break;
}

instance_destroy();