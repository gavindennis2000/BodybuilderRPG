/*gmlive*/ if (TEST) { if (live_call()) return live_result; }

// change character with the click of a button
var playable = [];
array_copy(playable, 0, global.party, 0, array_length(global.party));
if (array_length(playable) > 1 && input_check_pressed("north")) {
    for (var i = 0; i < array_length(global.party); i++) {
        if (global.character == global.party[i] && i + 1 < array_length(global.party)) {
            global.character = global.party[i + 1];
            exit;
        }
        else if (global.character == global.party[i] && i + 1 >= array_length(global.party)) {
            global.character = global.party[0];
            exit;
        }
    }
}

canCertainlyMove = (canMove && targetX == 0 && targetY == 0);

var keyLeft = input_check("left");
var keyRight = input_check("right");
var keyUp = input_check("up");
var keyDown = input_check("down");
var keyAny = (keyLeft || keyRight || keyUp || keyDown);

var keyRun = input_check("east");
var keyAction = input_check_pressed("south");

var noTarget = (targetX == 0 && targetY == 0);

// player movement

// run when holding 'b'
if (keyRun && canCertainlyMove) {
    runSpeed = originalRunSpeed * 2;
    runSpeedAnimation = originalRunSpeedAnimation * 1.5;
}

// set animation speed for player walking
image_speed = (canMove && (keyAny || targetX != 0 || targetY != 0)) ? runSpeedAnimation : 0;
image_index = (image_speed != 0) ? image_index : 0;

if (keyLeft) { 
    if (noTarget && canMove)
        face = "left";

    if (!place_meeting(x - 32, y, objWall) && canCertainlyMove) {
        targetX = -32;
    }
}

else if (keyRight) {
    if (noTarget && canMove)
        face = "right";

    if (!place_meeting(x + 32, y, objWall) && canCertainlyMove) {
        targetX = 32;
    }
}

else if (keyUp) {
    if (noTarget && canMove)
        face = "up";

    if (!place_meeting(x, y - 32, objWall) && canCertainlyMove) {
        targetY = -32;
    }
}

else if (keyDown && canMove) {
    if (noTarget)
        face = "down";

    if (!place_meeting(x, y + 32, objWall) && canCertainlyMove) {
        targetY = 32;
    }
}

if (targetX != 0 || targetY != 0) {
    // move the player to the next grid square 
    // if (TEST) 
        // runSpeed *= 2;
    x += sign(targetX) * runSpeed;
    targetX -= sign(targetX) * runSpeed; 
    y += sign(targetY) * runSpeed;
    targetY -= sign(targetY) * runSpeed; 
    // if (TEST)
        // runSpeed /= 2;
}

if (targetX == 0 && targetY == 0) {
    runSpeed = originalRunSpeed;
    runSpeedAnimation = originalRunSpeedAnimation;

    var door = instance_place(x, y, objDoor);
    if (door != noone) {
        canMove = false;
        with (door) {
            if (!opened)
                opened = true;
        }
    }
}