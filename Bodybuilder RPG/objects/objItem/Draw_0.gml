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

switch (itemID) {
    case "atlas stone":
        index = 5;
        sprY -= 2;
        break;
    case "bbnc owner":
        index = -1;
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
    case "sign":
        index = 4;
        sprY -= 3;
        break;
    default:
        spr = sprItemPlaceholder;
        break;
}

if (index == -1)
    exit;

draw_sprite_ext(spr, index, sprX, sprY, xscale, yscale, image_angle, image_blend, image_alpha);

// if the associated item has a function, do it
if (func != -1 && is_method(func)) {
    func();
}

// draw the item id for easier debugging
if (TEST && spr == sprItemPlaceholder) {
    fontXY(fa_center, fa_middle);
    drawTextOutline(x, y, id, c_white, c_black, 0.4);
}