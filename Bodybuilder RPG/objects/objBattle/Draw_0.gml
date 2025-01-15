/*gmlive*/if (TEST) { if (live_call()) return live_result; }

var cam = view_camera[0];

if (room == rBattle) {
    var camX = camera_get_view_x(cam);
    var camY = camera_get_view_y(cam);

    // get the player's hair color
    var hairColor = getHairColor();

    // draw fog during ultimate attacks
    if (ultimateAlpha != 0) {
        var tempAlpha = draw_get_alpha();
        draw_set_alpha(ultimateAlpha);
        draw_rectangle_color(camX, camY, camX + 480, camY + 270, c_white, c_white, c_white, c_white, false);
        draw_set_alpha(tempAlpha);
        if (ultimateAlpha < 0.75) ultimateAlpha += 0.01;
    }

     // draw the enemy
     var scale = 2, dist = 75;
     var npcImg = enemy.npcImg, npcY = 0;
     while (npcImg >= 10) {
        npcImg -= 10;
        npcY += 40;
     }
     
    if (enemy.hp <= 0 && deadY != -1) {
        // draw the enemy fading
        draw_sprite_part_ext(enemy.spr, enemy.imgSpd, 32 * npcImg, npcY, 32, 40 - deadY, enemy.x, enemy.y - 8, scale, scale, c_black, 0.7);
        if (deadY < 40) {
            deadY++;
        }
    }
    else {
        // the enemy flashes white when using a skill
        if (eSkillAlpha < 1) {
            var oldFog = gpu_get_fog();
            gpu_set_fog(true, eSkillColor, 0, 0);   
            draw_sprite_part_ext(enemy.spr, enemy.imgSpd, 32*npcImg, npcY, 32, 40,  enemy.x, enemy.y - 8, scale, scale, c_white, 1);
            gpu_set_fog(oldFog[0], oldFog[1], oldFog[2], oldFog[3]);
        }
        // draw the enemy
        draw_sprite_part_ext(enemy.spr, enemy.imgSpd, 32*npcImg, npcY, 32, 40, enemy.x, enemy.y - 8, scale, scale, c_white, eSkillAlpha);
    }

    // draw enemy projectiles
    if (projectile.draw) {
        draw_sprite_part_ext(projectile.spr, projectile.imgIndex, projectile.sprNum*32, 0, 32, 32, projectile.x, projectile.y, scale, scale, c_white, 0.75);
        projectile.x -= 1.75*projectile.spd;
        projectile.y += projectile.spd;
    }

    // draw the player
    if (global.stats.fatigue >= 100 && deadY != -1) {
        // draw the player fading
        draw_sprite_part_ext(player.spr, player.imgSpd, 32*global.outfit.color, 0, 32, 32 - deadY, player.x, player.y, scale, scale, c_black, 0.7);
        // player's hair
        draw_sprite_part_ext(player.hair, player.imgSpd, 32*global.outfit.hair, 0, 32, 40 - deadY, player.x, player.y - 8, scale, scale, c_black, 0.7);
        if (deadY < 40) {
            deadY++;
        }
    }
    else {
        // the player flashes white when using a skill
        if (pSkillAlpha < 1) {
            var oldFog = gpu_get_fog();
            gpu_set_fog(true, pSkillColor, 0, 0);
            draw_sprite_part_ext(player.spr, player.imgSpd, 32*global.outfit.color, 0, 32, 32, player.x, player.y, scale, scale, c_white, 1);
            // draw the player's hair
            draw_sprite_part_ext(player.hair, player.imgSpd, 32*global.outfit.hair, 0, 32, 40, player.x, player.y - 8, scale, scale, hairColor, 1);
            // reset the fog
            gpu_set_fog(oldFog[0], oldFog[1], oldFog[2], oldFog[3]);
        }
        // draw the player
        draw_sprite_part_ext(player.spr, player.imgSpd, 32*global.outfit.color, 0, 32, 32, player.x, player.y, scale, scale, c_white, pSkillAlpha);
        // draw the player's hair
        draw_sprite_part_ext(player.hair, player.imgSpd, 32*global.outfit.hair, 0, 32, 40, player.x, player.y - 8, scale, scale, hairColor, pSkillAlpha + 0.5);
    }

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
        // draw the fatigue, ultimate, and enemy health bars

        // configure the animation of the bars
        var inc = 3;  // increment the length of the bar

        // draw the fatigue meter   
        var fColor;

        // get fatigue from global variable
        var fatigue = global.stats.fatigue;

        // configure fColor
        if (fatigue < 25) { fColor = c_white; }
        else if (fatigue < 50) { fColor = #ffcccc; }
        else if (fatigue < 75) { fColor = #ff9999; }
        else { fColor = #ff6666; }

        // give the bar some animation when it goes up and down
        if (drawFatigue != fatigue) {
            if (fatigue > drawFatigue) { 
                if (fatigue >= drawFatigue + inc)
                    drawFatigue += inc; 
                else 
                    drawFatigue = fatigue;
            }
            if (fatigue < drawFatigue) { 
                if (fatigue <= drawFatigue - inc)
                    drawFatigue -= inc; 
                else 
                    drawFatigue = fatigue;
            }
        }
        if (drawFatigue < 0) { drawFatigue = 0; }
        
        // draw the fatigue %
        if (string_length(string(fatigue)) < 2) { fatigue = string_concat("0", string(fatigue)); }
        fontX(fa_center); fontY(fa_bottom);
        draw_set_font(fontMenu);
        draw_text_border(camX + 410, camY + 210, string_concat("Fatigue: ", string(fatigue), "%"), fColor, 1);
        
        // draw the damn bar
        var barH = 10, barW = 100, barX = camX + 360, barY = camY + 218;
        draw_rectangle_color(barX, barY - barH/2, barX + barW, barY + barH/2, c_black, c_black, c_black, c_black, false);  // fatigue empty bar
        draw_rectangle_color(barX, barY - barH/2, barX + drawFatigue, barY + barH/2, c_red, fColor, fColor, c_red, false);  // actual fatigue bar
        draw_rectangle_color(barX, barY - barH/2, barX + barW, barY + barH/2, c_white, c_white, c_white, c_white, true);  // fatigue bar outline
        
        // ultimate

        // draw the ultimate meter   
        var uColor = c_red;

        // get ultimate from global variable
        var ultimate = global.stats.ultimate;

        // configure uColor
        if (ultimate < 25) { uColor = c_white; }
        else if (ultimate < 50) { uColor = #a677ba; }
        else if (ultimate < 75) { uColor = #8b6a99; }
        else { uColor = #6a5175; }

        // give the bar some animation when it goes up and down
        if (drawUltimate != ultimate) {
            if (ultimate > drawUltimate) { 
                if (ultimate >= drawUltimate + inc)
                    drawUltimate += inc; 
                else 
                    drawUltimate = ultimate;
            }
            else if (ultimate < drawUltimate) {
                if (ultimate <= drawUltimate - inc)
                    drawUltimate -= inc; 
                else 
                    drawUltimate = ultimate;
            }
        }
        if (drawUltimate < 0) { drawUltimate = 0; }
        
        // draw the ultimate %
        if (string_length(string(ultimate)) < 2) { ultimate = string_concat("0", string(ultimate)); }
        draw_text_border(camX + 410, camY + 247, string_concat("Ultimate: ", string(ultimate), "%"), uColor, 1);
        
        // draw the ultimate bar
        var barH = 10, barW = 100, barX = camX + 360, barY = camY + 255;
        draw_rectangle_color(barX, barY - barH/2, barX + barW, barY + barH/2, c_black, c_black, c_black, c_black, false);  // fatigue empty bar
        draw_rectangle_color(barX, barY - barH/2, barX + drawUltimate, barY + barH/2, c_yellow, #381747, uColor, c_yellow, false);  // actual fatigue bar
        draw_rectangle_color(barX, barY - barH/2, barX + barW, barY + barH/2, c_white, c_white, c_white, c_white, true);  // fatigue bar outline

        // enemy's health 
        var eColor;


        // configure eColor
        var eHealth = (enemy.hp / enemy.maxHp) * 100;
        if (eHealth < 25) { eColor = c_white; }
        else if (eHealth < 50) { eColor = #33ff33; }
        else if (eHealth < 75) { eColor = #00cc00; }
        else { eColor = #009900; }
            
        // draw the enemy's name
        draw_text_border(camX + 410, camY + 100, $"{enemy.name}", c_white, 1);
        
        // give the bar some animation when it goes up and down
        if (drawEHealth != eHealth) {
            if (eHealth > drawEHealth) { 
                if (eHealth >= drawEHealth + inc)
                    drawEHealth += inc; 
                else 
                    drawEHealth = eHealth;
            }
            else if (eHealth < drawEHealth) { 
                if (eHealth <= drawEHealth - inc)
                    drawEHealth -= inc; 
                else 
                    drawEHealth = eHealth;
            }
        }
        if (drawEHealth < 0) { drawEHealth = 0; }


        // draw the enemy healthbar
        var barH = 10, barW = 100, barX = camX + 360, barY = camY + 108;
        draw_rectangle_color(barX, barY - barH/2, barX + barW, barY + barH/2, c_black, c_black, c_black, c_black, false);  // fatigue empty bar
        draw_rectangle_color(barX, barY - barH/2, barX + drawEHealth, barY + barH/2, #66ff66, eColor, eColor, #006600, false);  // actual fatigue bar
        draw_rectangle_color(barX, barY - barH/2, barX + barW, barY + barH/2, c_white, c_white, c_white, c_white, true);  // fatigue bar outline
        
        // draw damage accrued for enemy and player
        if (enemyDamageY != -1) {  // enemy
            fontX(fa_center);
            fontY(fa_middle);
            draw_set_font(fontMenu);
            if (enemyDamageY < 10) enemyDamageY += 1;
            draw_text_border(enemy.x + 32, enemy.y - 16 - enemyDamageY, enemyDamage, c_white);
        }
        if (playerDamageY != -1) {  // player
            fontX(fa_center);
            fontY(fa_middle);
            draw_set_font(fontMenu);
            if (playerDamageY < 10) playerDamageY += 1;
            draw_text_border(player.x + 32, player.y - 16 - playerDamageY, playerDamage, c_white);
        }

        // player's turn
        if (turn == "player") {
            // draw the attack options if a textbox isn't there
            var menuColors = (global.stats.ultimate >= 100) ? [
                #00ffcc,
                #e6e6ff,
                #00ffcc,
                #000066
            ]
            : [
                #0066cc,
                #99ccff,
                #0066cc,
                #0033cc
            ];
            // don't draw the menu if there's a textbox on screen
            if (!instance_exists(objTextbox)) {
                // draw the attack menu
                if (menuX > 0) menuX -= 480/4;
                var white = c_white, margin = 5;
                var tempAlpha = draw_get_alpha();
                draw_set_alpha(0.8);
                // the blue menu rectangle
                draw_rectangle_color( 
                    camX + margin + menuX, camY + 190 + margin, 
                    camX + 360 - 20 + menuX, camY + 269 - margin,
                    menuColors[0], menuColors[1], menuColors[2], menuColors[3], false
                );
                // white outline
                draw_rectangle_color(
                    camX + margin + menuX, camY + 190 + margin, 
                    camX + 360 - 20 + menuX, camY + 269 - margin,
                    white, white, white, white, true
                );
                // go back to original screen drawing opacity
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
                            // max out when you have ultimate
                            if (global.stats.ultimate >= 100) {
                                draw_text_border(camX + 340*3/4 - xmargin, camY + 190 + 70*3/4 - ymargin, attacks[3].name, getColor(attacks[3]));
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
                        case "skill":
                            var skillLimit
                            if (array_length(skills) > 0 + sCursor) {
                                skillLimit = (skills[0 + sCursor].limit == -1) ? "" : string(skillLimit = skills[0 + sCursor].limit);
                                draw_text_border(camX + 340/4 + xmargin, camY + 190 + ymargin, string_concat(skills[0 + sCursor].name, skillLimit), getColor(skills[0 + sCursor]));
                            }
                            if (array_length(skills) > 1 + sCursor) {
                                skillLimit = (skills[1 + sCursor].limit == -1) ? "" : string(skillLimit = skills[1 + sCursor].limit);
                                draw_text_border(camX + 340*3/4 + xmargin, camY + 190 + ymargin, string_concat(skills[1 + sCursor].name, skillLimit), getColor(skills[1 + sCursor]));
                            }
                            if (array_length(skills) > 2 + sCursor) {
                                skillLimit = (skills[2 + sCursor].limit == -1) ? "" : string(skillLimit = skills[2 + sCursor].limit);
                                draw_text_border(camX + 340/4 + xmargin, camY + 190 + 70*3/4 - ymargin, string_concat(skills[2 + sCursor].name, skillLimit), getColor(skills[2 + sCursor]));
                            }
                            if (array_length(skills) > 3 + sCursor) {
                                skillLimit = (skills[3 + sCursor].limit == -1) ? "" : string(skillLimit = skills[3 + sCursor].limit);
                                draw_text_border(camX + 340*3/4 + xmargin, camY + 190 + 70*3/4 - ymargin, string_concat(skills[3 + sCursor].name, skillLimit), getColor(skills[3 + sCursor]));
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