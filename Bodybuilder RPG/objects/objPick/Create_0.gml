trigger = -1;
switch (x) {
	case 480 - 32*5:
		trigger = "l2";
		break;
	case 480 - 32*4:
		trigger = "r1";
		break;
	case 480 - 32*3:
		trigger = "r2";
		break;
	case 480 - 32*2:
	default:
		trigger = "l1";
		break;
}

x -= room_width;
move = true;
alarm[0] = room_width/8;