/*gmlive*/ if (TEST) { if (live_call()) return live_result; }

sprite_index = sprAndro;

// find which way the player is facing
var yPart = 0;
switch (face) {
    case "down":
        yPart = 0;
        break;
    case "up":
        yPart = 1;
        break;
    case "right":
        yPart = 2;
        break;
    case "left":
        yPart = 3;
        break;
}


// get the image index
if (runCounter > 0 && runCounter <= 16)
    image_index = 1;
else if (runCounter <= 32)
    image_index = 2;
else if (runCounter <= 48)
    image_index = 3;
else
    image_index = 0;
if (instance_exists(oTextbox))
    image_index = 0;

// draw the player
draw_sprite_part_ext(sprite_index, image_index, 0, 0 + (yPart * 32), 32, 32, x - 16, y - 21, image_xscale * 2, image_yscale * 2, image_blend, image_alpha);