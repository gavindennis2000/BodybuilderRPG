itemID = "atlas stone";

var check = false;
if (variable_global_exists("keyItems") {
	for (var i = 0; i < array_length(global.keyItems); i++) {
		if (global.keyItems[i][0] == "serva grips" and global.keyItems[i][1] == true) 
			{ check = true; }
	}

	if (!check) {
		text = ["A giant atlas stone blocks your path."]
	} else {
		text = [["A giant atlas stone blocks your path.", "Move the atlas stone?"]]
		prompt = ["Yes", "No", 6]
	}
}