// flash white when using skills
/*gmlive*/if (TEST) { if (live_call()) return live_result; }

var inc = 0.01;
aTime = 15;

// handle player
if (pSkillAlpha != 1) {
    if (pSkillAlpha > 0.1) {
        pSkillAlpha -= inc;
        alarm[5] = 1;
    }
    else if (pSkillAlpha == 0.01) {
        pSkillAlpha = 0;
        alarm[5] = aTime;
    }
    else {
        pSkillAlpha = 1;
    }
}

// handle enemy
if (eSkillAlpha != 1) {
    if (eSkillAlpha > 0.1) {
        eSkillAlpha -= inc;
        alarm[5] = 1;
    }
    else if (eSkillAlpha == 0.1) {
        eSkillAlpha = 0;
        alarm[5] = aTime;
    }
    else {
        eSkillAlpha = 1;
    }
}