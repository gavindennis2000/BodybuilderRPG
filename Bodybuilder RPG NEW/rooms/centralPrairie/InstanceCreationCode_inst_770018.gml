itemID = "water";

var check = false; 
for (var i = 0; i < array_length(global.keyItems); i++) {
	if (global.keyItems[i][0] == "yacht" and global.keyItems[i][1] == true)	{ check = true; }
}
if (check) {
	text = [["Drink from the chocolate milk lake?"]];
	prompt = ["Yes", "No", 7]
} else {
	text = [["Ride your \"yacht?\""]];
	prompt = ["Yes", "No", 8]
}