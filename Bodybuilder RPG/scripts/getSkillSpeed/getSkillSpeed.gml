function getSkillSpeed(skill, spdFactor) {
    // gets counter increase for a given skill
    /*gmlive*/ if (TEST) { if (live_call()) return live_result; }

    var standard = ATTACK_COUNTER - spdFactor;

    switch (skill) {
        default:
            // slightly faster than regular attack
            return standard / 1.5;
    }
}