switch(global.chapter) {
	
	case 1:
		if (global.maximum == 1) {
			text = [
				[
					"There's a person doing dumbbell chest flyes here.", "Should I ask to work in?"
				],
				[
					"The same guy is still doing dumbbell chest flyes. Great."
				]
			]
			prompt = ["Yes", "No", 2]
		} else {
			text = [
				[
					"The same guy is still doing dumbbell chest flyes. Great."
				]
			]
		}
		break;
		
	default:
		text = [
			[
				"How is this guy still doing dumbbell chest flyes?."
			]
		]
		break;

}