/*gmlive*/if (TEST) { if (live_call()) return live_result; }

trigger = -1;
switch (findTrigger) {
	case 4:
		trigger = "l1";
		break;
	case 3:
		trigger = "l2";
		break;
	case 2:
		trigger = "r1";
		break;
	case 1:
		trigger = "r2";
		break;
}

move = true;
barY = 270;
x += 16;