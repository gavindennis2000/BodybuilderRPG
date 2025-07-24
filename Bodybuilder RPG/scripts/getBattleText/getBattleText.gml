function getBattleText(fighter) {
    // get's text when using "talk" skill during battle
    // returns object containing text and effect
    // if opponent has already been talked to, nothing will happen

    /*gmlive*/ if (TEST) { if (live_call(fighter)) return live_result; }

    var battleID = fighter.battleID;
    var talkedTo = fighter.talkedTo;
    var txt;

    switch (battleID) {
        case "robber":
            txt = [
                {
                    name: "andro", 
                    text: "Where'd you get that lame criminal outfit?"
                },
                {
                    name: "enemy", 
                    alias: "robber",
                    text: "My mom knitted this for me, asshole!"
                },
                {
                    name: "", 
                    text: "ROBBER's love for his mother increases his strength."
                }
            ]
            if (!fighter.talkedTo)
                fighter.stats.strength += 0.25;
            break;
        case "donnie swoleman":
            txt = [
                {
                    name: "andro", 
                    text: "You look like a meatball dressed in clown pants."
                },
                {
                    name: "donnie swoleman", 
                    text: "OOOOOOH!! BUDDY!! IT'S TIME FOR THE PAIN TO RAIN!!"
                },
                {
                    name: "", 
                    text: $"{string_upper(battleID)}'s strength decreased."
                }
            ]
            if (!fighter.talkedTo)
                fighter.stats.strength -= 2;
            break;
        case "smol powerlifter":
            txt = [
                {
                    name: "andro", 
                    text: "Want to hear a funny joke?"
                },
                {
                    name: "smol powerlifter", 
                    text: "Huh?"
                },
                {
                    name: "andro", 
                    text: "Your bench press max."
                },
                {
                    name: "",
                    text: "SMOL POWERLIFTER's insecurity regarding his bench max has destroyed his confidence."
                }
            ]
            if (!fighter.talkedTo)
                fighter.stats.hp = 0;
            break;
        case "super heavyweight":
            txt = [
                {
                    name: "andro", 
                    text: "You ever think maybe you took the bulk a little too far?"
                },
                {
                    name: "super heavyweight", 
                    text: "Are you kidding? This is ALL MUSCLE!"
                },
                {
                    name: "",
                    text: "SUPER HEAVYWEIGHT is definitely fudging the truth."
                },
                {
                    name: "",
                    text: "SUPER HEAVYWEIGHT rips out a Thickers Bar and eats it with his mouth open."
                },
                {
                    name: "",
                    text: "SUPER HEAVYWEIGHT's strength decreased, but his health increased."
                }
            ]
            if (!fighter.talkedTo) {
                fighter.stats.strength -= 4;
                fighter.stats.hp += 1000;
                fighter.stats.maxhp += 1000;
            }
            break;
        case "thicc powerlifter":
            txt = [
                {
                    name: "andro", 
                    text: "Sumo deadlifts are cheating."
                },
                {
                    name: "", 
                    text: "THICC POWERLIFTER is a conventional deadlifter, so he just laughs."
                },
                {
                    name: "",
                    text: "THICC POWERLIFTER's strength increased."
                }
            ]
            if (!fighter.talkedTo)
                fighter.stats.strength += 2;
            break;
        default:
            txt = [ 
                {
                    name: "andro",
                    text: "Your squat depth stinks.",
                },
                {
                    name: "",
                    text: $"{string_upper(battleID)}'s strength decreased"
                }
            ]
            if (!fighter.talkedTo)
                fighter.stats.strength -= 2;
            break;
    }


    if (!talkedTo)
        return txt;
    
    var newTxt = [
        txt[0],
        {
            name: "",
            text: $"{string_upper(battleID)} ignores {string_upper(global.characterName)}."
        }
    ]

    return newTxt;
}