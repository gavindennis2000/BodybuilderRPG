function HandleDialog(){
	// sets text for characters
	
	if TEST { if (live_call()) return live_result; }
	

	switch(npcID) {
				
		// mom
		case "mom":
			text = [
				[
					"Good morning. Are you ready to start your new job as a personal trainer?",
					"The gym is in the northwest part of town past the \nuniversity.",
					"Don't forget to introduce yourself to your boss, Mr. Ohner.",
					"Don't be late!"
				],
				[
					"The gym is in the northwest part of town past the \nuniversity.",
					"Don't forget to introduce yourself to your boss, Mr. Ohner.",
					"Don't be late!"
				]
			]
			break;
					
		// harvey
		case "harvey":
			text = [
				[
					string_concat("Hey, ", global.characterName, "!"),
					"Have you been to the new Pump Palace gym yet?",
					"What's that? You got a job there as a personal trainer!? Unreal!",
					"Let me know how it goes after you meet the owner.",
					"I'll probably still be here catching my breath haha."
				],
				[
					"Let me know how it goes after you meet the owner.",
					"I'll probably still be here catching my breath haha."
				]
			]
			break;
					
		// jim ohner
		case "jim":
			text = [
				[
					"Hey, are you the new trainer I hired?",
					string_concat(global.characterName, "!? What kind of name is that!"),
					"The name's JIM OHNER, but you can call me JIM.",
					"You're all skin and bones! How are you supposed to train my lifters?",
					"If you want me to keep you around, you better put on some serious mass quickly.",
					"Start with compound movements: squats, dumbbell    bench, and pullups.",
					"I'm too busy to help you out, so bug the NPCs if you need lifting advice.",
					"Come talk to me when all your muscle groups are    intermediate status.",
					"Good luck, kid."
				],
				[
					"If you want me to keep you around, you better put on some serious mass quickly.",
					"Start with compound movements: squats, dumbbell    bench, and pullups.",
					"I'm too busy to help you out, so bug the NPCs if you need lifting advice.",
					"Come talk to me when all your muscle groups are    intermediate status.",
					"Good luck, kid."
				]
			]
			break;
					
		// gym rat 1
		case "gym rat 1":
			text = [
				[
					"*pant* *pant* What's that? You're waiting to use this bench?",
					"It's all yours. I'm wiped out.",
					"This is what happens when you skip your cardio!"
				],
				[
					"This is what happens when you skip your cardio!"
				]
			]
			break;
			
		// gym rat 2
		case "gym rat 2":
			text = [
				[
					"I love cardio! I can burn calories while I play games on my phone.",
					"You should give it a try sometime!"
				]
			]
			break;
					
		// default
		default:
			text = [[
				string(npcID)
			]]
			break;
					
				
	}
}