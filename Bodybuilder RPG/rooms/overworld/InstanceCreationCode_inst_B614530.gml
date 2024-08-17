itemID = "dock";
text = [
	["A sturdy wooden dock.","Too bad I don't have a boat."]
]
prompt = false;
if (variable_global_exists("keyItems")) {
	for (var i = 0; i < array_length(global.keyItems); i++) {
		if (global.keyItems[i][0] == "yacht" and global.keyItems[i][1] == true) {
			text = [
				["A sturdy wooden dock.","Board the yacht?"]
			]
			prompt = ["Yes", "No", 8];
		}
	}
}