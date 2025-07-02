// objBattleInst draw

/*gmlive*/ if (TEST) { if (live_call()) return live_result; }

var sprX = 0;
var sprY = 0;
image_alpha = 1;
sprite_index = sprFighters;

switch (battleID) {
    case "andro":
        sprY = 0;
        break;
    case "ana":
        sprY = 1;
        break;
    case "doms":
        sprY = 2;
        break;
    case "robber":
        sprY = 3;
        break;
    default:
        sprY = 0;
        break;
}

switch (state) {
    case "wait":
        sprX = 0;
        image_index = 0;
        image_speed = 0;
        break;
    case "run":
        sprX = 0;
        image_speed = 0.5;
        break;
    case "attack":
        sprX = 1;
        image_speed = 0.35;
        break;
    case "jump":
        sprX = 0;
        image_index = 1;
        image_speed = 0;
        break;
    case "ko":
        sprX = 3;
        image_index = 0;
        image_speed = 0;
        break;
    case "attacked":
        sprX = 2;
        image_index = 0;
        image_speed = 0;
        image_alpha = 0.75;
        break;
    case "victory":
        sprX = 4;
        image_speed = 0.12;
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

// draw the damage received
if (showDamage) {
    fontXY(fa_center, fa_middle);
    draw_set_font(fTextbox);
    if (dmgY < dmgYFinal)
        dmgY += 4;
    drawTextOutline(x, y - dmgY, dmgToShow);
}

// draw the battle instance
draw_sprite_part_ext(sprite_index, image_index, 0 + sprX * 32, sprY * 32, 32, 32 - deathY, side == "party" ? x - 32 : x + 32, y - 32, side == "party" ? 2 : -2, 2, image_blend, image_alpha);

if (dying)
    deathY += 0.75;