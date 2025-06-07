/*gmlive*/ if (TEST) { if (live_call()) return live_result; }

if (TEST) {
    // change character with the click of a button

    if (input_check_pressed("select")) {
        switch(global.character) {
            case "andro":
                global.character = "ana";
                break;
            case "ana":
                global.character = "doms";
                break;
            case "doms":
                global.character = "andro";
                break;
        }
    }
}

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
}

// set animation speed for player walking
image_speed = (keyAny || targetX != 0 || targetY != 0) ? runSpeedAnimation : 0;
image_index = (image_speed != 0) ? image_index : 0;

if (keyLeft) { 
    if (noTarget)
        face = "left";

    if (!place_meeting(x - 32, y, objWall) && canCertainlyMove) {
        targetX = -32;
    }
}

else if (keyRight) {
    if (noTarget)
        face = "right";

    if (!place_meeting(x + 32, y, objWall) && canCertainlyMove) {
        targetX = 32;
    }
}

else if (keyUp) {
    if (noTarget)
        face = "up";

    if (!place_meeting(x, y - 32, objWall) && canCertainlyMove) {
        targetY = -32;
    }
}

else if (keyDown) {
    if (noTarget)
        face = "down";

    if (!place_meeting(x, y + 32, objWall) && canCertainlyMove) {
        targetY = 32;
    }
}

if (targetX != 0 || targetY != 0) {
    // move the player to the next grid square 
    x += sign(targetX) * runSpeed;
    targetX -= sign(targetX) * runSpeed; 
    y += sign(targetY) * runSpeed;
    targetY -= sign(targetY) * runSpeed; 
}

if (targetX == 0 && targetY == 0) {
    runSpeed = originalRunSpeed;
    runSpeedAnimation = originalRunSpeedAnimation;
}