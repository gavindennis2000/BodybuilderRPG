itemID = "bed";
switch (global.chapter) {
	case 1:
	default:
		if (global.total == 3) {
			text = [
				["No time to nap. I have to get to work."]
			];
		}
		else if (global.total < 12) {
			text = [
				["Geez, I'm sore. Can't wait to sleep after work."]
			];
		}
		else {
			text = [
				["Save and proceed to Chapter Two?"]
			];
			prompt = ["Yes", "No", 9]
		}
		break;
	case 2:
		if (global.total == 12) {
			text = [
				["That was a good night of sleep. Time to make some gains."]
			];
		}
		else if (global.total < 21) {
			text = [
				["These back muscles are starting to make it hard to sleep on my side..."]
			];
		}
		else {
			text = [
				["Save and proceed to Chapter Three?"]
			];
			prompt = ["Yes", "No", 9]
		}
}