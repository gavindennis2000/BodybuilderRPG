function getBattleText(fighter) {
    // get's text when using "talk" skill during battle
    // returns object containing text and effect
    // if opponent has already been talked to, nothing will happen

    /*gmlive*/ if (TEST) { if (live_call(fighter)) return live_result; }

    var battleID = fighter.battleID;
    var talkedTo = fighter.talkedTo;
    var playerTxt = "";
    var enemyText = "";
    var effectTxt = "";

    switch (battleID) {
        case "donnie swoleman":
            playerTxt = "You look like a meatball dressed in clown pants.";
            enemyTxt = "GAAAAAAAAAH!";
            effectTxt = $"{string_upper(battleID)}'s strength decreased.";
            if (!fighter.talkedTo)
                fighter.stats.strength -= 2;
            break;
        default:
            playerTxt = "Your squat depth stinks.";
            effectTxt = $"{string_upper(battleID)}'s strength decreased.";
            if (!fighter.talkedTo)
                fighter.stats.strength -= 2;
            break;
    }


    if (talkedTo) {
        enemyTxt = "";
        effectTxt = $"{string_upper(global.characterName)}'s words had no effect.";
    }

    return (enemyTxt == "") ? [
        {
            name: "andro",
            text: playerTxt
        },
        {
            name: "",
            text: effectTxt
        }
    ] : [
        {
            name: "andro",
            text: playerTxt
        },
        {
            name: battleID,
            text: enemyTxt
        },
        {
            name: "",
            text: effectTxt
        }
    ];
}