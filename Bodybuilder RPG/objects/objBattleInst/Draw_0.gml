// objBattleInst draw

/*gmlive*/ if (TEST) { if (live_call()) return live_result; }

switch (battleID) {
    case "andro":
        sprite_index = sprAndro;
        break;
    case "ana":
        sprite_index = sprAna;
        break;
    case "doms":
        sprite_index = sprDoms;
        break;
    default:
        sprite_index = sprNPC;   
        break;
}

switch (state) {
    case "wait":
        image_index = 0;
        image_speed = 0;
        break;
    case "run":
        image_speed = 0.5;
        break;
}

var dir = 0;
switch (face) {
    case "left":
        dir = 96;
        break;
    case "right":
        dir = 64;
        break;
}
draw_sprite_part_ext(sprite_index, image_index, 0, dir, 32, 32, x - 32, y - 32, 2, 2, image_blend, image_alpha);