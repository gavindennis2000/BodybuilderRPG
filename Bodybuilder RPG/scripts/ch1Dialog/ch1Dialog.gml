function ch1Dialog(npcID = -1, itemID = -1){
	// handles chapter 1 dialog

	/*gmlive*/ if (TEST) { if (live_call(npcID, itemID)) return live_result; }
	
	text = {
		name: npcID, 
		text: "No text available"
	};

	if (npcID != -1) {
		switch (npcID) {
			case "mom":
				if (!global.events.meetMom && !global.events.meetJim) {
					text = [
						{
							name: "mom",
							text: $"{string_upper(global.characterName)}, what is going on with you?",
							prompt: [
								"Tell her about the dream",
								[
									{
										name: "andro",
										text: "I had this dream... I think it's trying to tell me something about this new bodybuilding job."
									},
									{
										name: "mom",
										text: "Bodybuilding job!? I thought Mr. Ohner hired you to be an assistant manager!",
										emotion: "frustrated"
									},
									{
										name: "mom",
										text: "You have to take this seriously! You can't afford to get fired again because you'd rather go lift weights than show up to work!",
										emotion: "angry",
									},
								],
								"It's nothing",
								[],
							]
						},
						{
							name: "mom",
							text: "*sigh* I can't deal with this today...",
							tone: "quiet",
							emotion: "frustrated",
						},
						{
							name: "mom",
							text: "Do you know how to get to work?",
							prompt: [
								"Yes",
								[],
								"No",
								[
									{
										name: "mom",
										text: "It's is in the northwest corner of town. Don't forget to introduce yourself to your boss, Mr. Ohner.",
									}
								]
							]
						},
						{
							name: "mom",
							text: "Have a great first day, sweetie.",
							emotion: "happy",
							action: "meet mom"
						},
					]
				}
				else if (!global.events.meetJim) {
					text = [
						{
							name: "mom",
							text: $"You still haven't gone to work?"
						},
						{
							name: "mom",
							text: "Where did I go wrong with this boy...",
							emotion: "frustrated",
							tone: "quiet"
						}
					]
				}
				else {
					textIndex = 1;
					text = [
						{
							name: "mom",
							text: "Are ya winnin, son?"
						},
						{
							name: "mom",
							text: "Are you listening to me?"
						}
					]
				}
				break;
			case "jim":
				var giveDelivery = function() {
					playSound(sndLevelUp);
				}
				if (!global.events.meetJim) {
					text = [
						{
							name: "jim",
							alias: "???",
							text: $"Leave me alone! I'm busy!",
							tone: "loud",
						},
						{
							name: "jim",
							alias: "???",
							text: $"What's that... you're the new assistant manager I hired!?",
						},
						{
							name: "jim",
							alias: "???",
							text: "You're late! Now... What's your name again?",
							emotion: "angry"
						},
						{
							name: "jim",
							alias: "???",
							text: global.characterName != "jim" ? $"{string_upper(global.characterName)}!?" : "JIM!?",
							emotion: "cocky",
							tone: "loud"
						},
						{
							name: "jim",
							alias: "???",
							text: global.characterName != "jim" ? "WHAT KIND OF NAME IS THAT!?" : "YOU'VE GOTTA BE KIDDING ME!!",
							emotion: "cocky",
							tone: "loud"

						},
						{
							name: "jim",
							text: global.characterName != "jim" ? $"The name's Jim Ohner, by the way. You can just call me Jim." : "That's my name! From now on I'm going to address you as STRING BEAN so there's no confusion.",
							emotion: "happy"
						},
						{
							name: "jim",
							text: "I'm the proud owner of Pump Palace Bodybuilding Gyms. I only let the strongest, most dedicated lifters hang around here.",
						},
						{
							name: "jim",
							text: "Don't get the wrong idea though, I only hired you because your friend put in a good word.",
							emotion: "cocky"
						},
						{
							name: "jim",
							text: $"You're all skin and bones! If you want to stick around here, you're gonna need to put on some serious mass!",
							emotion: "cocky"
						},
						{
							name: "jim",
							text: $"Say, what made you want a job here anyway?",
							prompt: [
								"I want to be a bodybuilder", 
								[
									{
										name: "jim",
										text: $"Bwahaha! You think you have what it takes!?",
										emotion: "cocky"
									},
									{
										name: "jim",
										text: $"Becoming a bodybuilder takes a lot more than just pumping iron, ya know.",
									},
									{
										name: "jim",
										text: "But still, you might have some potential... I can sense a powerful aura coming from you..."
									},
									{
										name: "jim",
										text: "Actually, no. It's just your  B.O."
									}
								],
								"I'm in it for the bag",
								[
									{
										name: "jim",
										text: $"Ha! I like the way you think, kid.",
										emotion: "happy"
									},
									{
										name: "jim",
										text: "But don't think I'll forget about what I said earlier. You still need to start slamming the mass gainer!",
									},
								]
							]
						},
						{
							name: "jim",
							text: "Take this delivery to my business associate at Bodybuilding Nutrition Company (BBNC).",
						},
						{
							text: $"JIM handed {global.characterName == "jim" ? "STRING BEAN" : string_upper(global.characterName)} the goods.",
							action: giveDelivery
						},
						{
							name: "jim",
							text: "You'll find BBNC in Wheyford, two blocks south of here."
						},
						{
							name: "jim",
							text: "I'm busy running a business. If you need help, try talking to some of the lifters around the gym.",
							action: "meet jim"
						}
					]
				}
				else {
					text = [
						{
							name: "jim",
							text: "You'll find BBNC in Wheyford, two blocks south of here."
						},
						{
							name: "jim",
							text: "I'm busy running a business. If you need help, try talking to some of the lifters around the gym.",
						}
					]
				}
				break;
			default:
				text = {
					text: $"{npcID}"
				};
				break;
		}
	}
	else if (itemID != -1) {
		switch (itemID) {
			case "bbnc owner":
				var func = function() {
					global.events.bbncTalkToOwner = true;
				}
				var kickedOut = function() {
					// kicks player out of his store
					global.roomChange = {
						x: 1248, 
						y: 1056 + 32, 
						face: "down", 
						room: rOverworld, 
						transition: "fade"
					}
					with (objPlayer)
						canMove = false;
					with (objController)
						goToNextRoom();
					playSound(sndError);
				}
				if (global.events.bbnc2 && !global.events.bbncTalkToOwner) {

					// npc creation and functions
					var createAna = function() {
						instance_create_layer(objPlayer.x, objPlayer.y, "Instances", objNPC, {
							npcID: "ana", 
							directions: ["right"], 
							action: function() {
								with (objNPC) {
									if (npcID == "ana") {
										faceStart = "left";
										face = "left";
									}
								}
							}
						});
					}

					var exitAna = function() {
						with (objNPC) {
							if (npcID == "ana") {
								directions = ["left"]; 
								action = function() {
									global.events.bbncTalkToOwner = true;
									with (objPlayer)
										canMove = true;
									instance_destroy();
								}
								alarm_set(1, 1);
							}
						}
					}
					text = [
						{
							name: "clerk",
							text: "You saved me! Thank you so much!"
						},
						{
							name: "clerk",
							text: "You have a package delivery for me? This day has really turned around! Weehee!"
						},
						{
							name: "clerk",
							text: "I see you have quite the muscles on you, boy. Please come back any time to get my top-shelf supplements!"
						},
						{
							name: "clerk",
							text: "As for the package, I'll use Western Onion to remotely pay Jim. I promise. You definitely don't need to tell him.",
						},
						{
							name: "ana",
							text: $"{string_upper(global.characterName)}!",
							action: createAna
						},
						{
							name: "ana",
							text:  "Let's get back to Pump Palace so we can tell Jim what happened!",
							action: exitAna
						}
					]
				}
				else {
					text = [
						{
							name: "Clerk",
							text: $"Welcome to BBNC! Home to all your hypertrophy needs!"
						},
						{
							name: "Clerk",
							text: $"Are you looking to buy some supplements?",
							prompt: [
								"Yes",
								[],
								"No",
								[
									{
										name: "clerk",
										text: "Did you read the sign, meat wipe?"
									},
									{
										name: "clerk",
										text: "NO SOLICITING! GET OUT!",
										tone: "loud",
										action: kickedOut
									}
							]
							]
						}
					];
				}
				break;
			case "gymtendo 64":
				text = [
					{
						text: "My Gymtendo 64!"
					},
					{
						text: "I wonder if Ocarina of Gains still works..."
					}
				];
				break;
			case "home bed":
				if (!global.events.meetJim)
					text = $"I have to get ready for work!";
				break;
			case "home bench press":
				text = [
					{
						text: "Bench press. My favorite lift!"
					}, 
					{
						text: "If I'm quick, I can knock out a few sets before work..."
					},
					{
						name: "mom",
						text: $"{string_upper(global.characterName)}!!"
					}, 
					{
						text: "Never mind. Maybe tonight."
					}
				]
				break;
			case "mirror":
				switch (global.character) {
					case "andro":
						text = "Hey, big guy! Lookin large!";
						break;
					case "ana":
						text = "I can't believe the game developer made my arms so small!";
						break;
					case "doms":
						text = "My calves need some work. Very happy with the progress my lats have made, though.";
						break;
					case "samson":
						text = "I'm ashamed of myself. Can't believe I skipped cardio today!";
						break;
				}
				break;
			default:
				text = {
					text: $"{itemID}"
				};
				break;
		}	
	}
	else {
		debug("No dialog found");
		return (-1);
	}

	return;
}