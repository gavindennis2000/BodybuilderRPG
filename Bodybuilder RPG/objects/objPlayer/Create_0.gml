#macro TEST 1
#macro CAMHEIGHT 480
#macro CAMWIDTH 270

if (TEST) and !instance_exists(objDevTools) instance_create_depth(x, y, depth, objDevTools);

if (!layer_exists("Player"))
	layer = layer_create(-4, "Player");
else 
	layer = layer_get_id("Player");

global.playerCanMove = true;
up = 1;
down = 2;
left = 3;
right = 4;
face = down;
noEncounters = false;

targetX = x;
targetY = y;
onGrid = true;

walking = false;
running = false;
image_speed = 0;

if (!instance_exists(objCamera)) { instance_create_layer(x+16, y+16, layer, objCamera); }
if (!instance_exists(objMusic)) { instance_create_layer(x, y, layer, objMusic); }
if (!instance_exists(objController)) { instance_create_layer(x, y, layer, objController); }
if (!instance_exists(objPause)) { instance_create_layer(x, y, layer, objPause); }