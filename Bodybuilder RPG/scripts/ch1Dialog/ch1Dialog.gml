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
		case "donnie swoleman":
			text = [
				{
					name: "donnie swoleman", 
					text: "YEAHHHHHHHHH BABY!!!!!",
					tone: "loud",
					preAction: function() {
						// set up a cutscene
						global.cutscene = true;
						global.cutsceneSong = sndDanger;
						audio_sound_gain(global.songPlaying, 0, 1000);
						with (objMusic)
							alarm_set(0, 60);
						
						var dir;
						switch (oPlayer.face) {
							case "up":
								dir = "right";
								break;
							case "down":
								dir = "left";
								break;
							case "left":
								dir = "up";
								break;
							case "right":
								dir = "down";
								break;
						}
						instance_create_layer(oPlayer.x, oPlayer.y, "Instances", objNPC, {
							npcID: "ana", 
							directions: [dir],
							action: function() {
								with (objNPC)
									if (npcID == "ana") {
										faceStart = objPlayer.face;
										face = faceStart;
									}
							}
						});
					}
				},
				{
					name: "donnie swoleman", 
					text: "I SEE PUMP PALACE IS TRYING TO FUNCTION `ON MY TURF!!!",  
					tone: "loud"
				},
				{
					name: "donnie swoleman", 
					text: "YOU BETTER WALK ON HOME BOY!!!!",
					tone: "loud",
				},
				{
					name: "donnie swoleman", 
					text: "OR I'LL MAKE YOUR MUSCLES SORER THAN `THEY'VE EVER BEEN!!!",  
					tone: "loud",
					prompt: [
						"Who are you?", 
						[
							{
								name: "donnie swoleman", 
								text: "I'M DONNIE MOTHERFREAKIN' SWOLEMAN!! `8-TIME MR. POWERLIFTER CHAMPION!!",  
								tone: "loud",
							}, 
						],
						"What are you talking about?",
						[
							{
								name: "donnie swoleman", 
								text: "PLAY DUMB ALL YOU LIKE!! YOU CAN'T HIDE THE TRUTH FROM ME!!",  
								tone: "loud",
							}, 
						],
					]
				},
				{
					name: "donnie swoleman",
					text: "I KNOW JIM WAS DELIVERING CREATINE `TO BBNC. HE KNOWS IT'S MY TERRITORY!!",
					tone: "loud",
				},
				{
					name: "donnie swoleman", 
					text: "NOW HIS DELIVERY BOY IS GONNA PAY THE `PRICE!!",
					tone: "loud",
				},
				{
					name: "ana", 
					text: "Hold on a sec! We were just delivering Prairie Protein (TM)! This is all a big misunderstanding!"
				},
				{
					name: "donnie swoleman", 
					text: "I KNOW SOMETHING'S UP!! MY PAY DAY THIS `WEEK WAS NOTHIN BUT A WALNUT!!!",
					tone: "loud"
				},
				{
					name: "donnie swoleman", 
					text: "I'LL TELL YOU WHAT... I'LL SPARE YOUR LIVES. ON ONE CONDITION...",
					tone: "loud"
				},
				{
					name: "donnie swoleman", 
					text: "YOU WORK FOR ME NOW!!!",
					tone: "loud",
					prompt: [
						"Donnie? More like Moronnie",
						[{
							name: "donnie swoleman", 
							text: "OOOOOH BUDDY!! YOU'VE REALLY MADE ME `MAD NOW!!!", 
							tone: "loud"
						}],
						"I'll do it",
						[{
							name: "donnie swoleman",
							text: "HAHAHAHAHAHA!!!",
							tone: "loud"
						},
						{
							name: "donnie swoleman", 
							text: "YOU REALLY ARE A NAIVE CHILD!!",
							tone: "loud"
						},
						{
							name: "donnie swoleman", 
							tone: "loud",
							text: "YOU THINK I WOULD LET A WUSS LIKE YOU `WORK UNDER ME??"
						},
						{
							name: "donnie swoleman", 
							text: "JIM WAS A FOOL TO HIRE YOU!!!",
							tone: "loud"
						}],
					]
				},
				{
					name: "donnie swoleman", 
					text: "NOW IT'S TIME TO DIE!!!",
					tone: "loud",
					action: function() {
						array_push(global.enemiesToDestroy, "donnie swoleman");
						startBattle(["donnie swoleman"], false, global.party, sndBossBattle);
					}
				}
			]
			break;
		case "mom":
			if (!global.events.meetJim) {
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
						action: function() {
							playSound(sndLevelUp);
						}
					},
					{
						name: "jim",
						text: "You'll find BBNC in Wheyford, two blocks south of here."
					},
					{
						name: "jim",
						text: "I'm busy running a business. If you need help, try talking to some of the lifters around the gym.",
						action: function() {
							global.events.meetJim = true;
							with (objItem) {
								if (itemID == "locked door")
									instance_destroy();
							}
						}
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
						text: "I threw in some extra cash so you can buy supplements and training equipment. Your next task is to get SWOLE as SHIT."
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
			else if (!global.events.firstTimeAtWheyfordBarbell) {
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
			else if (!global.events.defeatDonnie) {
				text = [
					{
						name: "jim", 
						text: "You're back already!?"
					}, 
					{
						name: "jim", 
						text: "Get back there and don't come back until you're the strongest motherfather there!"
					},
					{
						name: "jim", 
						text: "Those powerlifters are a bunch of sissies so it shouldn't take too long."
					}
				]
			}
			else {
				textIndex = 1;
				text = [
					{
						name: "jim", 
						text: "Hey, how'd it go?", 
						prompt: [
							"Tell him about Donnie", 
							[
								{
									name: "jim", 
									text: "Donnie Swoleman? Guy's a nut job! I wouldn't listen to a word that comes out of that goon's mouth."
								}
							], 
							"Not too bad",
							[{
								name: "jim", 
								text: "Good deal! That'll teach those Wheyford Barbell folks not to... *clears throat*... good job kiddo!"
							}]
						]
					},
					{
						name: "jim", 
						text: "It's getting late. I think it's time to go home and get some rest, twiglet."
					},
					{
						name: "jim", 
						text: "Be here first thing tomorrow. We have some serious business to take care of!",
						action: function() {
							global.events.endCh1 = true;
							debug("end chapter 1", -1);
						}
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
							text: "You know, that special sports supplement that gives you superhuman muscles?"
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
						startBattle(["smol powerlifter"]);
					}
				}
			]
			break;
		case "smol powerlifter 3":
			textIndex = 5;
			text = [
				{
					name: "smol powerlifter",
					text: "I've been training at Wheyford Barbell for a couple years now. This is the biggest powerlifting gym in the country."
				},
				{
					name: "smol powerlifter", 
					text: "Something about the old school atmosphere seems to turn skinny guys like me into giants over time."
				}, 
				{
					name: "smol powerlifter", 
					text: "You're a bodybuilder, right? Say, have you ever thought about giving powerlifting a try?", 
					prompt: [
						"It's not for me", 
						[
							{
								name: "smol powerlifter", 
								text: "That's fair. If you're just lifting to look good, the numbers aren't that important."
							}
						], 
						"Powerlifting is a joke", 
						[
							{
								name: "smol powerlifter", 
								text: "Ouch! I understand where you're coming from though."
							},
							{
								name: "smol powerlifter", 
								text: "There's definitely more to powerlifting than just flexibility tricks and rule bending."
							}, 
							{
								name: "smol powerlifter", 
								text: "I love the thrill of maxing out and chasing after new PRs!"
							}
						],
					]
				},
				{
					name: "smol powerlifter", 
					text: "I'm sorry! I'm talking too much. I'm pretty passionate about this stuff."
				},
				{
					name: "smol powerlifter", 
					text: "One last thing..."
				},
				{
					name: "smol powerlifter",
					text: "Some of these long-timers are a bit intolerant towards bodybuilders. It's like some sort of territorial dispute."
				},
				{
					name: "smol powerlifter", 
					text: "I'm going to stay away from that drama though. I'm just hear to lift weights!"
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
					text: "Real MEN like me train their muscles for functional strength purposes!",
					prompt: [
						"Such as?", 
						[], 
						"I didn't ask",
						[{
							name: "thicc powerlifter",
							text: "Functional, MANLY... Wait, what did you just say!?"
						}],
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
					text: "*sweating profusely*"
				},
				{
					name: "thicc powerlifter",
					text: "You've really put me in a bad mood! I'll show you what these MANLY powerlifting muscles can do!",
					tone: "loud",
					action: function() {
						array_push(global.enemiesToDestroy, "thicc powerlifter 1");
						startBattle(["thicc powerlifter"]);
					}
				},
			]
			break;
		case "thicc powerlifter 2":
		case "smol powerlifter 2":
			// these guys talk together
			with (objNPC) {
				if (npcID == "thicc powerlifter 2" || npcID == "smol powerlifter 2") {
					switch (oPlayer.face) {
						case "left":
							faceStart = "right";
							break;
						case "right":
							faceStart = "left";
							break;
						case "up":
							faceStart = "down";
							break;
						case "down":
							faceStart = "up";
							break;
					}
					debug($"{npcID} {faceStart}");
				}
			}
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
								face = faceStart;
					}
				},
				{
					name: "bud",
					text: "Oooh! We certainly can't let that happen!",
					action: function() {
						with (objNPC)
							if (npcID == "smol powerlifter 2")
								face = faceStart;
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
						startBattle(["thicc powerlifter", "smol powerlifter"]);
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
					tone: "loud",
					action: function() {
						with (objNPC)
							if (npcID == "super heavyweight 1")
								face = "left";
					}
				},
				{
					name: "super heavyweight",
					text: "*crickets chirping in the background* (little bro bean didn't answer his brother's call).",
					tone: "quiet",
				},
				{
					name: "super heavyweight",
					text: string_upper("How dare you beat up on my little bro `bean!"),
					tone: "loud",
					action: function() {
						with (objNPC)
							if (npcID == "super heavyweight 1") {
								switch (oPlayer.face) {
									case "left":
										face = "right";
										break;
									case "right":
										face = "left";
										break;
									case "up":
										face = "down";
										break;
									case "down":
										face = "up";
										break;
								}
							}
					}
				},
				{
					name: "super heavyweight",
					text: "I'll teach you to pick on someone your own size!",
					action: function() {
						array_push(global.enemiesToDestroy, "super heavyweight 1");
						startBattle(["super heavyweight"]);
					}
				}
			]
			break;
		case "trapped guy":
			text = [
				{
					name: "some guy",
					text: "Oh thank god."
				},
				{
					name: "some guy",
					text: "Donnie trapped me in here after I told him his squat depth sucks."
				},
				{
					name: "some guy",
					text: "These people are crazy! I'm never coming back.",
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