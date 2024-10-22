i = 0;
j = 1;
with (objPlayer) { image_index = 0; image_speed = 0; state = "stand" };

keyConfirmPress = false;

layer = layer_create(-900, "text");
if (instance_exists(objPlayer)) { objPlayer.canMove = false; }
next = false;

// defaults
if (variable_global_exists("playerName")) { global.playerName = "Ben"; }
if (!variable_instance_exists(self, "screen")) { 
	screen = (objPlayer.y+16 > camera_get_view_y(view_camera[0])+135 ) ? "top" : "bottom"; 
}

// default message and variable declarations
if (!variable_instance_exists(self, "text")) { text = [string_concat("This is a test. Hello ", global.playerName, "!")]; }
if (!variable_instance_exists(self, "prompt")) { prompt = false; }
selection = 0;
canPress = true;
drawText = "";
newChars= 0;
skip = false;
indexCheck = 0;

numberOfTexts = array_length(text);
stringLength = string_length(text[i]);
finished = false;

aTime = 2;
alarm[0] = aTime;

nextAlpha = 0;
drawAlpha = 1;

glowAlpha = 0;
glowAlphaChange = 0.025;

// color is dependent on who is talking
personColor = c_white;  // default
