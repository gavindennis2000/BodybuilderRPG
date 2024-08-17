itemID = "mirror";

// text
var str = -1
var str2 = -1;

if (global.legs < global.push and global.legs < global.pull) {
	str = "Can anybody tell I've been skipping leg day?";
}
else if (global.push < global.pull and global.push < global.legs) {
	str = "Chest and shoulders could definitely use some work...";
}
else if (global.pull < global.push and global.pull < global.legs) {
	str = "My posture is terrible! I better stop skipping back day.";
}

switch(global.chapter) {
	case 1:
		str2 = "I definitely need some more mass before I diet.";
		break;
	case 2:
		str2 = "Actually, it might be time to start cutting...";
		break;
	case 3:
	default:
		str2 = "This hard work has really paid off...";
}
if (str != -1) {
	text = [
		["Wow! Lookin swole!", str2, str]
	];
}
else {
	text = [
		["Wow! Lookin swole!", str2]
	];
}