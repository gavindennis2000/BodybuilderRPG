/// @description Insert description here

event_inherited();

text = ["Drink from the chocolate milk lake?"];
prompt = ["Yes", "No", 7];

if (variable_global_exists("keyItems")) {
	for (var i = 0; i < array_length(global.keyItems); i++) {
		if (global.keyItems[i][0] == "yacht" and global.keyItems[i][1] == true) {
			text = ["Board your \"yacht\"?"];
			prompt = ["Yes", "No", 8]	
		}
	}
}