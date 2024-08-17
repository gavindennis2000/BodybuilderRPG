///@description Populate rooms with stuff
var yes = true;
switch(global.roomID) {
	
	case "harvey":
	default:
		if (yes) {
			with (objDoor) {
				roomID = -1
				goTo = overworld;
				pX = 3520;
				pY = 1888 + 32;
				pFace = "down";	
			}
			// create mom
			with (instance_create_layer(320, 224, layer, objNPC)) {
				npcID = "harvey's mom";

				switch(global.chapter) {
					case 1:
						text = [
							[string_concat("Hey ", global.characterName, "!"), "Are you looking for Harvey?", "He left for the gym about two hours ago."]
						];
						break;
					case 2:
						
						break;
				}	
			}
		
		}
		break;
		
	case "mason":
		if (yes) {
			with (objDoor) {
				roomID = -1
				goTo = overworld;
				pX = 3136;
				pY = 2144 + 32;
				pFace = "down";	
			}
		}
		break;
		
	case "mom":
		if (yes) {
			with (objDoor) {
				roomID = -1
				goTo = overworld;
				pX = 3520;
				pY = 2144 + 32;
				pFace = "down";	
			}
			// create bookshelves
			with instance_create_layer(128, 128, layer, objItem) { itemID = "book"; text = ["Scientific Principles of Hypertrophy Training by Dr. Mike Israetel et al.", "The GOAT of bodybuilding textbooks!"]; }
			with instance_create_layer(128 + 32, 128, layer, objItem) {itemID = "book"; text = ["ProgrammingToWin 2 by Izzy Narvaez", "Great powerlifting program!"]; }
			with instance_create_layer(128 + 64, 128, layer, objItem) {itemID = "book"; text = ["The Art and Science of Lifting by Greg Knuckols and Omar Isuf."]; }
			with instance_create_layer(128 + 96, 128, layer, objItem) {itemID = "book"; text = ["Starting Strength by Mark Rippetoe."]; }
		
			// create mom
			with (instance_create_layer(320, 224, layer, objNPC)) {
				npcID = "mom";
				var str = "";

				switch(global.chapter) {
					case 1:
						switch(global.total) {
							case 3:
								text = [
									[string_concat("Good morning, ", global.characterName,". How did you sleep?"), "Don't forget about your new Personal Training job today.", "The gym is in the northwest part of town.", "Don't be late!" ],
									["The gym is in the northwest part of town.", "Don't be late!"]
								];
								break;
							case 12:
								text = [
									["I can smell your hard work! Don't forget to take a shower before bed!"],
									["I can smell your hard work! Don't forget to take a shower before bed!"],
									["I can smell your hard work! Don't forget to take a shower before bed!"],
									["I can smell your hard work! Don't forget to take a shower before bed!"],
									["I can smell your hard work! Don't forget to take a shower before bed!"],
									["Oh for crying out loud. Click on your bed to start Chapter 2."],
									[""]
								];
								break;
							default:
								text = [
									[ "Wow! Is that a vein popping out of your bicep?" ]
								];
								break;
						}	
						break;
					case 2:
						if (global.total == 12) {
							str = string_concat("Good morning ", global.characterName, ".");
							text = [
								[str,"Don't forget to pick up your check from Mr. Ohner today."]
							];
						}
						else if (global.total < 21) {
							text = [
								["Make sure you pay your grandma a visit soon. She hasn't been feeling well.",
								"She lives down in Great Valliou Southeast."],
							]
						}
						else {
							text = [
								["Wow! You're looking strong!", "Wanna give me a hand with the groceries?"]
							]
						}
						break;
				}	
			}
		
			// create stairs
			with (instance_create_layer(512, 128, layer, objDoor)) {
				doorID = "stairs";
				roomID = -1;
				goTo = momB;
				pX = 512 - 32;
				pY = 160;
				pFace = "left";
			}
			// we're done
		}
		break;
}