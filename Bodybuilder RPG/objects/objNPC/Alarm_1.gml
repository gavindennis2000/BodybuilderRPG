// objNPC alarm1

// when an npc is given directions, move them around

if (TEST) { if (live_call()) {  // GMLive
    return live_result;
}}

if (xTo == x && yTo == y && array_length(directions) > 0) {
    var nextDirection = array_get(directions, 0);
    array_delete(directions, 0, 1);
    face = nextDirection;
    npcID = "ana";
    image_speed = 0.2;
    switch (nextDirection) {
        case "up":
            yTo -= 32;
            break;
        case "down":
            yTo += 32;
            break;
        case "left":
            xTo -= 32;
            break;
        case "right":
            xTo += 32;
            break;
    }
}
else if (xTo == x && yTo == y && array_length(directions) == 0) {
    // after the directions are followed, reset the animation and perform
    // the action if any
    image_speed = 0;
    image_index = 0;
    if (instance_exists(objPlayer)) {
        var pFace = objPlayer.face;
        switch (pFace) {
            case "up":
                face = "down";
                break;
            case "down":
                face = "up";
                break;
            case "left":
                face = "right";
                break;
            case "right":
                face = "left";
                break;
        }
    }
    if (action != -1) {
        if ( (is_array(action) && is_struct(action[0])) || is_struct(action) )
            textbox(action);
        else
            handleAction(action);
    }
        
    exit;
}

var directionAmount = 1;

if (x != xTo) {
    x += directionAmount * sign(xTo - x);
}
else if (y != yTo) {
    y += directionAmount * sign(yTo - y);
}

alarm_set(1, 1);