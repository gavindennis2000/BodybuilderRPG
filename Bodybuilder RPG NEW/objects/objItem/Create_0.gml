/// @description Insert description here
text = ["Hello. How are you?", "one two three four five six seven eight nine ten eleven twelve, thirteen"];
dist = -1;
textIndex = 0;
textIndexMax = 0
face = "down";
faceStart = "down";
itemID = -1;

layer = layer_exists("Items") ? layer_get_id("Items") : layer_create(-101, "Items");