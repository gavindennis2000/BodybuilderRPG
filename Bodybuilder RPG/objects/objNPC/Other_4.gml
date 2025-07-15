// objNPC room start - handle enemiesToDestroy

/*gmlive*/ if (TEST) { if (live_call()) return live_result; }

if (array_contains(global.enemiesDestroyed, npcID))
    instance_destroy(self, false);

if (array_length(global.enemiesToDestroy) <= 0)
    exit;

for (var i = 0; i < array_length(global.enemiesToDestroy); i++) {
    var enemy = global.enemiesToDestroy[i];
    array_delete(global.enemiesToDestroy, i, 1);
    if (instance_exists(objPlayer)) {
        var newFace;
        switch (objPlayer.face) {
            case "down":
                newFace = "up";
                break;
            case "up":
                newFace = "down";
                break;
            case "left":
                newFace = "right";
                break;
            case "right":
                newFace = "left";
                break;
        }
        with (objNPC)
            if (npcID == enemy) {
                flashing = true;
                faceStart = newFace;
                face = faceStart;
            }
    }
    switch (enemy) {
        case "donnie swoleman":
            global.cutscene = true;
            global.cutsceneSong = -1;
            textbox([
                {
                    name: "donnie swoleman", 
                    text: "I can't... believe... this will be my last \"YEAH BABY!!!\"...", 
                },
                {
                    name: "donnie swoleman", 
                    text: "And to believe... I lost to this LIGHT WEIGHT kid!!", 
                },
                {
                    name: "donnie swoleman", 
                    text: "Listen to me... You need to get outta town... You have serious potential...", 
                },
                {
                    name: "donnie swoleman", 
                    text: "Don't throw it away... being a part of this... tainted industry...", 
                    action: function() {
                        with (objNPC)
                            if (npcID == "donnie swoleman")
                                instance_destroy();
                        textbox([
                            {
                                name: "", 
                                text: "DONNIE SWOLEMAN blacked out.",
                                action: function() {
                                    instance_create_layer(objPlayer.x, objPlayer.y, "Instances", objNPC, {
                                        npcID: "ana",
                                        directions: ["right"], 
                                        action: function() {
                                            with (objNPC)
                                                if (npcID == "ana") {
                                                    face = "left";
                                                    faceStart = "left";
                                                }
                                            with (objPlayer)
                                                face = "right";
                                            textbox([
                                                {
                                                    name: "ana", 
                                                    text: $"Holy crap, {string_upper(global.characterName)}!!"
                                                }, 
                                                {
                                                    name: "ana", 
                                                    text: "I have no clue what's going on! But I know JIM would never sell dangerous, unregulated supplements to the public!"
                                                },
                                                {
                                                    name: "ana",
                                                    text: "Don't you agree?",
                                                    prompt: [
                                                        "He definitely wouldn't",
                                                        [{
                                                            name: "ana", 
                                                            text: "I agree. He's a good man. Even if he's a hard ass..."
                                                        }],
                                                        "Have you met the guy?",
                                                        [{
                                                            name: "ana",
                                                            text: "I have. And I know that he's a good man. Even if he's a hard ass..."
                                                        }],
                                                    ],
                                                },
                                                {
                                                    name: "ana", 
                                                    text: "Let's get out of here! We need to tell JIM what's going on!", 
                                                    action: function() {
                                                        global.events.defeatDonnie = true;
                                                        debug("defeated donnie", -1);
                                                        global.roomChange = {
                                                            room: rOverworld, 
                                                            x: 1728, 
                                                            y: 1280 + 32, 
                                                            face: "down", 
                                                            transition: "fade"
                                                        };
                                                        objController.goToNextRoom();
                                                    }
                                                }
                                            ], false);
                                        }
                                    })
                                }
                            }
                        ], false);
                    }
                },
            ], false);
            break;
        case "smol powerlifter 1":
            textbox([
                {
                    name: "smol powerlifter", 
                    text: "Wow! I can't believe my highly specialized strength didn't translate to a real world activity..."
                },
                {
                    name: "smol powerlifter",
                    text: "Perhaps I should reconsider this whole powerlifting thing...",
                },
                {
                    name: "smol powerlifter", 
                    text: "Maybe next time we meet, you can show me how to squat without folding like a taco... GG ig.",
                    action: function() {
                        playSound(sndDeath);
                        array_push(global.enemiesDestroyed, "smol powerlifter 1");
                        with (objNPC)
                            if (npcID == "smol powerlifter 1")
                                instance_destroy();
                        textbox({
                            name: "", 
                            text: "SMOL POWERLIFTER blacked out."
                        });
                    }
                }
            ])
            break;
        case "super heavyweight 1":
            textbox([
                {
                    name: "super heavyweight", 
                    text: "I just saw my life flash before my eyes..."
                },
                {
                    name: "super heavyweight",
                    text: "Hundreds of heavy squats..."
                },
                {
                    name: "super heavyweight",
                    text: "Thousands of glasses of chocolate milk..."
                },
                {
                    name: "super heavyweight",
                    text: "Countless social media comments about how I bench more than random girls on the internet..."
                },
                {
                    name: "super heavyweight", 
                    text: "Life well spent!",
                    action: function() {
                        playSound(sndDeath);
                        array_push(global.enemiesDestroyed, "super heavyweight 1");
                        with (objNPC)
                            if (npcID == "super heavyweight 1")
                                instance_destroy();
                        textbox([
                            {
                                name: "",
                                text: "SUPER HEAVYWEIGHT has died."
                            },
                            {
                                name: "",
                                text: "You didn't kill him. He's been dealing with heart disease due to family history and poor lifestyle choices."
                            },
                        ])
                    }
                }
            ])
            break;    
        case "thicc powerlifter 1":
            textbox([
                {
                    name: "thicc powerlifter", 
                    text: "I'm MAN enough to admit I was wrong..."
                },
                {
                    name: "thicc powerlifter",
                    text: "Your musculature is truly impressive! Now allow me to give you some unsolicited advice:"
                },
                {
                    name: "thicc powerlifter",
                    text: "My big bro is in the next room. He won't be in your way if you're going to see the gym owner, but..."
                },
                {
                    name: "thicc powerlifter",
                    text: "There might be some sweet training gear in the room past him!"
                }, 
                {
                    name: "thicc powerlifter", 
                    text: "But if you don't think you're strong enough, just run away if he tries to fight you."
                },
                {
                    name: "thicc powerlifter", 
                    text: "Best of luck, bro ham.",
                    action: function() {
                        playSound(sndDeath);
                        array_push(global.enemiesDestroyed, "thicc powerlifter 1");
                        with (objNPC)
                            if (npcID == "thicc powerlifter 1")
                                instance_destroy();
                        textbox({
                            name: "", 
                            text: "THICC POWERLIFTER blacked out."
                        });
                    }
                }
            ])
            break;
        case "thicc powerlifter 2":
            textbox([
                {
                    name: "bud", 
                    text: "What a filthy way to end things, isn't it PAL?",
                    action: function() {
                        with (objNPC)
                            if (npcID == "smol powerlifter 2")
                                face = "right";
                            else if (npcID == "thicc powerlifter 2")
                                face = "left";
                    }
                },
                {
                    name: "pal", 
                    text: "I can't believe it. It's all your fault too. If you weren't afraid to go up a weight class, you wouldn't be so weak!",
                    action: function() {
                        with (objNPC)
                            if (npcID == "thicc powerlifter 2")
                                face = "left"
                    }
                },
                {
                    name: "bud", 
                    text: "HOW DARE YOU!",
                    tone: "loud",
                },
                {
                    name: "bud", 
                    text: string_upper("The real reason we lost is because you`took the bulk too far and couldn't keep `up with his cardio!"),
                    tone: "loud",
                },
                {
                    name: "pal",
                    text: "BUD... I have a confession to make."
                },
                {
                    name: "bud", 
                    text: "What is it, PAL?"
                },
                {
                    name: "pal", 
                    text: "I made fun of your sumo deadlift at the halloween party last week.",
                    action: function() {
                        array_push(global.enemiesDestroyed, "thicc powerlifter 2", "smol powerlifter 2");
                        with (objNPC)
                            if (npcID == "smol powerlifter 2" || npcID == "thicc powerlifter 2")
                                instance_destroy();
                        playSound(sndDeath);
                        textbox({
                            name: "", 
                            text: "BUD and PAL blacked out."
                        });
                    }
                },

            ]);
            break;
        default:
            debug($"no death action for {enemy}");
            break;
    }
}