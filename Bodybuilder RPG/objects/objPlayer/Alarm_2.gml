/*gmlive*/if (TEST) { if (live_call()) return live_result; }
// go to room after action prompt

if (fadeAlpha < 0.6) {
	depth = -999;
	canMove = false;
	fadeAlpha += 0.1;
    image_alpha -= 0.2;
	alarm[2] = 2;
}
else {
    switch (action) {
        case "db bench":
            break;
        case "squat":
            global.workout = "novice leg";
            instance_create_layer(x, y, "Instances", objGuitar);
            break;
    }
}