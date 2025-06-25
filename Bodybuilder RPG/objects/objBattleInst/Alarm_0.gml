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
        alarm_set(0, 20);
    }
}
else if (state == "attack") {
    // jump back to original position
    state = "jump";
    targetX = xstart;
    halfwayX = targetX - (targetX - x) / 2;
    targetY = ystart;
    with (myVictim) {
        showDamage = true;
        dmgToShow = other.dmgToGive;
        alarm[1] = 50;
    }
    alarm_set(0, 1);
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