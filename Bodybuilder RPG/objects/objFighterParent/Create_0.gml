// stats
lvl =  1
xp = 0;
maxhp =  1000
hp =  maxhp
sk = 10;
att =  1;
def =  1;
spd =  1;
luck =  1;

// KO status
ko = false;

// skills
skills = array_create(10, "");
skills[0] = "Brace";

// fighter data
state = "wait";  // states are wait, attack, defend, skill, item
fighter = "ben";  // fighters are ben, quade, and deadlynn
fighterID = 0;
image_alpha = 0;
fightStart = false;
alarm[0] = 30;

function loadStats(stats) {
	lvl = stats.lvl;
	xp = stats.xp;
	maxhp = stats.maxhp;
	hp = stats.hp;
	sk = stats.sk;
	att = stats.att;
	def = stats.def;
	spd = stats.spd;
	luck = stats.luck;
}