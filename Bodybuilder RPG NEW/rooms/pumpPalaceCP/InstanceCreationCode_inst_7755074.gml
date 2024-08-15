npcID = "Gymrat 2"

npcID = "Gymrat 1"

switch(global.legs) {

	case 1:
		text = [
			"Squats? Never. My knees can't handle them.",
			"I mostly just do cardio. I can play a game on my phone while I burn calories!",
			"Awesome huh?"
		]
		break;
	case 2:
	case 3:
		text = [["You're starting to build some great legs!"]]
		break;
	case 4:
	default:
		text = [
			[
				"Holy cow! Did I just see you rep four plates!?"
			] 
		];
		break;
}