function getSkillSpeed(skill, spdFactor) {
    // gets counter increase for a given skill

    /*gmlive*/ if (TEST) { if (live_call(skill, spdFactor)) return live_result; }

    if (!is_struct(skill))
        return standard;
    
    var standard = ATTACK_COUNTER - spdFactor;

    switch (skill.name) {
        case "Talk":
            // same as an item
            return standard / 2;
        case "Train":
            return standard / 1.5;
        default:
            // slightly faster than regular attack
            return standard / 1.5;
    }
}