function HandleDialog(){
	// sets text for characters
	
	if TEST { if (live_call()) return live_result; }

	// handle the mirror first cause it's a pain in the a##
	if (npcID == "item" && itemID == "mirror") {

		// find out lagging muscle group
		if (instance_exists(objController)) {
			if (variable_instance_exists(objController.id, "setMinAndMax")) objController.setMinAndMax(); 
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
					word = "has been";
					break;
				case "shoulders":
				case "arms":
				case "legs":
				default:
					word = "have been";
					break;
			}
			// modify the messages to be grammatically correct
			str = $"Wow! my {statsMax[0]} {word} looking huge lately!";
			str2 = $"Looks like I need to kick up the intensity for {statsMin[0]}, though.";
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
				Dialog1();
				break;
		}
	}
	// items
	else {
		ItemDialog();
	}
}