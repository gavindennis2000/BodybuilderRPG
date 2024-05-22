camWidth = 480;
camHeight = 270;
cam = view_camera[0];
camX = camera_get_view_x(cam);
camY = camera_get_view_y(cam);
camW = camera_get_view_width(cam);
camH = camera_get_view_height(cam);

if (instance_exists(objPlayer)) { follow = objPlayer; }
else { follow = noone; }

xTo = x;
yTo = y;

// battle initiation variables
initBattle = false;
whiteAlpha = 0;
inc = 0;
aTime = 60;
whiteOut = false;

layer = (layer_exists(layer_get_id("camera"))) ? layer_get_id("camera") : layer_create(-1000, "camera");

function initiateBattle(enemies = ["npc"], music = sndBattle) {
	// spin the camera, play the music, and go to the battle room
	global.playerCanMove = false;
	initBattle = true;
	if (instance_exists(objMusic)) { objMusic.initiateBattle(); }
	whiteAlpha = 0;
	alarm[0] = aTime;
	inc = 0;
	follow = noone;
}