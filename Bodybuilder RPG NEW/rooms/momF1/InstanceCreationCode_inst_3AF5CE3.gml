npcID = "Mom";

switch(global.chapter) {
	case 1:
		switch(global.total) {
			case 3:
				text = [
					["Good morning, son. How did you sleep?", "Don't forget about your new Personal Training job today.", "The gym is in the northwest part of town.", "Don't be late!" ],
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
}