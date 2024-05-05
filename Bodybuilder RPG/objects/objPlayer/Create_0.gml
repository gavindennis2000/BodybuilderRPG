#macro TEST 1
#macro CAMHEIGHT 480
#macro CAMWIDTH 270

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

targetX = x;
targetY = y;
onGrid = true;

walking = false;
running = false;
image_speed = 0;

if (!instance_exists(objCamera)) { instance_create_layer(x, y, layer, objCamera); }