function getSkillDescription(skill) {
    // returns a description of skill selected during battle

    /*gmlive*/ if (TEST) { if (live_call(skill)) return live_result; }

    switch (skill) {
        case "Talk":
            return "Talk to the enemy.";
        case "Train":
            return "Increase strength and resilience for entire party."
        default:
            return "No skill description available."
    }
}