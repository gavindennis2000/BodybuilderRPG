// objBattleInst create

/*gmlive*/ if (TEST) { if (live_call()) return live_result; }

stats = getStats(battleID);
if (stats.cardio > 99)
    stats.cardio = 99;

// extra stats from buffs
talkedTo = false;
buffStr = 0;
buffDef = 0;

moves = getMoves(battleID);
moveIndex = 0;

// battle animation stuff
targetX = -1;
halfwayX = -1;
targetY = -1;

// skill animation effects
skillSpr = -1;
skillY = 0;
skillAlpha = 0;
skillDir = "up";
skillSound = sndDoor;

// show damage when hit by oppressor
myVictim = -1;
myItem = -1;
mySkill = -1;
fogAlpha = 0;
fogDir = "up";
dmgToGive = -1;
dmgToShow = -1;
dmgY = 20;
dmgYStart = dmgY
dmgYFinal = 40;
showDamage = false;

// stuff for enemy death animation
dying = false;
deathY = 0;

// functions in alphabetical order
activateSkillEffect = function() {
    // activate skill and handle animations for all involved fighters

    // show animation
    var partySkillFunc = function() {
        with (objBattle)
            for (var i = 0; i < array_length(myParty); i++) {
                with (myParty[i]) {
                    alarm_set(3, 1 + 30 * i);
                }
            }
    }

    switch (mySkill) {
        case "Train":
            with (objBattleInst)
                if (side == "party") {
                    skillSpr = 0;
                    skillSound = sndBuffer;
                    if (buffStr < 5)
                        buffStr++;
                    if (buffDef < 5)
                        buffDef++;
                }
            partySkillFunc();
            break;
        default:
            debug("no skill effect");
    }
}

attack = function(victim, dmg) {
    // attacks another fighter

    /*gmlive*/ if (TEST) { if (live_call(victim, dmg)) return live_result; }

    myVictim = victim;

    state = "run";
    targetX = (side == "party") ? myVictim.x - 32 : myVictim.x + 32;
    targetY = myVictim.y;

    dmgToGive = dmg;

    alarm_set(0, 5);

    return;
}

death = function() {
    // enemy fades to black like metallica

    /*gmlive*/ if (TEST) { if (live_call()) return live_result; }

    image_blend = c_black;
    image_alpha = 0.8;
    dying = true;
    playSound(sndDeath);

    return;
}

useItem = function(victim, item) {
    // uses item for self or other fighter

    /*gmlive*/ if (TEST) { if (live_call(victim, item)) return live_result; }

    myVictim = victim;
    myItem = item;

    var victimHP = myVictim.stats.hp;
    useItemGlobal(myItem, myVictim.battleID);
    victimHP -= myVictim.stats.hp;

    with (myVictim) {
        dmgToShow = victimHP == 0 ? -1 : victimHP;
        state = "use item";
        alarm_set(0, 5);
    }
    return;
}

useSkill = function(victim, skill) {
    // uses skill on self, whole party, enemy, or all enemies

    /*gmlive*/ if (TEST) { if (live_call(victim, skill)) return live_result; }

    myVictim = victim;
    mySkill = skill.name;
    stats.skill -= skill.cost;

    switch (mySkill) {
        case "Talk":
            state = "talking";
            var text = getBattleText(myVictim);
            textbox(text, false, false, "bottom");
            myVictim.talkedTo = true;
            alarm_set(0, 5);
            break;
        case "Train":
            state = "use skill";
            alarm_set(0, 5);
            break;
        default:
            state = "talking";
            textbox("This skill doesn't work yet. Sorry.", false, false, "bottom");
            alarm_set(0, 60);
            break;
    }    

}

getSFX = function(battleID) {
    // get's the appropriate sound effects

    /*gmlive*/ if (TEST) { if (live_call(battleID)) return live_result; }

    switch(battleID) {
        case "andro":
            return sndHitAndro;
        case "ana":
            return sndHitAna;
        case "doms":
            return sndHitDoms;
        default:
            return sndHitEnemy;
    }
}

runAway = function() {
    // runs away from battle
    face = "left";
    state = "run";
    hspeed = -7;
}