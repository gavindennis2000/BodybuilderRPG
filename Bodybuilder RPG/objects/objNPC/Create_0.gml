face = "down";
image_speed = 0;
image_index = 0;

npc = "";
npcID = -1;
initial = true;

sprite_index = sprPlayerDown;

if (!layer_exists("NPC"))
	layer = layer_create(-5, "NPC");
else 
	layer = layer_get_id("NPC");

drawAction = false;
daAlpha = 0;

text = [["Hello. Hello1 Hello2 Hello3 Hello4 Hello5 Hello6 Hello7 Hello8 Hello9", "Did you get all that?"]];
textLength = array_length(text);
textIndex = 0;
textRepeat = 0;