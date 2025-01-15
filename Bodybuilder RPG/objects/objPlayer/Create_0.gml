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
workout = -1;

stand = "stand";
run = "run";
state = stand;
canMove = true;
cutscene = false;  // perma can't move during cutscenes

// movement
targetX = 0;
targetY = 0;

// fade room
fadeAlpha = 0;

// item stuff
global.bunnyHood = false;
global.bicycle = false;

// battle stuff
battleCounter = 0;

function checkBattle() {
    // increments battle encounter and randomly throws battle encounter
    
    if (global.noEncounters) { exit; }
        
    battleCounter++;
    if (battleCounter > 20) {
        var rand = irandom(20);
        if (rand == 5) {
            initiateBattle();
        }
    }
}