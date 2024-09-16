npcID = "gym rat 1"

switch(global.push) {

	case 1:
		text = [
			[
				"*pant*  *pant*",
				"Trying to hit Dumbbell Bench? All yours.",
				"*pant* *pant*",
				"Careful. The floor's a littly flimsy right there."
			],
			[
				"*pant*  *pant*",
				"Careful. The floor's a littly flimsy right here."
			] 
		];
		break;
	case 2:
	case 3:
		text = [["You're starting to build some real muscles!"]]
		break;
	case 4:
	default:
		text = [
			[
				"Those pecs have evolved into watermelons. My goodness."
			] 
		];
		break;
}