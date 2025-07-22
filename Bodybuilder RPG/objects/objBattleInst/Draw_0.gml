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

    // everybody else in alphabetical order
    case "donnie swoleman":
        sprY = 7;
        break;
    case "smol powerlifter":
        sprY = 4;
        break;
    case "super heavyweight":
        sprY = 6;
        break;
    case "thicc powerlifter":
        sprY = 5;
        break;
    case "robber":
        sprY = 3;
        break;
    default:
        sprY = 0;
        break;
}

switch (state) {
    case "run":
        sprX = 0;
        image_speed = 0.5;
        break;
    case "run away":
        sprX = 0;
        image_speed = 0.5;
        face = "left";
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
    case "wait":
    default:
        sprX = 0;
        image_index = 0;
        image_speed = 0;
        break;    break;
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
if (showDamage && dmgToShow != -1) {
    fontXY(fa_center, fa_middle);
    draw_set_font(fTextbox);
    if (dmgY < dmgYFinal)
        dmgY += 4;
    drawTextOutline(x, y - dmgY, dmgToShow < 0 ? -dmgToShow : dmgToShow, c_white, dmgToShow < 0 ? #00b3ff : c_black);
}

// draw the battle instance
draw_sprite_part_ext(sprite_index, image_index, 0 + sprX * 32, sprY * 32, 32, 32 - deathY, face == "right" ? x - 32 : x + 32, y - 32, face == "right" ? 2 : -2, 2, image_blend, image_alpha);
if (state == "use item") {
    gpu_set_fog(true, #59dbff, 0, 1000);
    draw_sprite_part_ext(sprite_index, image_index, 0 + sprX * 32, sprY * 32, 32, 32 - deathY, face == "right" ? x - 32 : x + 32, y - 32, face == "right" ? 2 : -2, 2, image_blend, fogAlpha);
    gpu_set_fog(false, c_blue, 0, 1000);

}

if (dying)
    deathY += 0.75;