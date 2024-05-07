pause = false;
keyPause = false;
unpause = false;

if (!layer_exists("pause"))
	layer = layer_create(-100, "pause");	
else 
	layer = layer_get_id("pause");

draw_set_font(fntTextBox);

yChange = 270;
xChange = 480;

location = -1;
chapter = -1;