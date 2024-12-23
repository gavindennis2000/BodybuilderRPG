/*gmlive*/if (TEST) { if (live_call()) return live_result; }

var cam = view_camera[0];

if (room == rBattle) {
    var camX = camera_get_view_x(cam);
    var camY = camera_get_view_y(cam);

    // draw the player
    var scale = 2, dist = 75;
    draw_sprite_ext(player.spr, 0, player.x, player.y, scale, scale, 0, c_white, 1);
    
    // draw the enemy
    draw_sprite_ext(enemy.spr, 0, enemy.x, enemy.y, scale, scale, 0, c_white, 1);
    
    // move the players
    if (player.x > pStart - dist) {
        player.x -= 2; 
        enemy.x += 2;
    }
    else if (!ready) {
        ready = true; 
        var enterStr = string_concat("A ", enemy.name, " has attacked!");
        instance_create_layer(x, y, layer, objTextbox, {
            text: [enterStr],
            npcID: ""  
        })
        menuX = 480;
    }
    else {
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

            // draw the options and fatigue meter
            if (menuX == 0) {

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
                draw_text_border(camX + 410, camY + 240, string_concat("Fatigue: ", string(fatigue), "%"), fColor, 1);  // name

                // draw the damn bar
                var barH = 10, barW = 100, barX = camX + 360, barY = camY + 270 - 20;
                draw_rectangle_color(barX, barY - barH/2, barX + barW, barY + barH/2, c_black, c_black, c_black, c_black, false);  // fatigue empty bar
                draw_rectangle_color(barX, barY - barH/2, barX + fatigue, barY + barH/2, c_red, fColor, fColor, c_red, false);  // actual fatigue bar
                draw_rectangle_color(barX, barY - barH/2, barX + barW, barY + barH/2, c_white, c_white, c_white, c_white, true);  // fatigue bar outline

                // draw the options
                var xmargin = 10, ymargin = 13;
                fontX(fa_center); fontY(fa_top);
                switch (screen) {
                    case "menu":
                        draw_text_border(camX + 340/4 + xmargin, camY + 190 + ymargin, "Movement", getColor("movement"));
                        draw_text_border(camX + 340*3/4 - xmargin, camY + 190 + ymargin, "Flex Muscles", getColor("flex"));
                        draw_text_border(camX + 340/4 + xmargin, camY + 190 + 70*3/4 - ymargin, "Item", getColor("item"));
                        draw_text_border(camX + 340*3/4 - xmargin, camY + 190 + 70*3/4 - ymargin, "Escape", getColor("escape"));
                        break;
                    case "escape":
                        fontX(fa_center);
                        draw_text_border(camX + 340/2 + xmargin/2, camY + 190 + ymargin, "Run away? (+1 cardio)", c_white);
                        draw_text_border(camX + 340/2 + xmargin/2 - 50, camY + 190+ 70*3/4 - ymargin, "Yes", getColor("yes"));
                        draw_text_border(camX + 340/2 + xmargin/2 + 50, camY + 190+ 70*3/4 - ymargin, "No", getColor("no"));
                        break;
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
        
        i += 0.25;
        camAngle += i;
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