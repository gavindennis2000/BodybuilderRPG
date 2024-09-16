npcID = "harvey";
switch(global.chapter) {
	case 1:	
		if (global.total == 3) {
			text = [
				[
				string_concat("Hey ", global.characterName, "!"), 
				"Have you been to the new PUMP PALACE gyms yet?",
				"They hired you as a personal trainer? No way!",
				"Have you introduced yourself to Mr. OHNER yet?"
				],
				[
				"I just got done hitting chest and shoulders. They have some great equipment!",
				"Some guy was hogging the dumbbells for chest flyes though."
				]
			]
		}
		else if (global.pull < 2) {
			text = [
				[
				"My workout parter MASON got his own place down the street from you.",
				"You should swing by and introduce yourself."
				]
			]
		}
		else {
			text = [
				[
				"Mason says you're a really hard worker! We'll have to get a lift in soon.",
				"There's a deadlift party at the Great Valliou Pump Palace tomorrow if you want to swing by."
				],
				[
				"There's a deadlift party at the Great Valliou Pump Palace tomorrow if you want to swing by."
				]
			]
		}
}