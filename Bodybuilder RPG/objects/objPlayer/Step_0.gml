/*gmlive*/ if (TEST) { if (live_call()) return live_result; }

var runSpeedAnimation = 0.2;
var runSpeed = 4
var canCertainlyMove = (canMove && targetX == 0 && targetY == 0);

// player movement
// player running faster
if (input_check("east") && canCertainlyMove) {
    runSpeed *= 2;
    runSpeedAnimation *= 2;
}

if (input_check("left")) {
    face = "left";
    image_speed = runSpeedAnimation;

    if (!place_meeting(x - 64, y, objWall) && canCertainlyMove) {
        targetX = -64;
    }
}

else if (input_check("right")) {
    face = "right";
    image_speed = runSpeedAnimation;

    if (!place_meeting(x + 64, y, objWall) && canCertainlyMove) {
        targetX = 64;
    }
}

else if (input_check("up")) {
    face = "up";
    image_speed = runSpeedAnimation;

    if (!place_meeting(x, y - 64, objWall) && canCertainlyMove) {
        targetY = -64;
    }
}

else if (input_check("down")) {
    face = "down";
    image_speed = runSpeedAnimation;

    if (!place_meeting(x, y + 64, objWall) && canCertainlyMove) {
        targetY = 64;
    }
}

if (targetX != 0 || targetY != 0) {
    // move the player to the next grid square 
    x += sign(targetX) * runSpeed;
    targetX -= sign(targetX) * runSpeed;; 
    y += sign(targetY) * runSpeed;; ;
    targetY -= sign(targetY) * runSpeed;; ; 
}