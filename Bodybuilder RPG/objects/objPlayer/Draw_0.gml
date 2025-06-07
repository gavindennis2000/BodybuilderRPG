/*gmlive*/ if (TEST) { if (live_call()) return live_result; }

sprite_index = sprAndro;

// find which character the player is 
switch (global.character) {
    case "andro":
        sprite_index = sprAndro;
        break;
    case "ana":
        sprite_index = sprAna;
        break;
    case "doms":
        sprite_index = sprDoms;
        break;
}
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

// draw_sprite(sprWall, 0, x, y);
draw_sprite_part_ext(sprite_index, image_index, 0, 0 + (yPart * 32), 32, 32, x - 16, y - 21, image_xscale * 2, image_yscale * 2, image_blend, image_alpha);