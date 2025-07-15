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
    case "samson":
        sprite_index = sprSamson;
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


if (ko) {
    // draw a ko'd andro when he gets beat up
    sprite_index = sprFighters;
    draw_sprite_part_ext(sprite_index, image_index, 96, 0 + (yPart * 32), 32, 32, x - 16, y - 21, image_xscale * 2, image_yscale * 2, image_blend, image_alpha);
}
else if (room == rSpace && spaceFog > 0) {
    // draw a white illumintation when spawning in the space world
    var newY = y - 21 - power(spaceFog * 2, 8);
    draw_sprite_part_ext(global.cutscene ? sprAndro : sprite_index, image_index, 0, 0 + (yPart * 32), 32, 32, x - 16, newY, image_xscale * 2, image_yscale * 2, image_blend, image_alpha);
    gpu_set_fog(true, c_white, 0, 1000);
    draw_sprite_part_ext(global.cutscene ? sprAndro : sprite_index, image_index, 0, 0 + (yPart * 32), 32, 32, x - 16, newY, image_xscale * 2, image_yscale * 2, image_blend, spaceFog);
    gpu_set_fog(false, c_blue, 0, 1000);
    spaceFog -= 0.01;
    // canMove = false;
}
else 
    draw_sprite_part_ext(global.cutscene ? sprAndro : sprite_index, image_index, 0, 0 + (yPart * 32), 32, 32, x - 16, y - 21, image_xscale * 2, image_yscale * 2, image_blend, image_alpha);
