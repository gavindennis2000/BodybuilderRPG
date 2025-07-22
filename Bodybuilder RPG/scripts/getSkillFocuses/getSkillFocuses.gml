function getSkillFocuses(skill) {
    // returns an object with the correct focus and selections

    /*gmlive*/ if (TEST) { if (live_call(skill)) return live_result; }

    switch (skill) {
        case "Talk":
            return {
                focus: "enemies", 
                selections: "myEnemies",
                selection: ""
            }
        default:
            return {
                focus: "players", 
                selections: "myParty",
                selection: "all"
            }
    }

}