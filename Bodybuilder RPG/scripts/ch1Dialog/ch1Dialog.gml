function ch1Dialog(npcID = -1, itemID = -1){
	var textObj;
	if (npcID != -1) {
		switch (npcID) {
			case "mom":
				textObj = [
					{
						name: "mom",
						text: $"Good morning, Andro."
					},
					{
						name: "mom",
						text: $"Don't be late for work."
					},
				]
				break;
			default:
				textObj = {
					text: $"{npcID}"
				};
				break;
		}
	}
	else if (itemID != -1) {
		switch (itemID) {
			case "gymtendo 64":
				textObj = [
					{
						text: "My Gymtendo 64!"
					},
					{
						text: "I wonder if Ocarina of Gains still works..."
					}
				];
				break;
			default:
				textObj = {
					text: $"{itemID}"
				};
				break;
		}	
	}
	else {
		debug("No dialog found");
		return (-1);
	}

	return textObj;
}