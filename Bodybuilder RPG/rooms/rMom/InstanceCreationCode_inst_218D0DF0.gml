itemID = "bed";
switch (global.chapter) {
	case 1:
		if (global.statsMin[1] == 1) {
			text = [
				["No time to nap. I have to get to work."]
			];
		}
		else if (global.statsMin[1] < 40) {
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
		if (global.statsMin[1] < 70) {
			text = [
				["That was a good night of sleep. Time to make some gains!"]
			];
		}
		else {
			text = [
				["Save and proceed to Chapter Three?"]
			];
			prompt = ["Yes", "No", 9]
		}
        break; 
    
    default: 
        break;
}