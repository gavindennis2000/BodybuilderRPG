/// @description use items/skills/run
if (state == "runaway") {
	fadeRoom += 0.1;
	
	if (fadeRoom >= 1) {
		objMusic.endBattle()
		var temp = global.previousRoom;
		instance_create_depth(temp[1], temp[2], 0, objPlayer);
		room_goto(temp[0]);
	}
	else 
		alarm[5] = 5;
	exit;	
}
switch (use) {
	case "Brace":
		brace = true;
		break;
	case "Hydro20":
		target.hp += 20;
		if (target.hp > target.maxhp) { target.hp = target.maxhp; }
		break;
}
alarm[3] = 30;