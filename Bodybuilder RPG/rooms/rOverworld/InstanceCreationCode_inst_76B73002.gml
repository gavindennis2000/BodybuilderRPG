// atlas stone
itemID = "atlas stone";
text = [
	["An atlas stone blocks your path."]
]

if (variable_global_exists("keyItems")) {
    if (global.keyItems[0].value) {  // if you have the serva grips
        text = [
            ["An atlas stone blocks your path.","Move the atlas stone?"]
        ]	
        prompt = ["Yes", "No", 6]
    }
}