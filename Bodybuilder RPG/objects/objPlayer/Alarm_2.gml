/*gmlive*/if (TEST) { if (live_call()) return live_result; }

// go to minigame after action prompt
if (fadeAlpha < 0.6) {
	depth = -198;
	canMove = false;
	fadeAlpha += 0.1;
    image_alpha -= 0.2;
	alarm[2] = 2;
}
else {
    depth = -100;
    switch (global.workout) {
        case "intermediate push":
        case "novice leg":
        case "advanced pull":
            instance_create_layer(x, y, "Instances", objGuitar);
            break;
        case "cardio":
            instance_create_layer(x, y, "Instances", objCardio);
            break;
    }
}