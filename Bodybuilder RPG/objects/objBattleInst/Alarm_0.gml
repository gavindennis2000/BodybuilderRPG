// objBattleInst alarm 0 - attack another fighter

/*gmlive*/ if (TEST) { if (live_call()) return live_result; }

if (state == "run") {
    if (x != targetX || y != targetY) {
        if (abs(targetX - x) > 5 )
            x += round((targetX - x) / 5);
        else 
            x += round(targetX - x);
        if (abs(targetY - y) > 5 )
            y += round((targetY - y) / 5);
        else 
            y += round(targetY - y);

        // set the alarm again
        alarm_set(0, 1);
    }
    else {
        image_index = 0;
        image_speed = 0.2;
        state = "attack";
        var sfx = getSFX(battleID);
        playSound(sfx);
        alarm_set(0, 30);
        with (myVictim)
            state = "attacked";
    }
}
else if (state == "attack") {
    // jump back to original position
    state = "jump";
    targetX = xstart;
    halfwayX = targetX - (targetX - x) / 2;
    targetY = ystart;
    with (myVictim) {
        state = "wait";
        showDamage = true;
        dmgToShow = other.dmgToGive;
        stats.hp -= other.dmgToGive;
        if (stats.hp <= 0) {
            stats.hp = 0;
            if (side == "party")
                alarm[2] = 20;
        }
        alarm[1] = 50;
    }
    alarm_set(0, 1);
}
else if (state == "use item") {
    var fogAmountChange = 0.04;
    if (fogDir == "up") {
        fogAlpha += fogAmountChange;
        alarm_set(0, 1);
        if (fogAlpha >= 0.7) {
            showDamage = true;
            alarm_set(1, 50);
            fogDir = "down";
            alarm_set(0, 20);
        }
    }
    else if (fogDir == "down" && fogAlpha > 0) {
        fogAlpha -= fogAmountChange;
        alarm_set(0, 1);
    }
    else {
        fogAlpha = 0;
        fogDir = "up";
        state = "wait";
        with (objBattle)
            attackStatus.ready = true;
    }
}
else if (state == "jump") {
    // when fighter get's back to starting position, send a message to battle controller
    if (x != targetX || y != targetY) {
        if (abs(targetX - x) > 5 )
            x += round((targetX - x) / 5);
        else 
            x += round(targetX - x);
        if (abs(targetY - y) > 5 )
            y += round((targetY - y) / 5);
        else 
            y += round(targetY - y);
        if (x > halfwayX && halfwayX > targetX || x < halfwayX && halfwayX < targetX)
            y -= 20;
        alarm_set(0, 1);
    }
    else {
        state = "wait";
        with (objBattle)
            attackStatus.ready = true;
    }
}