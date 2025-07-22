// objBattle drawGUI

if (TEST) { if (live_call()) {  // GMLive
    return live_result;
}}

if (fadeBlack != -1) {
    var getAlpha = draw_get_alpha();
    draw_set_alpha(fadeBlack)
    draw_rectangle_color(0, 0, CAM_WIDTH, CAM_HEIGHT, c_black, c_black, c_black, c_black, false);
    draw_set_alpha(getAlpha);
    exit;
}

// draw the marquee
var marqueeChangeAmount = 4;
if (marquee.counter != 0) {
    if (marquee.height < marquee.heightMax)
        marquee.height += marqueeChangeAmount;
    
    marquee.counter--;
}
else if (marquee.height > 0)
    marquee.height -= marqueeChangeAmount;

if (marquee.height != 0) {
    var getAlpha = draw_get_alpha();
    draw_set_alpha(0.8);
    draw_rectangle_color(0, 0, CAM_WIDTH, marquee.height, c_black, c_black, c_black, c_black, false);
    draw_set_alpha(getAlpha);
    fontXY(fa_center, fa_bottom);
    draw_set_font(fTextboxSmall);
    drawTextOutline(CAM_WIDTH / 2, marquee.height + 2, marquee.text, c_white, c_black);
}

// draw the players names, health, etc
if (state != "victory") {
    fontXY(fa_right, fa_bottom);
    var nameX = CAM_WIDTH * 2/3
    var nameY = CAM_HEIGHT * 19/20;
    var pY = 0;
    for (var i = array_length(myParty) - 1; i >= 0; i--) {
        // find where to draw everything
        var finalNameY = nameY - 24 * pY;
        // if it is the fighter's turn, draw a rectangle around their area
        if (turn != -1 && turn.battleID == myParty[i].battleID) {
            var getAlpha = draw_get_alpha();
            draw_set_alpha(0.3);
            var turnX = CAM_WIDTH / 2 + 10
            var turnY = finalNameY - 2;
            var turnH = 23;
            draw_rectangle_color(turnX, turnY - turnH, CAM_WIDTH - 2, turnY, c_blue, c_blue, c_black, c_black, false);
            draw_set_alpha(getAlpha);
        }

        // draw the fighter's name
        var fighterName = myParty[i].battleID;
        if (fighterName == "andro")
            fighterName = global.characterName;
        draw_set_font(fTextboxSmall)
        drawTextOutline(nameX, finalNameY, string_upper(fighterName));

        // draw the fighter's health and skill points
        var healthX = nameX + 48;
        var healthY = finalNameY - 9;
        drawTextOutline(healthX, healthY, myParty[i].stats.hp, (myParty[i].stats.hp > 0) ? c_white : #7a2d2d);
        drawTextOutline(healthX + 9, healthY + 1, "/", (myParty[i].stats.hp > 0) ? c_white : #7a2d2d);
        drawTextOutline(healthX + 44, healthY, myParty[i].stats.maxhp, (myParty[i].stats.hp > 0) ? c_white : #7a2d2d);
        var skillColor = myParty[i].stats.skill == 0 ? #7a2d2d : #d68449;
        
        drawTextOutline(CAM_WIDTH - 20, healthY, myParty[i].stats.skill, skillColor);
        pY++;

        // draw the fighter's ultimate
        var ultimateX = nameX + 8;
        var ultimateY = finalNameY - 4;
        draw_rectangle_color(ultimateX, ultimateY, CAM_WIDTH - 8, ultimateY - 5, c_white, c_white, c_white, c_white, false);
        draw_rectangle_color(ultimateX + 1, ultimateY - 1, CAM_WIDTH - 9, ultimateY - 4, c_black, c_black, c_black, c_black, false);
    }
}

// draw the attack options
if (state == "ready" && focus == "menu") {
    var attackX = 10;
    var attackY = nameY - 74;
    var attackW = CAM_WIDTH / 2 - 10;
    var getAlpha = draw_get_alpha();
    draw_set_alpha(0.5);
    draw_rectangle_color(attackX + optionsOffset, attackY, attackW + optionsOffset, CAM_HEIGHT - attackX - 1, c_blue, c_blue, c_black, c_black, false);
    draw_set_alpha(getAlpha);
    draw_rectangle_color(attackX + optionsOffset, attackY, attackW + optionsOffset, CAM_HEIGHT - attackX, c_white, c_white, c_white, c_white, true);

    fontXY(fa_center, fa_middle);
    var textYOff = 26;
    if (focus == "menu") {
        var getColor = function(selectionName) {
            var selectColor = c_yellow, invalidColor = c_grey;
            var color = c_white;
            if (
                selectionName == "Skill" && array_length(skills) == 0 ||
                selectionName == "Gym Bag" && array_length(global.inventory) == 0 ||
                selectionName == "Run Away" && !canRun
            ) {
                color = selections[selection] == selectionName ? #666600 : invalidColor;
            }
            else if (selections[selection] == selectionName)
                color = selectColor;

            return color;
        }
        var finalSelections = selections;
        if (screen == "Gym Bag") {
            selections = inventory;
            finalSelections = [
                selections[0] != -1 ? $"{selections[0].name} {selections[0].quantity}" : "",
                selections[1] != -1 ? $"{selections[1].name} {selections[1].quantity}" : "",
                selections[2] != -1 ? $"{selections[2].name} {selections[2].quantity}" : "",
                selections[3] != -1 ? $"{selections[3].name} {selections[3].quantity}" : "",
            ]
        }
        if (array_length(selections) >= 1)
        drawTextOutline(attackX + attackW / 4 + optionsOffset, attackY + textYOff, finalSelections[0], getColor(selections[0]));
        if (array_length(selections) >= 2)
            drawTextOutline(attackX + attackW * 3 / 4 - 2 + optionsOffset, attackY + textYOff, finalSelections[1], getColor(selections[1]));
        if (array_length(selections) >= 3)
            drawTextOutline(attackX + attackW / 4 + optionsOffset, attackY + textYOff * 2, finalSelections[2], getColor(selections[2]));
        if (array_length(selections) >= 4)
            drawTextOutline(attackX + attackW * 3 / 4 - 2 + optionsOffset, attackY + textYOff * 2, finalSelections[3], getColor(selections[3]));
    }

    // smooth animation for the options menu
    if (optionsOffset > 0) {
        optionsOffset = round(optionsOffset / 2);
        if (optionsOffset == 1) {
            playSound(sndBattleReady);
            optionsOffset = 0;
        }
    }

}

// draw the battle order queue
if (state != "start" && state != "run away" && state != "victory" && state != "loss" && screen != "Run Away") {
    var margin = 10;
    var queueW = 64;
    var queueX = CAM_WIDTH - margin - queueW;
    var queueY =  margin;
    var queueH = 24;
    var queueDis = 16;
    // draw the top of the queue
    var getAlpha = draw_get_alpha();
    draw_set_alpha(0.8);
    var turnColor = #6ec3c4;
    var turnColor2 = #c1dbdb;
    var turnColor3 = #2a4e4f;
    draw_rectangle_color(queueX, queueY, queueX + queueW, queueY + queueH * 6 - 1, turnColor, turnColor2, turnColor3, c_black, false);
    fontXY(fa_center, fa_top);
    drawTextOutline(queueX + queueW / 2, queueY, "Turn");
    draw_set_alpha(getAlpha);
    // the following fighters' turns
    for (var i = 0; i < 5; i++) {
        // get the fighter's picture
        var battleID, c1;
        if (i == 0 && is_array(predictQueue)) {
            battleID = predictQueue[i].battleID;
            c1 = predictQueue[i].side == "party" ? c_blue : c_red;
            if (predictQueue[i].side == "party") {
                var getAlpha = draw_get_alpha();
                draw_set_alpha(1);
                var tX = queueX + 51, tY = queueY + queueH * 1.5;
                var tW = 11, tH = queueH / 2 - 5;
                var tColor = c_yellow, tColorTop = 	#ffff99, tColorBottom = #b3b34d;
                draw_triangle_color(tX, tY, tX + tW, tY - tH, tX + tW, tY + tH, tColor, tColorTop, tColorBottom, false);
                draw_set_alpha(getAlpha);
            }
        }
        else {
            battleID = predictQueue[i].battleID;
            c1 = predictQueue[i].side == "party" ? c_blue : c_red;
        }
        switch (battleID) {
            case "andro":
                spr = sprAndro;
                break;
            case "ana":
                spr = sprAna;
                break;
            case "doms":
                spr = sprDoms;
                break;
            default:
                spr = "enemy";
                break;
        }
        queueY += queueH;
        var c2 = c_black;
        var getAlpha = draw_get_alpha();
        draw_set_alpha(0.4);
        draw_rectangle_color(i == 0 ? queueX: queueX + queueDis, queueY, i == 0 ? queueX + queueW - queueDis : queueX + queueW, queueY + queueH - 1, c1, c1, c2, c2, false);
        draw_set_alpha(getAlpha);
        if (spr != "enemy")
            draw_sprite_part_ext(spr, 0, 0, 5, queueW, queueH / 2, i == 0 ? queueX - queueDis / 2 : queueX + queueDis / 2, queueY, 2, 2, c_white, 1);
        else {
            fontXY(fa_center, fa_middle);
            drawTextOutline(queueX + queueW / 2 + queueDis / 2, queueY + queueH / 2 - 2, $"{predictQueue[i].pos}", c_yellow, c_black);
        }
    }
}

// focus the cursor on the enemies
if (focus == "enemies" && state == "ready") {
    // draw the cursor on the selected enemy

    if (selection == "all") {
        for (var i = 0; i < array_length(selections); i++) {
            // draw a cursor on every party member
            var tX = selections[i].x + 20;
            var tY = selections[i].y;
            var tW = 11, tH = queueH / 2 - 5;
            var tColor = c_yellow, tColorTop = 	#ffff99, tColorBottom = #b3b34d;
            draw_triangle_color(tX, tY, tX + tW, tY - tH, tX + tW, tY + tH, tColor, tColorTop, tColorBottom, false);
        }
    }
    else {
        var tX = selections[selection].x + 20;
        var tY = selections[selection].y;
        var tW = 11, tH = queueH / 2 - 5;
        var tColor = c_yellow, tColorTop = 	#ffff99, tColorBottom = #b3b34d;
        draw_triangle_color(tX, tY, tX + tW, tY - tH, tX + tW, tY + tH, tColor, tColorTop, tColorBottom, false);
    }
}

// focus the cursor on the players
else if (focus == "players" && state == "ready") {
    if (selection == "all") {
        for (var i = 0; i < array_length(selections); i++) {
            // draw a cursor on every party member
            var queueH = 24;
            var tX = selections[i].x - 20;
            var tY = selections[i].y;
            var tW = 11, tH = queueH / 2 - 5;
            var tColor = c_yellow, tColorTop = 	#ffff99, tColorBottom = #b3b34d;
            draw_triangle_color(tX, tY, tX - tW, tY - tH, tX - tW, tY + tH, tColor, tColorTop, tColorBottom, false);
        }
    }
    else {
        var tX = selections[selection].x + 20;
        var tY = selections[selection].y;
        var tW = 11, tH = queueH / 2 - 5;
        var tColor = c_yellow, tColorTop = 	#ffff99, tColorBottom = #b3b34d;
        draw_triangle_color(tX, tY, tX + tW, tY - tH, tX + tW, tY + tH, tColor, tColorTop, tColorBottom, false);
    }
}

if (victoryBarX != -1) {
    if (victoryBarX > victoryBarXFinal) {
        victoryBarX -= round((victoryBarX - victoryBarXFinal) / 8);
    }

    if (victoryBarX - 10 <= victoryBarXFinal && victoryBarXP < xpAccumulated) {
        var amount = xpAccumulated div 50;
        if (victoryBarXP + amount <= xpAccumulated) {
            victoryBarXP += amount;
            global.stats.xp += amount;
        }
        else {
            global.stats.xp += xpAccumulated - victoryBarXP;
            victoryBarXP += xpAccumulated - victoryBarXP;
        }
        if (global.stats.xp >= global.stats.xpNext) {
            levelUp();
        }
    }
    else if (victoryBarXP == xpAccumulated) { 
        if (alarm_get(1) <= 0)
            alarm_set(1, 120);
    }

    var victoryX = victoryBarX;
    var victoryY = CAM_HEIGHT * 3/4 - 16;
    var victoryW = 200;
    var victoryH = 4;
    var margin = 1;

    var coefficient = (victoryW - margin * 2) / global.stats.xpNext;

    var xp = global.stats.xp;

    if (global.stats.level < 99) {
        fontXY(fa_middle, fa_center);
        drawTextOutline(victoryX, victoryY - 10, $"Level {global.stats.level}");
        draw_rectangle_color(victoryX - victoryW / 2 , victoryY, victoryX + victoryW / 2, victoryY + victoryH, c_black, c_black, c_black, c_black, false);
        draw_rectangle_color(victoryX - victoryW / 2 + margin, victoryY + margin, victoryX - victoryW / 2 + 1 + xp * coefficient, victoryY + victoryH - margin, c_white, c_white, c_white, c_white, false);
    }
}