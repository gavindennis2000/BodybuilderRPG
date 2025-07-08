// objNPC room start - handle enemiesToDestroy

/*gmlive*/ if (TEST) { if (live_call()) return live_result; }

debug(global.enemiesDestroyed);
if (array_contains(global.enemiesDestroyed, npcID))
    instance_destroy();

if (array_length(global.enemiesToDestroy) <= 0)
    exit;

for (var i = 0; i < array_length(global.enemiesToDestroy); i++) {
    var enemy = global.enemiesToDestroy[i];
    array_delete(global.enemiesToDestroy, i, 1);
    switch (enemy) {
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
                        textbox("SMOL POWERLIFTER blacked out.");
                    }
                }
            ])
            break;
        case "super heavyweight 1":
            textbox([
                {
                    name: "super heavyweight", 
                    text: "I've seen my life flash before my eyes..."
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
                        textbox("THICC POWERLIFTER blacked out.");
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
                                face = "right"
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
                    text: "BLASPHEMY!",
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
                        textbox("BUD and PAL blacked out");
                    }
                },

            ]);
            break;
        default:
            debug($"no death action for {enemy}");
            break;
    }
}