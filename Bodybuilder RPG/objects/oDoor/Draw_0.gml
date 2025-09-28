// door draw
// get's the right door and draws it
/*gmlive*/ if (TEST) { if (live_call()) return live_result; }

// get the right image index based on whether door is being opened or not
if (!opened) {
    image_index = 0;
    image_speed = 0.5;
}
else if (image_index >= image_number - 1)
    image_speed = 0;
else 
    image_speed = 1;

// determine the sprite based on the door type
var sprY;
var drawX = x;
var xscale = image_xscale;
switch (doorType) {
    case "upstairs":
        sprY = 2;
        image_index = 0;
        break;
    case "downstairs":
        sprY = 1;
        image_index = 0;
        break;
    case "gym left":
        sprY = 3;
        image_index = 0;
        if (opened && abs(moveX < 32))
            moveX -= xscale * 4;
            with (oDoor)
                if (doorType == "gym right")
                    moveX -= xscale * 4;
        break;
    case "gym right":
        sprY = 3;
        xscale = -1;
        drawX += 32;
        image_index = 0;
        if (opened && abs(moveX < 32)) {
            moveX -= xscale * 4;
            with (oDoor)
                if (doorType == "gym left")
                    moveX -= xscale * 4;
        }
        break;
    default:
        sprY = 0;
}
draw_sprite_part_ext(sprDoor, image_index, 0, 0 + sprY * 32, 32, 32, drawX + moveX, y, xscale, image_yscale, image_blend, image_alpha);

if (TEST && global.showDetails) {
    var doorID_Parts = string_split(doorID, " ");
    var newStr = array_last(doorID_Parts);
    draw_text(x, y, newStr);
}