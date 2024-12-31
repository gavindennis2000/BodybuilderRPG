function HandleDialog(){
	// sets text for characters
	
	if TEST { if (live_call()) return live_result; }

	// handle the mirror first cause it's a pain in the a##
	if (npcID == "item" && itemID == "mirror") {

		// find out lagging muscle group
		if (instance_exists(objController)) {
			if (variable_instance_exists(objController, "setMinAndMax")) objController.setMinAndMax(); 
		}
		var statsMin = global.statsMin;
		var statsMax = global.statsMax;
		var str, str2, str3;

		// proportionate muscle groups
		if (statsMin[1] == statsMax[1]) {
			str = "Everything is looking pretty proportionate!";
			str2 = "";
		}
		// not proportionate
		else {
			var word;
			switch (statsMax[0]) {
				case "chest":
				case "back":
					word = " has been ";
					break;
				case "shoulders":
				case "arms":
				case "legs":
				default:
					word = " have been ";
					break;
			}
			// modify the messages to be grammatically correct
			str = string_concat("Wow! my ", statsMax[0], word, "looking huge lately!");
			str2 = string_concat("Looks like I need to kick up the intensity for ", statsMin[0], ", though.");
		}

		// set the last paragraph depending on the chapter
		switch(global.chapter) {
			case 1:
				str3 = "I definitely need some more mass before I diet.";
				break;
			case 2:
				str3 = "Actually, it might be time to start cutting...";
				break;
			case 3:
			default:
				str3 = "This hard work has really paid off...";
				break;
		}
		
		// decide which texts to use based on whether or not muscles are proportionate
		if (str2 == "") {
			text = [
				[str, str3]
			];
		}
		else {
			text = [
				[str, str2, str3]
			];
		}

		// finished with the mirror and on to everything else
		exit;
	}

	// npcs
	else if (npcID != "item") {
		switch (global.chapter) {
			case 1:
				switch (npcID) {
							
					// mom
					case "mom":
						text = [
							[
								string_concat("Good morning, ", global.characterName, "."),
								"Are you ready to start your new job as a personal trainer?",
								"The gym is in the northwest part of town past the \nuniversity.",
								"Don't forget to introduce yourself to your boss, Mr. Ohner.",
								"Don't be late!"
							],
							[
								"The gym is in the northwest part of town past the \nuniversity.",
								"Don't be late!"
							]
						]
						break;
								
					// harvey
					case "harvey":
						if (!global.keyEvents.meetJim) {
							text = [
								[
									string_concat("Hey, ", global.characterName, "!"),
									"Have you been to the new Pump Palace gym yet?",
									"What's that? You got a job there as a personal trainer!? Unreal!",
									"Let me know how it goes after you meet the owner.",
									"I'll probably still be here catching my breath haha!"
								],
								[
									"Let me know how it goes after you meet the owner.",
									"I'll probably still be here catching my breath haha!"
								]
							]
						}
						else if (!global.keyEvents.meetMason) {
							text = [
								[
									"Hey, what'd you think of Pump Palace? Pretty sick, isn't it!",
									"I heard Mr. Ohner wants you to build some brawn before you start training clients.",
									"Go visit my friend Mason in Central Prairie South.", 
									"His back is so wide he can't fit through doors anymore!",
									"He'll definitely whip your lats into shape!"
								],
								[
									"Go visit my friend Mason in Central Prairie Southeast.", 
									"His back is so wide he can't fit through doors anymore.",
									"He'll definitely whip your lats into shape!"
								]
							]
						}
						break;
								
					// jim ohner
					case "jim":
						if (global.statsMin[1] < 20) {
							text = [
								[
									"Hey, are you the new trainer I hired?",
									string_concat(global.characterName, "!? What kind of name is that!"),
									"The name's JIM OHNER, but you can call me JIM.",
									"You're all skin and bones! How are you supposed to train my lifters?",
									"If you want me to keep you around, you better put on some serious mass quickly.",
									"Start with compound movements: squats, dumbbell    bench, and pullups.",
									"Come talk to me when all your muscle groups are    intermediate status.",
									"Also... One more thing.",
								],
								[
									"Start with compound movements: squats, dumbbell    bench, and pullups.",
									"I'm too busy to help you out, so bug the other lifters if you need lifting advice.",
									"Come talk to me when all your muscle groups are    intermediate status.",
								]
							]
							action = "meet jim";
						}
						else if (global.statsMin[1] < 40) {
							text = [
								"You're really starting to put on some muscle! Great work!",
								string_concat("Don't let your ", statsMin[0], " fall behind!")
							];
						}
						else {
							text = [
								"Great work today! I didn't expect you to become an intermediate lifter so soon...",
								"Go home and get some rest."
							]
						}
						break;
								
					// gym rat 1
					case "gym rat 1":
						text = [
							[
								"*pant* *pant* What's that? You're waiting to use this bench?",
								"It's all yours. I'm wiped out.",
								"This is what happens when you skip your cardio!",
								"Bench pressing is kind of like a rhythm game when you think about it.", 
								"I'm a boxer so I mostly build my upper body through combat.", 
								"If benching is too hard, you should give fighting a try. There's a dojo south of here."
							],
							[
								"Bench pressing is kind of like a rhythm game when you think about it.", 
								"I'm a boxer so I mostly build my upper body through combat.", 
								"If benching is too hard you should give it a try. There's a dojo south of here."
							]
						];
						break;
						
					// gym rat 2
					case "gym rat 2":
						text = [
							[
								"I love cardio! I can burn calories while I play games on my phone.",
								"You should give it a try sometime!"
							]
						];
						break;
					// mason 
					case "mason":
						if (!global.keyEvents.meetMason) {
							text = [
								[
									string_concat("You must be ", global.characterName, "."),
									"Harvey told me about you... I'm a natural bodybuilding competitor as well!",
									"Say, which do you think is more important?"
								]
							];
							prompt = ["Work Ethic", "Passion", "mason philosophy"];
						}
						else {
							text = [
								[
									string_concat("How's it going, ", global.characterName, "?"),
									"Did you come by to hit some pullups?"
								]
							];
							prompt = ["Let's do it!", "Maybe later", "pullups"];
						}
						break;
					default:
						text = (variable_instance_exists(id, "npcID")) ? [[ string_upper(string(npcID)) ]] : [[ "There is no text for this object yet.", string_concat("Hello, ", global.characterName, "!") ]];
						// text = [[string(npcID)]];
						break;
								
							
				}
			break;
		}
	}
	// items
	else {
		switch (global.chapter) {
			case 3:
				switch (itemID) {
					// books
					case "book":
						break;
					// tv
					case "tv":
						text = [
							[
								"Another pile of video games...",
								"Majora's Mass, the awesome sequel to Ocarina of Gains!"
							],
							[
								"Hey look! It's Bodybuilder RPG!"
							],
							[
								"There are other games in the pile too...",
								"Super Marshmallow Man? Operation Warfare? What are these?"
							],
							[
								"These are other games that were programmed by the game creator, Gavin Dennis!",
								"If you made it this far, thank you for playing my video game!"
							]
						];
						break;
					// default
					default:
						text = [
							[
								string_concat(itemID, ": Item text not handled yet.")
							]
						];
						break;
				}
				break;
			case 2:
				switch (itemID) {
					// bench press at mom's
					case "bench press":
						text = [
							[
								"Bench press. My favorite Lift!",
								"I think I have time for a couple sets...",
								"Time to bench?"
							]
						];
						prompt = ["Yes", "No", "bench press"];
						break;
					// the player's bed
					case "bed":
						if (global.statsMin[1] < 70) {  // #TODO change this
							text = [
								[
									"That was a good night of sleep. Time to make some gains!"
								]
							];
						}
						else {
							text = [
								["Save and proceed to Chapter Three?"]
							];
							prompt = ["Yes", "No", 9];
						}
						break; 
					// books
					case "book":
						break;
					// tv
					case "tv":
						text = [
							[
								"Street Mighter II. One of my original inspirations for getting jacked!"
							],
							[
								"Shrekken 7: King of Ogre Fist Tournament.",
								"No more video games unless I'm doing cardio!"
							],
							[
								"No more video games unless I'm doing cardio!"
							]
						]
						break;
					// default
					default:
						text = [
							[
								string_concat(itemID, ": Item text not handled yet.")
							]
						];
						break;
				}
				break;
			case 1:
				switch (itemID) {
					// bed of the player
					case "bed":
						if (!global.keyEvents.meetJim) {
							text = [
								["No time to nap. I have to get to work."]
							];
						}
						else if (global.statsMin[1] < 40) {
							text = [
								[
									"Geez, I'm sore.",
									"Can't wait to finish work so I can sleep."
								]
							];
						}
						else {
							text = [
								[
									"Another sound day of training.",
									"Save and proceed to Chapter Two?"
								]
							];
							prompt = ["Yes", "No", "finish chapter one"]
						}
						break;
					// bench press at mom's house
					case "bench press":
						text = [
							[
								"Bench press. My favorite Lift!",
								"Maybe I'll knock out a few sets after work..."
							]
						];
						break;
					// books
					case "book":
						break;
					// chest flyes
					case "chest flyes":
						text = [
							[
								"A large Austrian man is hitting some dumbbell flyes.",
								"Austrian man: *grunt* RAHH THE PUHMP! *wheeze*",
								"This guy is going all out!"
							]
						]
						break;
					// db bench
					case "db bench":
						if (global.keyEvents.meetJim) {
							text = [
								[
									"A Brogue Utility Bench.", 
									"Hit some dumbbell bench?"
								]
							];
							prompt = ["Yes", "No", "db bench"];
						}
						else {
							text = [
								[
									"A Brogue Utility Bench."
								]
							];
						}
						break;
					// signs
					case "sign":
						break;
					// squat rack
					case "squat rack":
						if (!global.keyEvents.meetJim) {
							text = [
								[
									"An empty combo rack with a barbell."
								]
							];
							break;
						}
						text = [
							[
								"An empty combo rack with a barbell.", 
								"Hit some squats?"
							]
						]
						prompt = ["Yes", "No", "squat"];
						break;
					// treadmill
					case "treadmill":
						if (!global.keyEvents.meetJim) {
							text = [
								[
									"Treadmill. An honest cardio modality.",
								]
							];
							break;
						}
						text = [
							[
								"Treadmill. An honest cardio modality.",
								"Walk on the treadmill?"
							]
						];
						prompt = ["Yes", "No", "cardio"];
						break;
					// tv
					case "tv":
						text = [
							[
								"My old Gymtendo 64.", 
								"I wonder if Ocarina of Gains still works..."
							],
							[
								"I don't think I have time to play video games right now."
							]
						];
						break;
					// default - item not found
					default:
						text = [
							[
								string_concat(itemID, ": Item text not handled yet.")
							]
						];
						prompt = ["I understand", "Come on Gavin!", ""];
						break;
				}
				break;
			// default - chapter that doesn't exist?
			default:
				break;
		}
	}
}