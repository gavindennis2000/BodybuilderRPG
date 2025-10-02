/*gmlive*/ if (TEST) { if (live_call()) return live_result; }

// get the right npc for the job
switch (npcID) {
    case "jim":
        image_index = 2;
        break;
    default:
        image_index = 0;
        break;
}

var yPart;
switch (face) {
    case "up":
        yPart = 1;
        break;
    case "right":
        yPart = 2;
        break;
    case "left":
        yPart = 3;
        break;
    case "down":
    default:
        yPart = 0;
        break;
}

// draw the guy
depth = (instance_exists(oPlayer) && oPlayer.y < y) ? oPlayer.depth - 1 : layer_get_depth(layer_get_id("Instances"));
draw_sprite_part_ext(sprite_index, image_index, 0, 0 + (yPart * 32), 32, 32, x - 16, y - 21, image_xscale * 2, image_yscale * 2, image_blend, image_alpha);