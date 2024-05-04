i = 0;
j = 1;

keyConfirmPress = false;

layer = layer_create(-100, "text");
global.playerCanMove = false;
next = false;

// defaults
if (variable_global_exists("playerName")) { global.playerName = "Ben"; }
if (!variable_instance_exists(self, "screen")) { 
	screen = (objPlayer.y >= camera_get_view_y(view_camera[0])+135 ) ? "top" : "bottom"; 
}

// default message and variable declarations
if (!variable_instance_exists(self, "text")) { text = ["This is a test. Hello " + global.playerName + "!"]; }
drawText = "";
newChars= 0;
skip = false;
indexCheck = 0;

numberOfTexts = array_length(text);
stringLength = string_length(text[i]);
finished = false;

aTime = 2;
alarm[0] = aTime;

drawAlpha = 1;