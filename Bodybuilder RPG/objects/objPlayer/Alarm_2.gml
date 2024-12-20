///@description Go to minigame
// go to room after action prompt

if (fadeAlpha < 0.5) {
	depth = -999;
	canMove = false;
	fadeAlpha += 0.1;
	alarm[2] = 2;
}
else {
    switch (action) {
        case "db bench":
            break;
        case "squat":
            instance_create_layer(x, y, layer, objGuitar);
            break;
    }
    instance_destroy();
}