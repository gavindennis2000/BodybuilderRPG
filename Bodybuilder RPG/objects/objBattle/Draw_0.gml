/*gmlive*/if (TEST) { if (live_call()) return live_result; }

var cam = view_camera[0];

if (room == rBattle) {
    var camX = camera_get_view_x(cam);
    var camY = camera_get_view_y(cam);

     // draw the enemy
     var scale = 2, dist = 75;
     draw_sprite_ext(enemy.spr, enemy.imgSpd, enemy.x, enemy.y, scale, scale, 0, c_white, 1);

    // draw the player
    draw_sprite_ext(player.spr, player.imgSpd, player.x, player.y, scale, scale, 0, c_white, 1);
    // draw_text(player.x, player.y - 32, string_concat("playerX: ", player.x, " playerY: ", player.y));
    
    // move the players
    if (turn == "escape") {
        player.x -= 10;
    }
    else if (player.x > pStart - dist  && !ready) {
        player.x -= 2; 
        enemy.x += 2;
    }
    else if (!ready) {
        ready = true; 
        pFinalX = player.x;
        pFinalY = player.y; 

        // announce the enemy
        var enterStr = string_concat("A ", enemy.name, " has attacked!");
        instance_create_layer(x, y, layer, objTextbox, {
            text: [enterStr],
            npcID: ""  
        })
        // load the menu to the right side of the screen
        menuX = 480;
    }
    else {
        // draw the fatigue meter   
        var fX = 50, fY = 50, fColor = c_red;

        // get fatigue from global variable
        var fatigue = global.stats.fatigue;

        // configure fColor
        if (fatigue < 25) { fColor = c_white; }
        else if (fatigue < 50) { fColor = #ffcccc; }
        else if (fatigue < 75) { fColor = #ff9999; }
        else { fColor = #ff6666; }
        
        if (string_length(string(fatigue)) < 2) { fatigue = string_concat("0", string(fatigue)); }
        fontX(fa_center); fontY(fa_bottom);
        draw_set_font(fontMenu);
        draw_text_border(camX + 410, camY + 240, string_concat("Fatigue: ", string(fatigue), "%"), fColor, 1);  // name

        // draw the damn bar
        var barH = 10, barW = 100, barX = camX + 360, barY = camY + 270 - 20;
        draw_rectangle_color(barX, barY - barH/2, barX + barW, barY + barH/2, c_black, c_black, c_black, c_black, false);  // fatigue empty bar
        draw_rectangle_color(barX, barY - barH/2, barX + fatigue, barY + barH/2, c_red, fColor, fColor, c_red, false);  // actual fatigue bar
        draw_rectangle_color(barX, barY - barH/2, barX + barW, barY + barH/2, c_white, c_white, c_white, c_white, true);  // fatigue bar outline

        // player's turn
        if (turn == "player") {
            // draw the attack options if a textbox isn't there
            if (!instance_exists(objTextbox)) {
                // draw the attack menu
                if (menuX > 0) menuX -= 480/4;
                var blue = #0066cc, white = c_white, margin = 5;
                var tempAlpha = draw_get_alpha();
                draw_set_alpha(0.8);
                draw_rectangle_color( 
                    camX + margin + menuX, camY + 190 + margin, 
                    camX + 360 - 20 + menuX, camY + 269 - margin,
                    blue, #99ccff, blue, #0033cc, false
                );
                draw_rectangle_color(  // outline
                    camX + margin + menuX, camY + 190 + margin, 
                    camX + 360 - 20 + menuX, camY + 269 - margin,
                    white, white, white, white, true
                );
                draw_set_alpha(tempAlpha);

                // play the menu ready sound effect
                if (menuX == 480*1/4) { playSound(sndBattleReady); }

                // draw the options
                else if (menuX == 0) {
                    // draw the options
                    var xmargin = 10, ymargin = 13;
                    fontX(fa_center); fontY(fa_top);
                    switch (screen) {
                        case "menu":
                            draw_text_border(camX + 340/4 + xmargin, camY + 190 + ymargin, "Attack", getColor("attack"));
                            draw_text_border(camX + 340*3/4 - xmargin, camY + 190 + ymargin, "Skill", getColor("skill"));
                            draw_text_border(camX + 340/4 + xmargin, camY + 190 + 70*3/4 - ymargin, "Item", getColor("item"));
                            draw_text_border(camX + 340*3/4 - xmargin, camY + 190 + 70*3/4 - ymargin, "Escape", getColor("escape"));
                            break;
                        case "escape":
                            fontX(fa_center);
                            draw_text_border(camX + 340/2 + xmargin/2, camY + 190 + ymargin, "Run away? (+1 cardio)", c_white);
                            draw_text_border(camX + 340/2 + xmargin/2 - 50, camY + 190+ 70*3/4 - ymargin, "Yes", getColor("yes"));
                            draw_text_border(camX + 340/2 + xmargin/2 + 50, camY + 190+ 70*3/4 - ymargin, "No", getColor("no"));
                            break;
                        case "attack":
                            draw_text_border(camX + 340/4 + xmargin, camY + 190 + ymargin, attacks[0].name, getColor(attacks[0]));
                            draw_text_border(camX + 340*3/4 - xmargin, camY + 190 + ymargin, attacks[1].name, getColor(attacks[1]));
                            draw_text_border(camX + 340/4 + xmargin, camY + 190 + 70*3/4 - ymargin, attacks[2].name, getColor(attacks[2]));
                            // draw the description
                            var tempAlpha = draw_get_alpha();
                            draw_set_alpha(0.8);
                            draw_rectangle_color(camX, camY, camX + 480, camY + 15, c_black, c_black, c_black, c_black, false);
                            draw_set_alpha(tempAlpha);
                            fontX(fa_center); fontY(fa_top);
                            draw_set_font(fontName);
                            draw_text_border(camX + 240, camY + 0, selection.description, c_white);
                            break;
                        case "skill":
                            var skillLimit
                            if (array_length(skills) > 0 + sCursor) {
                                skillLimit = (skills[0 + sCursor].limitMax == -1) ? "" : string(skillLimit = skills[0 + sCursor].limitMax);
                                draw_text_border(camX + 340/4 + xmargin, camY + 190 + ymargin, string_concat(skills[0 + sCursor].name, skillLimit), getColor(skills[0 + sCursor]));
                            }
                            if (array_length(skills) > 1 + sCursor) {
                                skillLimit = (skills[1 + sCursor].limitMax == -1) ? "" : string(skillLimit = skills[1 + sCursor].limitMax);
                                draw_text_border(camX + 340/4 + xmargin, camY + 190 + ymargin, string_concat(skills[1 + sCursor].name, skillLimit), getColor(skills[1 + sCursor]));
                            }
                            if (array_length(skills) > 2 + sCursor) {
                                skillLimit = (skills[2 + sCursor].limitMax == -1) ? "" : string(skillLimit = skills[2 + sCursor].limitMax);
                                draw_text_border(camX + 340/4 + xmargin, camY + 190 + ymargin, string_concat(skills[2 + sCursor].name, skillLimit), getColor(skills[2 + sCursor]));
                            }
                            if (array_length(skills) > 3 + sCursor) {
                                skillLimit = (skills[3 + sCursor].limitMax == -1) ? "" : string(skillLimit = skills[3 + sCursor].limitMax);
                                draw_text_border(camX + 340/4 + xmargin, camY + 190 + ymargin, string_concat(skills[3 + sCursor].name, skillLimit), getColor(skills[3 + sCursor]));
                            }
                            // draw the description
                            var tempAlpha = draw_get_alpha();
                            draw_set_alpha(0.8);
                            draw_rectangle_color(camX, camY, camX + 480, camY + 15, c_black, c_black, c_black, c_black, false);
                            draw_set_alpha(tempAlpha);
                            fontX(fa_center); fontY(fa_top);
                            draw_set_font(fontName);
                            draw_text_border(camX + 240, camY + 0, selection.description, c_white);
                            break;
                        case "item":
                            if (array_length(inventory) > 0 + sCursor)
                                draw_text_border(camX + 340/4 + xmargin, camY + 190 + ymargin, string_concat(inventory[0 + sCursor].name, " ", inventory[0 + sCursor].quantity), getColor(inventory[0 + sCursor]));
                            if (array_length(inventory) > 1 + sCursor)
                            draw_text_border(camX + 340*3/4 - xmargin, camY + 190 + ymargin, string_concat(inventory[1 + sCursor].name, " ", inventory[1 + sCursor].quantity), getColor(inventory[1 + sCursor]));
                            if (array_length(inventory) > 2 + sCursor)
                                draw_text_border(camX + 340/4 + xmargin, camY + 190 + 70*3/4 - ymargin, string_concat(inventory[2 + sCursor].name, " ", inventory[2 + sCursor].quantity), getColor(inventory[2 + sCursor]));
                            if (array_length(inventory) > 3 + sCursor)
                                draw_text_border(camX + 340*3/4 - xmargin, camY + 190 + 70*3/4 - ymargin, string_concat(inventory[3 + sCursor].name, " ", inventory[3 + sCursor].quantity), getColor(inventory[3 + sCursor]));
                            // draw the description
                            var tempAlpha = draw_get_alpha();
                            draw_set_alpha(0.8);
                            draw_rectangle_color(camX, camY, camX + 480, camY + 15, c_black, c_black, c_black, c_black, false);
                            draw_set_alpha(tempAlpha);
                            fontX(fa_center); fontY(fa_top);
                            draw_set_font(fontName);
                            draw_text_border(camX + 240, camY + 0, selection.description, c_white);
                            break;
                    }
                }
            }
        }
    }
}

// fade the screen white
if (fadeWhite != -1) {
    // camera rotation and zoom
    if (room != rBattle) {
        fadeWhite += 0.02;
        
        whiteIncrease += 0.28;
        camAngle += whiteIncrease;
        camera_set_view_size(cam, camera_get_view_width(cam)-2, camera_get_view_height(cam)-2);
        camera_set_view_angle(cam, camAngle);
        
        if (fadeWhite >= 1) {
           if (room != rBattle) { room_goto(rBattle); }
        }
    }
    else {
        fadeWhite -= 0.02;
        if (fadeWhite <= 0) { fadeWhite = -1; }
    }
    
    // camera fade white
    var w = c_white; 
    var tempAlpha = draw_get_alpha();
    draw_set_alpha(fadeWhite);
    
    var camX = camera_get_view_x(cam);
    var camY = camera_get_view_y(cam);
    
    var camW = camera_get_view_width(cam);
    var camH = camera_get_view_height(cam);
    
    var margin = 150;
    draw_rectangle_color(camX - margin, camY - margin, camX + camW + margin, camY + camH + margin, w, w, w, w, false);
    draw_set_alpha(tempAlpha); 
}
else if (fadeBlack != -1) {
    var camX = camera_get_view_x(cam);
    var camY = camera_get_view_y(cam);
    var tempAlpha = draw_get_alpha();

    draw_set_alpha(fadeBlack);
    draw_rectangle_color(camX, camY, camX + 480, camY + 270, c_black, c_black, c_black, c_black, false);
    draw_set_alpha(tempAlpha);
}