/*set up gmlive for this function*/ if (TEST) { if (live_call()) return live_result; }

if (position == "start") {
    if (global.chapter == 0 && objPlayer.teleport == 0) {
        if (counter < 60) {
            objPlayer.canMove = false;
            counter++;
            exit;
        }
        position = "next";
        var str4 = $"Your physique journey begins today, {global.characterName}!";
        instance_create_layer(x, y, layer, objTextbox, {
            text: [
                "In this mass universe, only one person is worthy of the title, \"King of Gains\".",
                "Few people are blessed with the genes to build huge muscles.",
                "Even among the genetically gifted, few have the work ethic and discipline to become truly massive...",
                "You are an individual fortunate enough to possess all of these traits!",
                "In fact, you have the potential to become the greatest bodybuilder of all time!",
                "But it will be a challenge far greater than anything your mind can fathom...",
                str4,
                "Come forth, and receive your gift from the Guardians of Gains!"
            ]
        });
    }
}

else if (position == "next" && objPlayer.y <= 480) {
    position = "final";
    instance_create_layer(x, y, layer, objTextbox, {
        text: [
            "Three possible choices await you:",
            "On the left, the Nectar of the Guardians...",
            "Take this if you are a casual lifter who is not looking for a challenge.",
            "In the center, you'll find the Golden Drumstick...",
            "Take this if you are a serious lifter seeking a true test of skill!",
            "Finally, on the right is the Trapezius of Power!",
            "I strongly recommend against this one unless you are a nihilist.",
            "Choose your item wisely. There will be no second `chances..."
        ]
    });
}