// flash white when using skills
/*gmlive*/if (TEST) { if (live_call()) return live_result; }

var inc = 0.02, limit = 0.4;

// handle player
if (pSkillAlpha != 1) {
    if (pSkillAlpha > limit) {
        pSkillAlpha -= inc;
        alarm[5] = 2;
    }
    else if (pSkillAlpha == limit) {
        pSkillAlpha -= inc;
        alarm[5] = 2;
    }
    else {
        pSkillAlpha = 1;
    }
}

// handle enemy
if (eSkillAlpha != 1) {
    if (eSkillAlpha > limit) {
        eSkillAlpha -= inc;
        alarm[5] = 2;
    }
    else if (eSkillAlpha == limit) {
        eSkillAlpha -= inc;
        alarm[5] = 2;
    }
    else {
        eSkillAlpha = 1;
    }
}