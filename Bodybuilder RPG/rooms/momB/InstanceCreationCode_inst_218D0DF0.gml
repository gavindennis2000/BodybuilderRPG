switch (global.chapter) {
	case 1:
	default:
		if (global.total < 12) {
			text = [
				["Geez, I'm sore. Can't wait to sleep after work."]
			];
		}
		else if (global.total == 3) {
			text = [
				["No time to nap. I have to get to work."]
			];
		}
		else {
			text = [
				["Save and proceed to Chapter Two?"]
			];
			prompt = ["Yes", "No", 9]
		}
}