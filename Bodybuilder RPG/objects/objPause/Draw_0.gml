if (TEST) { if (live_call()) return live_result; }  // gmlive

var camX = camera_get_view_x(view_camera[0]);
var camY = camera_get_view_y(view_camera[0]);
var c = c_black;

if (paused) {
    // black screen
	var tempAlpha = draw_get_alpha();
	draw_set_alpha(fadeBlack)
	draw_rectangle_color(camX, camY, camX + 480, camY + 270, c, c, c, c, false);
	draw_set_alpha(tempAlpha);
    
    // pause menu    
    var menu1y = 0, menu2y = 270 - 64
    var blue = #0066cc
    
    draw_rectangle_color(  // big menu
        camX + menuX + menuMargin, camY + menu1y + menuMargin, 
        camX + menuX + 480 - menuMargin, camY + menu2y - menuMargin,
        #0033cc, blue, #99ccff, blue, false
    );
    draw_rectangle_color(  // big menu outline
        camX + menuX + menuMargin, camY + menu1y + menuMargin, 
        camX + menuX + 480 - menuMargin, camY + menu2y - menuMargin,
        c_white, c_white, c_white, c_white, true
    );
    draw_rectangle_color(  // options menu
        camX - menuX + menuMargin, camY + menu2y, 
        camX - menuX + 480 - menuMargin, camY + menu2y + 64 - menuMargin,
        blue, #99ccff, blue, #0033cc, false
    );
    draw_rectangle_color(  // options menu outline
        camX - menuX + menuMargin, camY + menu2y, 
        camX - menuX + 480 - menuMargin, camY + menu2y + 64 - menuMargin,
        c_white, c_white, c_white, c_white, true
    );
    
    // draw the menu shit
    fontY(fa_top); 
    draw_set_font(fontMenu);
    
    // options menu
    fontX(fa_center);
    var optionY = 270 - 48;
    draw_text_border(camX + 480*1/6 + menuX - 10, camY + optionY, "Items", getColor("items"), 1);
    draw_text_border(camX + 480*2/6 + menuX - 10, camY + optionY, "Equip", getColor("equip"), 1);
    draw_text_border(camX + 480*3/6 + menuX - 5, camY + optionY, "PRs", getColor("prs"), 1);
    draw_text_border(camX + 480*4/6 + menuX + 5, camY + optionY, "Save", getColor("save"), 1);
    draw_text_border(camX + 480*5/6 + menuX + 10, camY + optionY, "Quit", getColor("quit"), 1);
    
    // chapter number
    var chapter = "I";
    global.chapter = 1;
    switch (global.chapter) {
        case 2:
            chapter = "II: Overcoming the Lifetime \nIntermediate Prophecy"
            break;
        case 3:
            chapter = "III: From DYEL to Fake \nNatty Accusations"
            break;
        case 4:
            chapter = "IV: Sulik Era! Dethrone the King"
            break;
        case 1:
        default:
            chapter = "I: Humble Origins \nThe Novice Progression";
            break;
    }
    fontX(fa_right);
    draw_text_border(camX + 465 + menuX, camY + 10, chapter, c_white, 1);
    
    // location and money
    var roomVar = global.roomVar;
    var money = string(global.stats.money);
    money = string_concat("Money: $", money);
    fontX(fa_left);
    draw_text_border(camX + 15 + menuX, camY + 10, roomVar, c_white, 1);
    draw_text_border(camX + 15 + menuX, camY + 10, $"\n{money}", c_white, 1);
    
    // the screen
    switch (screen) {
        case "status":
            // draws the stats, health, and picture of player
            var stats = global.stats, statY = camY + 154;
            fontX(fa_center);
        
            // draw the players picture and fatigue state
            /*
                Fatigue states
                good    0-50%   c_white
                caution 50-75%  #ff6666
                danger  75-99%  #ff3333
            */
            image_speed = 0.05;  // player animation speed
            var pX = camX + 480/2-32 + menuX, pY = camY + 80, pColor = #ff6666;
            
            // get color for fatigue state
            var fatigue = global.stats.fatigue, pColor = c_white, barDistance = 20;
            if (fatigue < 25) { pColor = c_white; }
            else if (fatigue < 50) { pColor = #ffcccc; }
            else if (fatigue < 75) { pColor = #ff9999; }
            else { pColor = #ff6666; }
                
            // draw the player and name
            draw_set_font(fontText);
            // the player's sprite
            draw_sprite_part_ext(sprPlayerDown, -1, 32*global.outfit.color, 0, 32, 32, pX, pY, 2, 2, pColor, 1);
            // the player's hair
            var hairColor = c_white;
            switch (global.outfit.hairColor) {
                case 0:
                    hairColor = #663500;
                    break;
                case 1:
                    hairColor = #ffff99;
                    break;
                case 2:
                    hairColor = #1a0d00;
                    break;
                case 3:
                    hairColor = #cc2900;
                    break;
                case 4:
                    hairColor = #66ccff;
                    break;
            }
            draw_sprite_part_ext(sprHairDown, -1, 32*global.outfit.hair, 0, 32, 40, pX, pY - 8, 2, 2, hairColor, 1);
            // the player's mame
            draw_text_border(pX - 80, pY + 8, global.characterName, c_white, 1);  // name
        
            // player's status
            var status = "", statsMin = global.statsMin;
            if (statsMin[1] < 40) { status = "Pencil Neck"; }
            else if (statsMin[1] < 70) { status = "Sleeper Build"; } 
            else if (statsMin[1] < 100) { status = "Natty Daddy"; }
            else { status = "Pro Card"; }
            draw_text_border(pX - 80, pY + 8 + 16, string_concat("Status: ", status), c_orange, 1, c_black);  // status
            
            // draw the fatigue meter   
            fatigue = string(fatigue);
            if (string_length(fatigue) < 2) { fatigue = string_concat("0",fatigue); }
            draw_text_border(pX + 80 + 64, pY + 8 - barDistance, string_concat("Fatigue: ", fatigue, "%"), pColor, 1);  // name
            fatigue = global.stats.fatigue;  // return fatigue back to what it was
            draw_set_font(fontMenu);
            var barH = 10, barW = 100, barX = pX + 93, barY = pY + 38;
            draw_rectangle_color(barX, barY - barH/2 - barDistance, barX + barW, barY + barH/2 - barDistance, c_black, c_black, c_black, c_black, false);  // fatigue empty bar
            draw_rectangle_color(barX, barY - barH/2 - barDistance, barX + fatigue, barY + barH/2 - barDistance, c_red, pColor, pColor, c_red, false);  // actual fatigue bar
            draw_rectangle_color(barX, barY - barH/2 - barDistance, barX + barW, barY + barH/2 - barDistance, c_white, c_white, c_white, c_white, true);  // fatigue bar outline
            
             // draw the ultimate meter   
             // get color for ultimate state
            var ultimate = global.stats.ultimate;
            if (ultimate < 25) { uColor = c_white; }
            else if (ultimate < 50) { uColor = #a677ba; }
            else if (ultimate < 75) { uColor = #8b6a99; }
            else { uColor = #6a5175; }

            // draw the actual bar
             ultimate = string(ultimate);
             if (string_length(fatigue) < 2) { fatigue = string_concat("0", ultimate); }
             draw_text_border(pX + 80 + 64, pY + 8 + barDistance, string_concat("Ultimate: ", ultimate, "%"), uColor, 1);  // name
             ultimate = global.stats.ultimate;  // return fatigue back to what it was
             draw_set_font(fontMenu);
             var barH = 10, barW = 100, barX = pX + 93, barY = pY + 38;
             draw_rectangle_color(barX, barY - barH/2 + barDistance, barX + barW, barY + barH/2 + barDistance, c_black, c_black, c_black, c_black, false);  // empty bar
             draw_rectangle_color(barX, barY - barH/2 + barDistance, barX + ultimate, barY + barH/2 + barDistance, c_yellow, #381747, uColor, c_yellow, false);  // actual ultimate bar
             draw_rectangle_color(barX, barY - barH/2 + barDistance, barX + barW, barY + barH/2 + barDistance, c_white, c_white, c_white, c_white, true);  // ultimate bar outline
            
            // draw the players stats
            draw_text_border(camX + 480*1/4 + menuX - 10, statY, string_concat("Chest: ",stats.chest), c_white, 1);
            draw_text_border(camX + 480*1/4 + menuX - 10, statY + 20, string_concat("Shoulders: ",stats.shoulders), c_white, 1);
            draw_text_border(camX + 480*2/4 + menuX - 10, statY, string_concat("Back: ",stats.back), c_white, 1);
            draw_text_border(camX + 480*2/4 + menuX - 10, statY + 20, string_concat("Arms: ",stats.arms), c_white, 1);
            draw_text_border(camX + 480*3/4 + menuX + 5, statY, string_concat("Legs: ",stats.legs), c_white, 1);
            draw_text_border(camX + 480*3/4 + menuX + 5, statY + 20, string_concat("Cardio: ",stats.cardio), c_white, 1);
            break;
        
        case "items":
            fontX(fa_center);
            fontY(fa_middle);
            
            // draw the items
            // get the inventory
            var inventory = array_create(4, -1);
            for (var i = 0; i < 7; i++) {
                if (i + inventoryCursor < array_length(global.inventory))
                    inventory[i] = global.inventory[i + inventoryCursor];
            }
            // get the key items
            var keyItems = global.keyItems;
            
            // draw the inventory
            draw_text_border(camX + 480*1.5/5 + menuX, camY + 135 - 72, "Inventory", #e066ff, 1);
            for (var i = 0; i < 8; i++) {
                if (i >= array_length(inventory)) { break; }
                if (inventory[i] == -1) { continue; }
                
                var itemX = (i % 2 == 0) ? camX + 480*1/5 - 10 : camX + 480*2/5 + 10
                itemX += menuX;
                var itemY = (i % 2 == 0) ? camY + 135 - 48 + (10*i) : camY + 135 - 48 + (10*(i-1));
                var color = string_concat("inventory",string(i));
                draw_text_border(itemX, itemY, string_concat(inventory[i].name, " ", inventory[i].quantity), getColor(color), 1);
            }
            
            // draw the key items 
            draw_text_border(camX + 480*4/5 + menuX, camY + 135 - 72, "Key Items", #e066ff, 1);
            for (var i = 0; i < 4; i++) {
                var name = (keyItems[i].value) ? keyItems[i].name : "???";
                var description = (keyItems[i].value) ? keyItems[i].description : "";
                var color = string_concat("key", string(i+1));
                draw_text_border(camX + 480*4/5 + menuX, camY + 135 - 48 + (20*i), name, getColor(color), 1);
            }
        
            // draw the item description
            var color = c_white;
            for (var i = 0; i < 8; i++) {
                var str = string_concat("inventory",string(i));
                if (str == selection) {
                    if (i >= array_length(inventory)) { break; }
                    draw_text_border(camX + 480*0.5 + menuX, camY + 180, inventory[i].description, color, 1);
                    break;
                }
                str = string_concat("key",string(i+1));
                if (str == selection) {
                    if (i >= array_length(keyItems)) { break; }
                    if (keyItems[i].value) {
                        draw_text_border(camX + 480*0.5 + menuX, camY + 180, keyItems[i].description, color, 1);
                        break;
                    }
                }
            }
            break;
        
        case "prs":
            fontX(fa_center);
            fontY(fa_middle);
            
            // header
            draw_text_border(camX + 480*0.5 + menuX, camY + 135 - 72, "Training Log", #e066ff, 1);
        
            // pr's
            var prs = global.PRs;
            for (var i = 0; i < array_length(prs); i++) {
                // get the x and y locations
                var prX = camX + 480*0.5 + menuX, prY = camY + 135 - 92;
                if (i % 3 == 0) { prX -= 120; }
                if (i % 3 == 1) { prX += 120; }
                prY += (floor(i/3) + 1) * 40;
                
                // draw the exercise
                draw_text_border(prX, prY, prs[i].name, c_white);
                // weight and reps
                draw_text_border(prX, prY + 16, string_concat(prs[i].weight, string(prs[i].reps)), c_white);
                
            }
            break;
        case "equip":
            fontX(fa_center);
            fontY(fa_middle);
            draw_text_border(camX + 240 + menuX, camY + 135 - 48, "Equip functionality WIP. Press cancel", c_white, 1);
            break;
        case "save":
            fontX(fa_center);
            fontY(fa_middle);
            draw_text_border(camX + 240 + menuX, camY + 135 - 48, "Game save functionality WIP. Press cancel", c_white, 1);
            break;
        
        case "quit":
            fontX(fa_center);
            fontY(fa_middle);
            draw_text_border(camX + 240 + menuX, camY + 135 - 48, "Return to Main Menu? \nAny Unsaved Progress Will Be Lost.", c_white, 1);
            draw_text_border(camX + 240 - 32 + menuX, camY + 135, "No", getColor("no"), 1);
            draw_text_border(camX + 240 + 32 + menuX, camY + 135, "Yes", getColor("yes"), 1);
            break;
    }
}