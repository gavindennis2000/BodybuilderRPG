/// @description Insert description here

event_inherited();

text = ["Drink from the chocolate milk lake?"];
prompt = ["Yes", "No", 7];

if (variable_global_exists("keyItems")) {
	if (global.keyItems.yacht == true) {
			text = ["Board your \"yacht\"?"];
			prompt = ["Yes", "No", 8]	
    }
}