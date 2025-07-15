// objItem draw

/*gmlive*/ if (TEST) { if (live_call()) return live_result; }

// variables for drawing attributes
var spr = sprItems;
var index = 0;
var sprX = x;
var sprY = y;
var xscale = image_xscale;
var yscale = image_yscale;
var func = -1;

var floatFunc = function() {
    // makes the item look like it's levitating
    if (!variable_instance_exists(self, "float") || !variable_instance_exists(self, "floatChange"))
        exit;
    float += floatChange / 1.5;
    floatChange /= 1.01;
    var amount = 3;
    if ((float >= amount && sign(floatChange) == 1) || (float <= -amount && sign(floatChange) == -1)) {
        floatChange = 0.25 * sign(floatChange);
        floatChange = -floatChange;
    }
}

switch (itemID) {
    case "atlas stone":
        index = 5;
        sprY -= 2;
        break;
    case "bbnc owner":
        index = -1;
        break;
    case "golden drumstick":
        index = 7;
        func = floatFunc;
        draw_sprite_ext(spr, index, x, y + 32, 1, 0.3, 0, c_black, 1);
        break;
    case "gymtendo 64":
        index = 1;
        sprY += 10;
        break;
    case "home bed":
        index = 0;
        sprY -= 2;
        break;
    case "home bench press":
        index = 3;
        sprY -= 0;
        break;
    case "mirror":
        sprY += 1;
        index = 2;
        func = function() {
            // draw the player in the mirror
            if (instance_exists(objPlayer)) {
                // get the right character
                var playerSpr = sprAndro;
                var playerY = 0;

                if (global.character == "ana")
                    playerSpr = sprAna;
                else if (global.character == "doms")
                    playerSpr = sprDoms;
                // get the right direction
                var face = objPlayer.face;
                switch (face) {
                    case "down":
                        playerY = 1;
                        break;
                    case "up":
                        playerY = 0;
                        break;
                    case "right":
                        playerY = 2;
                        break;
                    case "left":
                        playerY = 3;
                        break;
                }
                playerDistX = abs(objPlayer.x - x);
                playerDistY = objPlayer.y - y - 32;
                if (playerDistX < 32 && playerDistX > -32 && playerDistY < 32) {
                    var left = 10;
                    left = (playerDistX / 4 <= 8) ? left - playerDistX / 4 : left - 8;
                    var top = playerY * 32 + 8
                    top = (playerDistY / 4 <= 8) ? top - playerDistY / 4 : top - 8;
                    var width = 12 - playerDistX / 2;
                    var height = 11 - playerDistY / 2;
                    var drawX = objPlayer.x + 4
                    var drawY = objPlayer.y - 27;
                    draw_sprite_part_ext(playerSpr, objPlayer.image_index, left, top, width, height, drawX, drawY, 2, 2, objPlayer.image_blend, objPlayer.image_alpha * 0.675);
                }
            }
        }
        break;
    case "nectar of the gods":
        index = 6;
        func = floatFunc;
        sprY -= 10;
        draw_sprite_ext(spr, index, x, y + 32, 1, 0.2, 0, c_black, 1);
        break;
    case "sign":
        index = 4;
        sprY -= 3;
        break;
    case "trapezius of power":
        index = 8;
        func = floatFunc;
        draw_sprite_ext(spr, index, x, y + 32, 1, 0.35, 0, c_black, 1);
        break;
    default:
        spr = sprItemPlaceholder;
        break;
}

if (index == -1)
    exit;

if (chestID != -1 && opened)
    image_blend = c_green;

draw_sprite_ext(spr, index, sprX, sprY + float, xscale, yscale, image_angle, image_blend, image_alpha);

// if the associated item has a function, do it
if (func != -1 && is_method(func)) {
    func();
}

// draw the item id for easier debugging
if (TEST && spr == sprItemPlaceholder) {
    fontXY(fa_center, fa_middle);
    // drawTextOutline(x, y, id, c_white, c_black, 0.4);
}