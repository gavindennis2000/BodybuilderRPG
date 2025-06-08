// objCamera room start

if (TEST) { if (live_call()) {  // GMLive
    return live_result;
}}

if (target == objPlayer) {
    // adjust the room view
    x = objPlayer.x; 
    y = objPlayer.y;

    while (x % CAM_WIDTH != 0)
        x--; 
    while (y % CAM_HEIGHT != 0)
        y--;

    xTo = x;
    yTo = y;
}