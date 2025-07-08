function ch1Dialog(npcID = -1){
	// handles chapter 1 dialog

	/*gmlive*/ if (TEST) { if (live_call(npcID)) return live_result; }
	
	text = {
		name: npcID, 
		text: "No text available"
	};

	if (npcID == -1)
		return;

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
			// jim ohner
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
			else if (!global.events.bbncTalkToOwner) {
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
			else if (!global.events.firstPay) {
				text = [
					{
						name: "jim",
						text: "Hey! Great work on the delivery. Do you have my money?"
					},
					{
						name: "jim",
						text: "Western Onion? What the #$%# is that!?",
						tone: "loud",
					},
					{
						name: "jim",
						text: "I'm going to pound that cheapsteak into a pulp! Anyways, here's your cut."
					},
					{
						text: $"JIM paid {string_upper(global.characterName)} $1000.",
						action: function() {
							playSound(sndLevelUp);
						}
					},
					{
						name: "jim",
						text: "I threw in some extra cash so you can buy supplements and training equipment. Your next task is to get SWOLE."
					},
					{
						name: "jim",
						text: "Go train at Wheyford Barbell down south. Those guys are old school and will definitely toughen you up!"
					},
					{
						name: "jim",
						text: "They look pretty mean, but I promise, they aren't the least bit hostile."
					},
					{
						name: "jim",
						text: "But if you're worried about getting picked on for being a wussy, stop at the martial arts dojo on your way there."
					},
					{
						name: "jim",
						text: "It's called something stupid like \"Krav Magains\" or \"Massed Martial Arts\". I can't remember.",
						action: function() {
							global.events.firstPay = true;
							debug("first paycheck", -1);
						}
					}
				];
			}
			else {
				text = [
					{
						name: "jim",
						text: "Go train at Wheyford Barbell down south. Those guys are old school and will definitely toughen you up!"
					},
					{
						name: "jim",
						text: "They look pretty mean, but I promise, they aren't the least bit hostile."
					},
					{
						name: "jim",
						text: "But if you're worried about getting picked on for being a wussy, stop at the martial arts dojo on your way there."
					},
					{
						name: "jim",
						text: "It's called something stupid like \"Krav Magains\" or \"Massed Martial Arts\". I can't remember.",
					}
				]
			}
			break;
		case "noob 1":
			textIndex = 2;
			text = [
				{
					name: "noob lifter", 
					text: "This gym is so confusing! It's like a giant maze!"
				},
				{
					name: "noob lifter",
					text: "I heard the owner of this place is some eccentric bodybuilder. His name's Ronnie or Donnie or something.",
				},
				{
					name: "noob lifter",
					text: "Hey, can you keep a secret?",
					prompt: [
						"Let's hear it", 
						[{
							name: "noob lifter",
							text: "I heard this owner guy is part of a CREATINE trafficking circle."
						},
						{
							name: "noob lifter", 
							text: "You know, that special supplement that gives you superhuman muscles?"
						},
						{
							name: "noob lifter", 
							text: "Alot of the gym owners around here have recently doubled in size and strength. It's a little suspicious...",
						},
						{
							name: "noob lifter",
							text: "I heard it can make you go crazy and violent, too. I'd stay away from this CREATINE stuff if I were you."
						}],
						"What do I look like a teenage girl?", 
						[{
							name: "noob lifter",
							text: "People in this town are so rude! I wish I could go back home to Leangroundburg!"
						}],
					]
				}
			]
			break;
		case "smol powerlifter 1":
			text = [
				{
					name: "smol powerlifter",
					text: "Hey! This is a powerlifting gym. Keep your disgusting bodybuilder face out of here."
				},
				{
					name: "smol powerlifter",
					text: "Not listening to me? Guess I'll have to teach you a lesson!",
					action: function() {
						array_push(global.enemiesToDestroy, "smol powerlifter 1");
						startBattle(true, ["smol powerlifter"]);
					}
				}
			]
			break;
		case "thicc powerlifter 1":
			text = [
				{
					name: "thicc powerlifter", 
					text: "Those are some sweet biceps, bro!"
				}, 
				{
					name: "thicc powerlifter", 
					text: "Too bad biceps are all for show! They serve no function in the real world."
				}, 
				{
					name: "thicc powerlifter", 
					text: "Real MEN like me train their muscles for functional purposes.",
					prompt: [
						"Like what?", 
						[], 
						"I didn't ask",
						[],
					]
				},
				{
					name: "thicc powerlifter", 
					text: "Functional, MANLY activities. Like..."
				},
				{
					name: "thicc powerlifter", 
					text: "Like.... umm."
				},
				{
					name: "thicc powerlifter", 
					text: "..."
				},
				{
					name: "thicc powerlifter",
					text: "*thinking profusely*"
				},
				{
					name: "thicc powerlifter",
					text: "*thinking and sweating profusely*"
				},
				{
					name: "thicc powerlifter",
					text: "You've really put me in a bad mood! I'll show you what these MANLY powerlifting muscles can do!",
					tone: "loud",
					action: function() {
						array_push(global.enemiesToDestroy, "thicc powerlifter 1");
						startBattle(true, ["thicc powerlifter"]);
					}
				},
			]
			break;
		case "thicc powerlifter 2":
		case "smol powerlifter 2":
			// these guys talk together
			text = [
				{
					name: "thicc powerlifter (pal)",
					text: "Hey, BUD?",
					action: function() {
						with (objNPC)
							if (npcID == "thicc powerlifter 2")
								face = "left";
					}
				},
				{
					name: "smol powerlifter (bud)",
					text: "Yes, PAL?",
					action: function() {
						with (objNPC)
							if (npcID == "smol powerlifter 2")
								face = "right";
					}
				},
				{
					name: "pal",
					text: "I think this BARBARIAN is trying to get to the boss...",
					action: function() {
						with (objNPC)
							if (npcID == "thicc powerlifter 2")
								face = "up";
					}
				},
				{
					name: "bud",
					text: "Oooh! We certainly can't let that happen!",
					action: function() {
						with (objNPC)
							if (npcID == "smol powerlifter 2")
								face = "up";
					}
				},
				{
					name: "bud",
					text: "But wait... It's against the rules for us to fight him at the same time. What ever will we do?",
					action: function() {
						with (objNPC)
							if (npcID == "smol powerlifter 2")
								face = "right";
					}
				},
				{
					name: "pal",
					text: "Are you kidding? We're powerlifters! Our whole sport revolves around bending arbitrary rules! *smug laugh*",
					action: function() {
						with (objNPC)
							if (npcID == "thicc powerlifter 2")
								face = "left";
					}
				},
				{
					name: "bud",
					text: "Indeed! *agrees in smug laugh*",
					action: function() {
						array_push(global.enemiesToDestroy, "thicc powerlifter 2", "smol powerlifter 2");
						startBattle(true, ["thicc powerlifter", "smol powerlifter"]);
					}
				},
			]
			break;
		case "super heavyweight 1":
			text = [
				{
					name: "super heavyweight",
					text: "What're ya doin here, squirt?"
				},
				{
					name: "super heavyweight",
					text: "This here's a powerliffin gym. We don't like you bodybuildin folk on our turf."
				},
				{
					name: "super heavyweight",
					text: "That's funny. Ushually my lil bro bean woulda taken care'a you in the last room...",
				},
				{
					name: "super heavyweight",
					text: "..."
				},
				{
					name: "super heavyweight",
					text: "Wait a got dang minute...",
					tone: "quiet"
				},
				{
					name: "super heavyweight",
					text: "LITTLE BRO BEAN!!",
					tone: "loud"
				},
				{
					name: "",
					text: "*crickets chirping in the background* (little bro bean didn't answer his brother's call).",
					tone: "quiet"
				},
				{
					name: "super heavyweight",
					text: "How dare you beat up on my little bro bean! I'll teach you to pick on someone your own size!",
					tone: "loud",
					action: function() {
						array_push(global.enemiesToDestroy, "super heavyweight 1");
						startBattle(true, ["super heavyweight"]);
					}
				}
			]
			break;
		default:
			text = {
				text: $"{npcID}"
			};
			break;
	}

	return;
}