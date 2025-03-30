function Dialog1(){
	// chapter 1 dialog
	
	/*set up gmlive for this function*/ if (TEST) { if (live_call()) return live_result; }
	switch (npcID) {
					// old person 1
					case "old person 1":
						text = [
							"This weather would be perfect for sailing across the lake.",
							"I used to have a yacht, but I donated all of my possessions to the church in Highland.",
							"That's right! I might not look like it but I'm a bodybuilder too!",
							"I'm trying to collect the three Strength Stones to form the Power Polygon before I die!",
							""
						];
						prompt = [
							"Strength Stones?",
							"Power Polygon?",
							"ask about strength stones"
						]
						break;
					// mom
					case "mom":
						debug(global.keyEvents.meetJim)
						if (!global.keyEvents.meetJim) {
							text = [
								[
									string_concat("Good morning, ", global.characterName, "."),
									"Are you ready to start your new job today?",
									"Bodybuilder? You got hired as a personal trainer, `remember?",
									"The new gym you're working at is in the northwest part of town.",
									"Go introduce yourself to the boss, Mr. Ohner.",
									"Don't be late!"
								],
								[
									"What's that? You had a weird dream about becoming a bodybuilder?",
									"You don't want to get that bulky! Big muscles are gross.",
									"You better not be late on your first day!"
								],
								[
									"You better not be late on your first day!"
								]
							]
						}
						else if (global.statsMin[1] < 40) {
							text = [
								[
									"How's your first day of work going, honey?",
									"They're paying you to work out!? Interesting...",
								],
								[
									"There's a chocolate milk in the fridge if you need some protein."
								]
							]
						}
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
									"Whoa? Who was that huge guy!?",
									"He was definitely giving me a bad vibe...",
									"Hey, what'd you think of Pump Palace? Pretty sick, isn't it!",
									"I heard Mr. Ohner wants you to build some brawn before you start training clients.",
									"Go visit my friend Mason in Central Prairie Southeast.", 
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
						else {
							text = [
								$"Hey, {global.characterName}!	",
								"You end up hitting pullups with Mason? How'd it go?"
							]
						}
						break;
								
					// jim ohner
					case "jim":
						if (global.statsMin[1] < 20) {
							if (!global.keyEvents.meetJim) {
								text = [
									"Hey, are you the new trainer I hired?",
									string_concat(global.characterName, "!? What kind of name is that!"),
									"The name's JIM OHNER, but you can call me JIM.",
									"You're all skin and bones! How are you supposed to train my lifters?",
									"If you want me to keep you around, you better put on some serious mass quickly.",
									"Start with compound movements: squats, dumbbell `bench, and pullups.",
									"Come talk to me when all your muscle groups are `intermediate status.",
									"That means your weakest muscle group should be at least Level 30.",
									"Also... One more thing."
								]
								action = "meet jim";
							}
							else {
								text = [
									"Start with compound movements: squats, dumbbell `bench, and pullups.",
									"I'm too busy to help you out, so bug the other lifters if you need lifting advice.",
									"Come talk to me when all your muscle groups are `intermediate status.",
									"That means your weakest muscle group should be at least level 30."
								]
								action = -1;
							}
						}
						else if (global.statsMin[1] < 30) {
							text = [
								"You're really starting to put on some muscle! Great work kid!",
								$"Don't let your {global.statsMin[0]} fall behind!"
							];
						}
						else {
							if (!global.keyEvents.bunnyHoodCoupon) {
								text = [
									"Great work today! I didn't expect you to become an intermediate lifter so soon...",
									"I need you to do one more thing before you head home for the night.",
									"Go to Central Prairie Community College and grab yourself a bunny hood at the shop.",
									"The hood increases your running speed when wearing it.",
									"Here's a coupon for a free one."
								];
								action = "bunny hood coupon";
							}
							else {
								text = [
									"Go to Central Prairie Community College and grab yourself a bunny hood at the shop.",
									"The hood increases your running speed when wearing it.",

								];
								action = -1
							}
						}
						break;
								
					// gym rat 1
					case "gym rat 1":
						text = [
							[
								"*pant* *pant* What's that? You're waiting to use this bench?",
								"It's all yours. I'm wiped out.",
								"This is what happens when you skip your cardio!",
								"I'm a boxer so I mostly build my upper body through combat, not lifting.", 
								"If bench pressing is too hard, you should give fighting a try.",
								"There's a martial arts gym south of here in Wheyford."
							],
							[
								"If bench pressing is too hard, you should give fighting a try.",
								"There's a martial arts gym south of here in Wheyford."
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
					// gym rat 3
					case "gym rat 3":
						text = [
							[
							"Yo!",
							"I'm a powerlifting competitor at this gym. Jim told me we'd have a new guy today.",
							"Need some help with your squats?"
							],
							[
							"Hey, need some help with your technique?"
							],
						];
						prompt = [
							"Sure!",
							"Nope",
							"squat help"
						]
						break;
					// mason 
					case "mason":
						if (!global.keyEvents.meetMason) {
							text = [
								[
									string_concat("You must be ", global.characterName, "."),
									"Harvey told me about you... I'm a natural bodybuilder as well!",
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
					case "person 1":
						// young woman by the atlas stone
						text = [
							"I was going to visit my grandma in Highland but a local strongman sealed the path with an atlas stone.",
							"What a jerk!"
						]
						prompt = ["Strongman?", "Highland?", "ask about strongman"];
						break;
					default:
						text = (variable_instance_exists(id, "npcID")) ? [[ string_upper(string(npcID)) ]] : [[ "There is no text for this object yet.", string_concat("Hello, ", global.characterName, "!") ]];
						// text = [[string(npcID)]];
						break;
								
							
				}
}