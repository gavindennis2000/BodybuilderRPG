// stats
lvl =  1
xp = 0;
maxhp =  500;
hp =  maxhp
sk = 10;
att =  1;
def =  1;
spd =  1;
luck =  1;
eq = {  // equipment
	weapon: "",
	wAtt: 0,
	wSp: "",
	armor: "",
	aDef: 0,
	aSp: ""
};
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

// fighter data
state = "wait";  // states are wait, attack, defend, skill, item
fighter = "ben";  // fighters are ben, quade, and deadlynn
isEnemy = false;
fighterID = 0;
image_alpha = 0;
image_index = 0;
fightStart = false;
alarm[0] = 30;
attSound = sndBenAtt;  // default attack sound

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

// attack enemies and such
target = -1;
tX = -1;
tY = -1;
yChange = 0;
act = false;
use = -1;
attackWait = false;
goBack = 0;
showDamage = false;
damage = -1;

// extra stuff
sprInit = -1;

// perform action
function performAction(target, action, enemy=false) {
	// performs action
	switch (action) {
		// generic attack
		case "Attack":
		default:
			ctrAdd = 3;
			self.target = target;
			tX = (target.isEnemy) ? target.x + 40 : target.x - 40;
			tY = target.y;
			act = true;
			attackWait = true;
			direction = point_direction(x, y, tX, tY);
			var spd = 8;
			state = "run";
			speed = spd + 4*haste;
			break;
		// run
		case "Run":
			state = "runaway";
			act = true;
			with (objFighter) {
				var spd = 8;
				direction = 0;
				speed = spd + 4*haste;
			}
			alarm[5] = 30;
			break;
		// skills
		case "Brace":
		case "Hydro20":
			state = "use";
			self.target = target;
			use = action;
			act = true;
			alarm[5] = 30;
			break;
			
	}
}

// player goes back to initial x and y
function goBackFunction() {
	goBack = xstart - x;
	alarm[2] = 1;
}

// deals damage to player and shows it
dmgY = 0;
function dealDamage(target) {
		showDamage = true;
		dmgY = 2;
		alarm[4] = 45;
		var r = random_range(0.9, 1.1);  // random coefficient to multiply into damage
		damage = round( (att + eq.wAtt) * 51 *  r );
		var criticalHit = false;
		if (criticalHit) { damage *= 2; }
		if (target.brace) { damage = round(damage / 2); }
		target.hp -= damage;
		objBattle.playSound(attSound);
}

fadeRoom = 0;