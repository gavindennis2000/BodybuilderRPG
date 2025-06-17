function ch1Dialog(npcID = -1, itemID = -1){
	// handles chapter 1 dialog

	/*gmlive*/ if (TEST) { if (live_call(npcID, itemID)) return live_result; }
	
	var textObj = [{
		name: npcID,
		text: ""
	}];
	if (npcID != -1) {
		switch (npcID) {
			case "mom":
				if (!global.events.meetMom && !global.events.meetJim) {
					textObj = [
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
					textObj = [
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
				break;
			case "jim":
				if (!global.events.meetJim) {
					textObj = [
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
							text: global.characterName != "jim" ? $"{string_upper(global.characterName)}!? What kind of name is that!?" : "Jim!? You've gotta be kidding me!",
							emotion: "cocky",
							tone: "loud"
						},
						{
							name: "jim",
							text: global.characterName != "jim" ? $"The name's Jim Ohner, by the way. You can just call me Jim." : "That's my name! From now on I'm going to address you as \"Twiglet\".",
							emotion: "happy"
						},
						{
							name: "jim",
							text: $"You're all skin and bones! If you want to work at a bodybuilding gym, you're gonna need to put on some serious mass!",
							emotion: "cocky"
						},
						{
							name: "jim",
							text: $"Say, what makes you want a job here anyway?",
							prompt: [
								"I want to be a bodybuilder", 
								[
									{
										name: "jim",
										text: $"Bwahaha! What naive confidence!",
										emotion: "cocky"
									},
									{
										name: "jim",
										text: $"Becoming a bodybuilder takes a lot more than just pumping iron, ya know.",
									},
									{
										name: "jim",
										text: "But still, you might have some potential... "
									},
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
										text: "But don't think I'll forget about what I said earlier. You still need to hit the weights!",
									},
								]
							]
						},
						{
							name: "jim",
							text: "Take this delivery to my business associate at Bodybuilding Nutrition Company (BBNC)."
						},
						{
							text: $"JIM handed {string_upper(global.characterName)} the goods."
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
					textObj = [
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
				textObj = {
					text: $"{npcID}"
				};
				break;
		}
	}
	else if (itemID != -1) {
		switch (itemID) {
			case "gymtendo 64":
				textObj = [
					{
						text: "My Gymtendo 64!"
					},
					{
						text: "I wonder if Ocarina of Gains still works..."
					}
				];
				break;
			default:
				textObj = {
					text: $"{itemID}"
				};
				break;
		}	
	}
	else {
		debug("No dialog found");
		return (-1);
	}

	return textObj;
}