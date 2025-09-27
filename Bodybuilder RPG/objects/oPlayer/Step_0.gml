/*gmlive*/ if (TEST) { if (live_call()) return live_result; }

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
}

if (keyLeft) { 
    if (noTarget && canMove)
        face = "left";

    if (!place_meeting(x - 32, y, oWall) && canCertainlyMove) {
        targetX = -32;
    }
}

else if (keyRight) {
    if (noTarget && canMove)
        face = "right";

    if (!place_meeting(x + 32, y, oWall) && canCertainlyMove) {
        targetX = 32;
    }
}

else if (keyUp) {
    if (noTarget && canMove)
        face = "up";

    if (!place_meeting(x, y - 32, oWall) && canCertainlyMove) {
        targetY = -32;
    }
}

else if (keyDown && canMove) {
    if (noTarget)
        face = "down";

    if (!place_meeting(x, y + 32, oWall) && canCertainlyMove) {
        targetY = 32;
    }
}

if (keyAny || targetX != 0 || targetY != 0) {
    runCounter += (keyRun) ? 3 : 2;
    if (runCounter >= 64)
        runCounter = 0;
}
else
    runCounter = 0;

if (targetX != 0 || targetY != 0) {
    // move the player to the next grid square 
    x += sign(targetX) * runSpeed;
    targetX -= sign(targetX) * runSpeed; 
    y += sign(targetY) * runSpeed;
    targetY -= sign(targetY) * runSpeed; 
}

if (targetX == 0 && targetY == 0) {
    runSpeed = originalRunSpeed;
}