/// @description Insert description here

// if (!variable_instance_exists(self, text)) { text =  [[""]]; }
dist = -1;
textIndex = 0;
textIndexMax = 0
face = "down";
faceStart = "down";
drawSelf = true;

glowAlpha = 0;
glowAlphaChange = 0.025;

if (itemID != "npc") { npcID = "item" }

layer = layer_exists("Items") ? layer_get_id("Items") : layer_create(-101, "Items");