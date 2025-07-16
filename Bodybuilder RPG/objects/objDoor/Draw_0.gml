// objDoor draw

/*gmlive*/ if (TEST) { if (live_call()) return live_result; }

var doorIndex = 0;
var xscale = 1;
switch (doorID) {
    case "upstairs":
        doorIndex = 1;
        image_index = 0;
        break;
    case "downstairs":
        doorIndex = 2;
        image_index = 0;
        break;
    case "gym left":
        doorIndex = 3;
        image_index = 0;
        break;
    case "gym right":
        doorIndex = 3;
        xscale = -1;
        image_index = 0;
        break;
    case "door":
    default:
        break;
}

draw_sprite_part_ext(sprDoor, image_index, 0, 0 + doorIndex * 32, 32, 32, xscale == 1 ? x - drawX : x + 32 + drawX, y, xscale, image_yscale, image_blend, image_alpha);