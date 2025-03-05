/*gmlive*/if (TEST) { if (live_call()) return live_result; }

var txt = "";

textbox = function(txt) {
	instance_create_layer(x, y, layer, objTextbox, { text: txt });
}

switch(prompt) {
	case "ask about strength stones":
		if (selection == 0) {
			// strength stones
			txt = [
				"The Strength Stones are bestowed to the individuals with the most impressive muscles groups.",
				"They are held by the three bodybuilding titans of the land.",
				"One possesses the most proud of chests...",
				"Another a mountainous tortilla chip shaped back...",
				"And the last a succulent pair of thighs.",
				"In my old age I doubt I could even challenge these titans.",
				"But I won't feel fulfilled unless I try my absolute hardest!"
			];
		}
		else {
			// power polygon
			txt = [
				"Legend says that the one who possesses all three of the Strength Stones can achieve ultimate mass.",
				"The three stones combine to form the Power Polygon! A beautiful relic indeed.",
				"But this will only happen if the person is deemed worthy by the God of Gains.",
				"A young lifter from Dairygold named Sulik had greater muscles than all the Stone bearers",
				"But the Power Polygon deemed him unworthy due to his lack of heart.",
				"Or maybe he was using steroids... I don't remember.",
				"I'm just a crazy old man, I might be making all this stuff up."

			];
		}
		textbox(txt);
		break;
	case "ask about strongman":
		// get the right text based on the selection
		txt = [""];
		if (selection == 0) {
			txt = [
				"Strongmen are these huge people that make even `bodybuilders look tiny.",
				"You would need crazy grip strength to even lift that stone, let alone move it around.",
				"If you got into a fight with one, I would run away before you get hurt."
			];
		}
		else {
			txt = [
				"Highland is a rural community to the east of Central Prairie.",
				"Their religious beliefs prohibit technology, so they spend most of their days lifting and praying."
			];
		}
		// create the textbox
		instance_create_layer(x, y, layer, objTextbox, {
			npcID: "young woman",
			text: txt
		});
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
		});
		break;
	case "cardio":
		// play games on the treadmill
		if (selection == 0) {
			with (objPlayer) {
				canMove = false;
				alarm[2] = 1;
				global.workout = "cardio";
			}
		}
		break;
	case "db bench":
		// hit some dumbbell bench
		if (selection == 0) {
			with (objPlayer) {
				canMove = false;
				alarm[2] = 1;
				global.workout = "intermediate push";
			}
		}
		else if (selection == 1) { instance_destroy(); }
		break;
	case "escape battle":
		with (objBattle) { move("escape"); }
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
	case "game over":
		if (selection == 0) {
			// try again
			// reset the fatigue and ultimate stats
			global.stats.fatigue = 0;
			global.stats.ultimate = 0;
			// set the return room to mom's house if dying at the overworld
			if (global.returnRoom == rOverworld) { global.returnRoom = rMom; }
			// return to the previous room
			room_goto(global.returnRoom);
		}
		else if (selection == 1) {
			// exit to main menu
			game_end();
		}
		break;
	case "learn brace":
		playSound(sndLevelUp);
		global.skills[1].unlocked = true;
		txt = $"{global.characterName} learned the skill \"Brace\".";
		instance_create_layer(x, y, "Instances", objTextbox, {
			npcID: -1,
			text: [txt],
			action: "learn brace 2"
		})
		break;
	case "learn brace 2":
		txt = [
			"Bracing your core is incredibly important for safe squatting.",
			"It will also reduce an opponent's attack damage by 75% for one turn during battle.",
			"I recommend saving it for powerful attacks. Hope it helps!"
		];
		instance_create_layer(x, y, "Instances", objTextbox, {
			npcID: "GYM RAT",
			text: txt,
		})
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
					"I agree wholeheartedly!", 
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
	case "meet jim":
		// meet jim ohner and get first pay check
		if (global.keyEvents.meetJim) { break; }
		global.keyEvents.meetJim = true;
		txt = string_concat(global.characterName, " received $1000."); 
		playSound(sndLevelUp);
		instance_create_layer(x, y, "Instances", objTextbox, {
			text: [txt],
			action: "first paycheck"
		})
		break;
	case "move the atlas stone":
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
			global.keyEvents.atlasStone = true;
			instance_create_layer(x, y, layer, objTextbox, { text: ["Wow! Unlimited grip strength!"] });
		}
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
	case "squat":
		// hit some squats
		if (selection == 0) {
			with (objPlayer) {
				canMove = false;
				global.workout = "novice leg";
				alarm[2] = 1;
			}
		}
		break;
	case "squat help":
		var action = -1;
		if (selection == 0) {
			txt = [
				"Squatting is sort of like a rhythm game.",
				"You need to carefully time when you bounce out of the hole and take advantage of the stretch reflex.",
				"If you can't figure it out, try to find another way to build up your legs.",
				"The sensei at the Great Valliou Dojo is pretty stacked, so maybe combat would be a good option.",
				"The BBNC shop in that area should sell some knee sleeves too.",
				"They're a bit pricey, but should buff up your leg power!"
			];
		}
		else {
			txt = [
				"Right on! I admire your confidence.",
				"Squats are harder than they look. If you decide you need some help, I'll be right here."
			];
		}
		if (!global.skills[1].unlocked) {
			array_push(txt, "Hey... I almost forgot.", );
			action = "learn brace";
		}
		instance_create_layer(x, y, "Instances", objTextbox, {
			text: txt,
			npcID: "gym rat",
			action: action
		})
		break;
	}

instance_destroy();