// objDoor draw

/*gmlive*/ if (TEST) { if (live_call()) return live_result; }

var doorIndex = 0;

switch (doorID) {
    case "upstairs":
        doorIndex = 1;
        break;
    case "downstairs":
        doorIndex = 2;
        break;
    case "door":
    default:
        break;
}

draw_sprite_part(sprite_index, image_index, 0, 0 + doorIndex * 32, 32, 32, x, y);