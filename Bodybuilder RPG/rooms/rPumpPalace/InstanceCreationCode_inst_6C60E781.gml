npcID = "jim";

var maximum = max(global.push, global.pull, global.legs);
var minimum = min(global.push, global.pull, global.legs);

switch(global.chapter) {
	case 1:
	default:
		if (maximum == 1) {
			text = [
				[
					"Hey. You the new guy?", 
					"The name's JIM OHNER. You can call me JIM.",
					"I'm the CEO of Pump Palace Bodybuilding Gyms. We have four locations",
					"What's your name?",
					string_concat(global.characterName, "? What kinda name is that!?"),
					"You're all skin and bones! I need some meat on ya if you wanna train people around here.", 
					"Try hitting some squats, dumbbell bench, and pullups to build up your physique.",
					"Come see me when you're intermediate at all three.",
					"AND DON'T FORGET YOUR CARDIO!"
				],
				[
					"Try hitting some squats, dumbbell bench, and pullups to build up your physique.",
					"Come see me when you're intermediate at all three.",
				]
			]
		}
		else if (minimum == 4) {
			text = [
				[
					"That'll do for today. Go home and get some sleep."
				]
			];
		}
		else {
			text = [
				["Nice work kid! Starting to build some decent muscles!"]
			]
		}
		break;
}