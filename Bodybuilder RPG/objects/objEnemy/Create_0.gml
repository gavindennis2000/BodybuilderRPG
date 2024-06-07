/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
isEnemy = true;
ctr += 0.25;

// enemy commands
commands = ["Attack"];
cIndex = 0;

statsLoaded = false;
image_index = 0;

function loadStatsEnemy(enemy) {
	switch (enemy) {
		case "npc":
			// stats
			lvl =  1;
			xp = 100;
			maxhp =  500;
			hp =  maxhp
			sk = 10;
			att =  1;
			def =  1;
			spd =  1;
			luck =  1;
			ctr = 0;
			ctrAdd = 0;
			tempAtt = 0;
			tempDef = 0;

			// status ailments and buffs
			ko = false;
			koFade = 0;
			haste = false;
			brace = false;

			// skills
			skills = array_create(10, ["", 0]);
			skills[0] = ["Brace", 0]; // skill, mp cost
			commands = ["Brace", "Attack"];
	}
}