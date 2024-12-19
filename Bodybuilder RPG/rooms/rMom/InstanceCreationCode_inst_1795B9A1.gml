itemID = "mirror";

// find out lagging muscle group
objController.setMinAndMax();
var statsMin = global.statsMin;
var statsMax = global.statsMax;
var str, str2, str3;
show_debug_message(string_concat("statsmin: ", statsMin));
show_debug_message(string_concat("statsmax: ", statsMax));



if (statsMin[1] == statsMax[1]) {
    str = "Everything is looking pretty proportionate!";
    str2 = "";
}
else {
    var word;
    switch (statsMax[0]) {
        case "chest":
        case "back":
            word = " has been ";
            break;
        case "shoulders":
        case "arms":
        case "legs":
        default:
            word = " have been ";
            break;
    }
    str = string_concat("Wow! my ", statsMax[0], word, "looking huge lately!");
    str2 = string_concat("Looks like I need to kick up the intensity for ", statsMin[0], ", though.");
}

switch(global.chapter) {
	case 1:
		str3 = "I definitely need some more mass before I diet.";
		break;
	case 2:
		str3 = "Actually, it might be time to start cutting...";
		break;
	case 3:
	default:
		str3 = "This hard work has really paid off...";
        break;
}

if (str2 == "") {
	text = [
		[str, str3]
	];
}
else {
	text = [
		[str, str2, str3]
	];
}