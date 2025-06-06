/*gmlive*/ if (TEST) { if (live_call()) return live_result; }

sprite_index = sprAndro;

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

// draw_sprite(sprWall, 0, x, y);
draw_sprite_part_ext(sprite_index, image_index, 0, 0 + (yPart * 32), 32, 32, x - 32, y - 42, image_xscale * 4, image_yscale * 4, image_blend, image_alpha);