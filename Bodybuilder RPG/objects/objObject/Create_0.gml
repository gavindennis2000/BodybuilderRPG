drawAction = false;
daAlpha = 0;
image_alpha = 1;
obj = "sign";
text = [ ["Hello. Hello1 Hello2 Hello3 Hello4 Hello5 Hello6 Hello7 Hello8 Hello9", "Did you get all that?"] ];
textLength = array_length(text);
textIndex = 0;
textRepeat = 0;

if (!layer_exists("NPC"))
	layer = layer_create(-5, "NPC");
else 
	layer = layer_get_id("NPC");