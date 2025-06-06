/*gmlive*/ if (TEST) { if (live_call()) return live_result; }

var canCertainlyMove = (canMove && targetX == 0 && targetY == 0);

var keyLeft = input_check("left");
var keyRight = input_check("right");
var keyUp = input_check("up");
var keyDown = input_check("down");
var keyAny = (keyLeft || keyRight || keyUp || keyDown);

var keyEast = input_check("east");

var noTarget = (targetX == 0 && targetY == 0);

// player movement

// run when holding 'b'
if (keyEast && canCertainlyMove) {
    runSpeed = originalRunSpeed * 2;
    runSpeedAnimation = originalRunSpeedAnimation * 1.5;
    show_debug_message("running");
}

// set animation speed for player walking
image_speed = (keyAny || targetX != 0 || targetY != 0) ? runSpeedAnimation : 0;
image_index = (image_speed != 0) ? image_index : 0;

if (keyLeft) { 
    if (noTarget)
        face = "left";

    if (!place_meeting(x - 64, y, objWall) && canCertainlyMove) {
        targetX = -64;
    }
}

else if (keyRight) {
    if (noTarget)
        face = "right";

    if (!place_meeting(x + 64, y, objWall) && canCertainlyMove) {
        targetX = 64;
    }
}

else if (keyUp) {
    if (noTarget)
        face = "up";

    if (!place_meeting(x, y - 64, objWall) && canCertainlyMove) {
        targetY = -64;
    }
}

else if (keyDown) {
    if (noTarget)
        face = "down";

    if (!place_meeting(x, y + 64, objWall) && canCertainlyMove) {
        targetY = 64;
    }
}

if (targetX != 0 || targetY != 0) {
    // move the player to the next grid square 
    x += sign(targetX) * runSpeed;
    targetX -= sign(targetX) * runSpeed; 
    y += sign(targetY) * runSpeed;
    targetY -= sign(targetY) * runSpeed; 

    if (targetX == 0 && targetY == 0) {
        runSpeed = originalRunSpeed;
        runSpeedAnimation = originalRunSpeedAnimation
    }
}