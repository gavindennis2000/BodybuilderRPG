function ItemDialog(){
	// handles item dialog
	
	/*set up gmlive for this function*/ if (TEST) { if (live_call()) return live_result; }

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
					// atlas stone
					case "atlas stone":
						global.keyItems[0].value = true;
						text = [
							"An atlas stone blocks your path."
						]
						
						if (variable_global_exists("keyItems")) {
							if (global.keyItems[0].value) {  // if you have the serva grips
								text = [
									["An atlas stone blocks your path.","Move the atlas stone?"]
								];
								prompt = ["Yes", "No", "move the atlas stone"];
							}
						}
						break;
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
							]
						];
						action = [
							"*grunt* RAHH THE PUHMP! *wheeze*",
							-1,
							[
								"This guy is going all out!",
								-1,
								-1,
								-1
							],
							"austrian man",
						];
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
					case "locked door":
						// text = [
						// 	"The door is locked."
						// ];
						break;
					// signs
					case "sign":
						break;
					// squat rack
					case "squat rack":
						if (!global.keyEvents.meetJim) {
							text = [
								"An empty combo rack with a barbell."
							];
						}
						else {
							if (global.stats.legs >= 30) {
								text = [
									"An empty combo rack with a barbell.", 
									"You've already maxed out your potential for squats...",
									"Hit some squats anyway?"
								];
							}
							else {
								text = [
									"An empty combo rack with a barbell.", 
									"Hit some squats?"
								];
							}
							prompt = ["Yes", "No", "squat"];
						}
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