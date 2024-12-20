itemID = "dock";
text = [
	["A sturdy wooden dock.","Too bad I don't have a boat."]
]
prompt = false;
if (variable_global_exists("keyItems")) {
    if (global.keyItems[1].value) {  // if you have the yacht
        text = [
            ["A sturdy wooden dock.","Board the yacht?"]
        ]
        prompt = ["Yes", "No", 8];
    }
}