/// @description initialize variables
if (!instance_exists(objController)) { instance_create_layer(x, y, layer, objController); }
test = true;
depth = -100;
left = "left";
right = "right";
up = "up";
down = "down";
upleft = "upleft";
upright = "upright";
downleft = "downleft";
downright = "downright";
face = down;
actionRoom = -1;

stand = "stand";
run = "run";
state = stand;
canMove = true;

// movement
targetX = 0;
targetY = 0;

// fade room
fadeAlpha = 0;

// item stuff
bunnyHood = true;
landGordan = false;