function handleEvents() {
    // at the start of a room, handle any events that have taken place

    /*gmlive*/ if (TEST) { if (live_call()) return live_result; }

    // test stuff
    if (TEST) {
        //
    }

    // natural disasters and stuff that happen every time
    if (true) {
        // the atlas stone in front of leangroudnburg
        if (room == rOverworld && !global.events.atlasStone)
            instance_create_layer(2016, 352, "Instances", objItem, {
                itemID: "atlas stone", 
            });
        // lock up wheyford barbell after defeating donnie
        if (room == rOverworld && !global.events.firstPay) {
            instance_create_layer(1728, 1280, "Instances", objItem, {
                itemID: "locked door", 
                finalText: "Closed for lunch. Be back soon. - Donnie"
            });
            instance_create_layer(1728 + 32, 1280, "Instances", objItem, {
                itemID: "locked door", 
                finalText: "Closed for lunch. Be back soon. - Donnie"
            })
        }
        else if (room == rOverworld && global.events.defeatDonnie && !global.events.endCh1) {
            instance_create_layer(1728, 1280, "Instances", objItem, {
                itemID: "locked door", 
                finalText: "Temporarily closed due to an accident."
            });
            instance_create_layer(1728 + 32, 1280, "Instances", objItem, {
                itemID: "locked door", 
                finalText: "Temporarily closed due to accident."
            })
        }
        // first time going to wheyford barbell
        if (room == rWheyfordBarbell && !global.events.firstTimeAtWheyfordBarbell)
            global.events.firstTimeAtWheyfordBarbell = true;
        // lock all doors after ch1 ends
        if (global.chapter == 1 && global.events.endCh1 && room == rOverworld) {
            with (objDoor)
                if (doorID != "mom")
                    instance_create_layer(x, y, "Instances", objItem, {
                        finalText: "It's late. I should go home."
                    });
        }
    }

    // chapter one events
    if (global.chapter == 1) {
        // the beginning of ch 1
        if (!global.events.startCh1 && room == rMom) {
            global.cutscene = true;
            textbox([
                {
                    name: "mom",
                    text: $"{string_upper(global.characterName)}!! ",
                    action: function() {
                        global.events.startCh1 = true;
                    }
                },
                {
                    name: "mom",
                    text: $"Get out of bed! You're going to be late for your new job!",
                    action: function() {
                        global.cutscene = false;
                        with (objMusic) 
                            alarm_set(0, 30);
                        with (objPlayer)
                            canMove = true;
                    }
                },
            ], true, true, "bottom")
        }
        
        // talk to mom when you go down the stairs
        else if (!global.events.meetMom && room == rMom) {
            textbox([
                {
                    name: "mom",
                    text: $"{string_upper(global.characterName)}, what is going on with you?",
                    prompt: [
                        "Tell her about the dream",
                        [
                            {
                                name: "mom",
                                text: "You had a dream about your \"bodybuilding destiny\"?",
                                emotion: "frustrated"
                            },
                        ],
                        "It's nothing",
                        [],
                    ],
                    action: function() {
                        with (objNPC)
                            if (npcID == "mom")
                                face = "right";
                    }
                },
                {
                    name: "mom",
                    text: "You have to take this seriously! You can't afford to lose another job because you'd rather go lift weights than show up to work!",
                    emotion: "angry",
                },
                {
                    name: "mom",
                    text: "*sigh* I can't deal with this today...",
                    tone: "quiet",
                    emotion: "frustrated",
                },
                {
                    name: "mom",
                    text: "Do you know how to get to work?",
                    prompt: [
                        "Yes",
                        [],
                        "No",
                        [
                            {
                                name: "mom",
                                text: "It's is in the northwest corner of town. Don't forget to introduce yourself to your boss, Mr. Ohner.",
                            }
                        ]
                    ]
                },
                {
                    name: "mom",
                    text: "Have a great first day, sweetie.",
                    emotion: "happy",
                    action: function() {
                        global.events.meetMom = true;
                    }
                },
            ])

        }
        
        // lock the doors at pump palace
        else if (!global.events.meetJim && room == rPumpPalace) {
            with (objDoor) {
                with (instance_create_layer(x, y, layer, objItem, {
                    itemID: "locked door",
                })) {
                    finalText = $"I have to meet with Mr. Ohner before I leave."
                };
            }
        }

        // meet ana for the first time
        else if (!global.events.meetAna && room == rOverworld) {
            // only introduce ana after the player has met jim
            if (!global.events.meetJim)
                exit;
            global.cutscene = true;
            global.cutsceneSong = sndAna;
            textbox([
                {
                    name: "ana",
                    alias: "???",
                    text: "Hey! Wait!",
                    action: function() {
                        // player faces ana
                        with (objPlayer)
                            face = "right";
                        // create ana npc
                        instance_create_layer(objPlayer.x + 96, objPlayer.y + 128, "Instances", objNPC, {
                            directions: ["up", "up", "up", "up", "left", "left"],
                            npcID: "ana",
                            faceStart: "left",
                            action: [
                                {
                                    name: "ana",
                                    text: "Where do you think you're going?",
                                    emotion: "angry",
                                    prompt: [
                                        "Making a delivery",
                                        [
                                            {
                                                name: "ana",
                                                text: $"I went through all that work putting in a good word for you and he makes you a delivery boy?",
                                                emotion: "frustrated"
                                            },
                                            {
                                                name: "ana",
                                                text: "*sigh* at least you're not sneaking off to lift weights again...",
                                                tone: "quiet"
                                            }
                                        ],
                                        "Skipping work to pump iron",
                                        [
                                            {
                                                name: "ana",
                                                text: $"That's not funny! If you lose this job, it'll make me look bad.",
                                                emotion: "frustrated"
                                            }, 
                                            {
                                                name: "ana",
                                                text: "Just because we work at a gym doesn't mean we're getting paid to lift weights all the time!"
                                            }
                                        ]
                                    ]
                                },
                                {
                                    name: "ana",
                                    text: $"Whatever... I don't have any clients to train today, so I'm gonna tag along.",
                                    emotion: "happy",
                                    canMove: false,
                                    action: function() {
                                        with (objNPC) if (npcID == "ana") {
                                            directions = ["left"]; 
                                            action = function() {
                                                global.events.meetAna = true;
                                                playSound(sndLevelUp);
                                                textbox("ANA has joined the party.");
                                                global.cutscene = false;
                                                global.cutsceneSong = -1;
                                                audio_sound_gain(global.songPlaying, 0, 500);
                                                with (objMusic)
                                                    alarm_set(0, 30);
                                                instance_destroy(self, false);
                                            }; 
                                            alarm_set(1, 1);
                                        }
                                    }
                                }
                            ]
                        })
                    },
                }
            ], false);
        }

        // catch the robber at bbnc
        else if (!global.events.bbnc && room == rStores && global.roomVar = "BBNC") {
            
            // don't do this unless ana is in the party
            if (!global.events.meetAna)
                exit;
                
            // set the music and cutscene curtains
            global.cutscene = true;
            global.cutsceneSong = sndDanger;

            // create the robber
            instance_create_layer(256, 140, "Instances", objNPC, {
                npcID: "robber",
                faceStart: "up",
                face: "up"
            });

            // create ana
            instance_create_layer(objPlayer.x, objPlayer.y, "Instances", objNPC, {
                npcID: "ana",
                directions: ["right"],
                action: function() {
                    with (objNPC) {
                        if (npcID == "ana") {
                            faceStart = "up";
                            face = "up";
                        }
                    }
                }
            });
            
            // functions for dialog and npc stuff
            var bbncFight = function() {
                global.events.bbnc = true;
                global.cutscene = false;
                startBattle(["robber"], false);
            }

            // the dialog
            textbox([
                {
                    name: "enemy",
                    alias: "robber",
                    text: "Now! Put the CREATINE in the bag!",
                    tone: "loud"
                },
                {
                    name: "clerk",
                    text: "Please sir! I do not sell this so-called CREATINE at me store...",
                },
                {
                    name: "enemy",
                    alias: "robber",
                    text: "I've heard enough of your crap! Prepare to get MANHANDLED!",
                    tone: "loud"
                },
                {
                    name: "clerk",
                    text: "Mama mercy! Hey you there... Call the police!"
                },
                {
                    name: "ana",
                    text: $"He's getting robbed {string_upper(global.characterName)}!",
                    action: function() {
                        with (objNPC) if (npcID == "ana") {
                            faceStart = "left";
                            face = "left";
                        }
                    } 
                },
                {
                    name: "ana",
                    text: "What should we do!?",
                    prompt: [
                        "Stay and fight",
                        [
                            {
                                name: "andro",
                                text: $"We need to fight! It's our moral duty to use our muscles for justice!",
                                emotion: "angry"
                            },
                            {
                                name: "ana",
                                text: "I couldn't agree more. Brace yourself!",
                                emotion: "angry",
                            },
                            {
                                name: "enemy", 
                                alias: "robber",
                                text: "Sheeitt! When did you meddling kids get here!?", 
                                tone: "loud", 
                                action: function() {
                                    with (objNPC) {
                                        if (npcID == "ana")
                                            face = "up";
                                        else if (npcID == "robber")
                                            face = "down";
                                    }
                                }
                            }, 
                            {
                                name: "enemy",
                                alias: "robber",
                                text: "You think you can take on me? Prepare for an ASS-WIPIN you won't soon forget!", 
                                tone: "loud",
                            },
                            {
                                name: "ana", 
                                text: "I think you mean ASS-WHOOPIN, ass wipe!"
                            }, 
                            {
                                name: "enemy", 
                                alias: "robber",
                                text: "Grrrr! FEEL THE WRATH OF EL ROBBERTO!", 
                                tone: "loud",
                                action: bbncFight
                            }
                        ],
                        "Run away",
                        [
                            {
                                name: "andro",
                                text: $"It's not safe here... We need to run and get help!",
                                emotion: "angry",
                            },
                            {
                                name: "enemy",
                                alias: "robber",
                                text: "Not so fast! You're not going anywhere!",
                                tone: "loud",
                                action: function() {
                                    with (objNPC) {
                                        if (npcID == "robber")
                                            face = "down";
                                        else if (npcID == "ana")
                                            face = "up";
                                    }
                                }
                            },
                            {
                                name: "enemy",
                                alias: "robber",
                                text: "You leave that door, and clerky here is getting the AXE!",
                                tone: "loud"
                            },
                            {
                                name: "ana",
                                emotion: "angry",
                                text: "Guess we don't have much of a choice... Brace yourself!",
                                action: bbncFight
                            }
                        ]
                    ]
                }
            ], false, true, "top");
        }
        
        // robber defeated cutscene
        else if (!global.events.bbnc2 && room == rStores) {

            // make sure the first event has happened at bbnc
            if (!global.events.bbnc)
                exit;
            
            global.cutscene = true;
            global.cutsceneSong = -1;
            
            // create the robber
            instance_create_layer(256, 140, "Instances", objNPC, {
                npcID: "robber",
                faceStart: "down",
                face: "down",
                flashing: true,
            });
            textbox([
                {
                    name: "enemy",
                    alias: "robber",
                    text: "Impossible! How could I be defeated by two kids!",
                },
                {
                    name: "enemy",
                    alias: "robber",
                    text: "If only I had some CREATINE...",
                },
                {
                    name: "enemy",
                    alias: "robber",
                    text: "I would have... been...",
                },
                {
                    name: "enemy",
                    alias: "robber",
                    text: "Unstoppable...",
                    action: function() {
                        with (objNPC) {
                            if (npcID == "robber")
                                instance_destroy();
                        }
                        textbox({
                            text: "ROBBER blacked out."
                        });
                        endCutscene();
                        global.events.bbnc2 = true;
                    }
                },
            ]);
        }

        // skip talking to bbnc owner if you go outside
        else if (!global.events.bbncTalkToOwner && room == rOverworld) {
            
            // only activate this if you defeated the robber
            if (!global.events.bbnc2)
                exit;

            instance_create_layer(objPlayer.x, objPlayer.y, "Instances", objNPC, {
                npcID: "ana",
                directions: ["right"],
                action: function() {
                    with (objNPC) if (npcID == "ana")
                        face = "left";
                    with (objPlayer)
                        face = "right";
                }
            });
            textbox({
                name: "ana",
                text: $"{string_upper(global.characterName)}! Let's get back to Pump Palace so we can tell Jim what happened!",
                canMove: false,
                action: function() {
                    // ana comes out, talks to the player, then exits
                    with (objNPC) if (npcID == "ana") {
                            directions = ["left"];
                            action = function() {
                                global.events.bbncTalkToOwner = true;
                                with (objPlayer) {
                                    face = "down";
                                    canMove = true;
                                }
                                instance_destroy(self, false);
                            }
                            alarm_set(1, 1);
                    }
                }
            }, false)
        }

        // meet samson after defeating donnie
        else if (!global.events.meetSamson && global.events.defeatDonnie && room == rOverworld) {
            global.events.meetSamson = true;
            global.cutscene = true;
            global.cutsceneSong = sndSamson;
            with (objPlayer)
                face = "down";
            instance_create_layer(objPlayer.x - 32 * 7, objPlayer.y, "Instances", objNPC, {
                npcID: "samson",
                face: "right", 
                faceStart: "right",
                // spd: 4,
                directions: ["right", "right", "right", "right", "right", "right"], 
                action: function() {
                    with (objPlayer)
                        face = "left";
                    textbox([
                        {
                            name: "samson", 
                            alias: "???",
                            text: "Well, well, well... I heard there's a new fish in the pond!",
                            prompt: [
                                "Who... are you!?", 
                                [
                                    {
                                        name: "samson",
                                        alias: "???", 
                                        text: "You haven't heard of me? This isn't ideal."
                                    }
                                ], 
                                "Get lost. I'm busy", 
                                [
                                    {
                                        name: "samson", 
                                        alias: "???",
                                        text: "That's some serious confidence coming from a 160 pounder in a stringer!"
                                    }
                                ],
                            ]
                        }, 
                        {
                            name: "samson", 
                            alias: "???",
                            text: "My name is SAMSON, and I'm the number one ranked bodybuilder in the country!"
                        },
                        {
                            name: "samson",
                            text: "*protein shake burp*"
                        }, 
                        {
                            name: "samson", 
                            text: "I heard the old fart that runs this place got taken down by some rookie and his girlfriend. Thought I should come check it out."
                        },
                        {
                            name: "samson", 
                            text: "I'm dedicated to keeping Wheyford CREATINE free, so I thank you for sweeping up that dust pile."
                        },
                        {
                            name: "samson", 
                            text: "But don't think that makes us friends or anything."
                        },
                        {
                            name: "samson", 
                            text: "There's a bodybuilding show in Central Prairie in a few weeks. Feel free to stop by if you want to get humiliated by yours truly."
                        },
                        {
                            name: "samson", 
                            text: "Until then, I'm off to get a freaky pump. Sayonara!",
                            action: function() {
                                with (objNPC)
                                    if (npcID == "samson") {
                                        directions = ["left", "left", "left", "left", "left", "left", "left"];
                                        action = function() {
                                            global.cutscene = false;
                                            global.cutsceneSong = -1;
                                            with (objPlayer)
                                                canMove = true;
                                            instance_destroy(self, false);
                                            with (objMusic) {
                                                getCurrentSong();
                                                audio_sound_gain(global.songPlaying, 0, aTime * 4);
                                                alarm_set(0, aTime);
                                            }
                                        }
                                        alarm_set(1, 1);
                                    }
                            }
                        }
                    ], false);
                }
            })
        }
    
        // say goodbye to ana
        else if (!global.events.goodbyeAna && room == rOverworld) {
            
            // wait til the end of ch1 to do this
            if (!global.events.endCh1)
                exit;

            textbox([
                {
                    name: "ana", 
                    text: $"Well, {string_upper(global.characterName)}. It's been a crazy day...",
                    action: function() {
                        instance_create_layer(objPlayer.x, objPlayer.y, "Instances", objNPC, {
                            npcID: "ana", 
                            directions: ["right"], 
                            face: "right", 
                            action: function() {
                                with (objNPC) if (npcID == "ana")
                                    face = "left";
                                with (objPlayer)
                                    face = "right";
                            }
                        })
                    }
                },
                {
                    name: "ana", 
                    text: "I promise it's not always this exciting working at Pump Palace! You'll see tomorrow."
                },
                {
                    name: "ana", 
                    text: "Ummm. Do you want me to walk home with you?", 
                    prompt: [
                        "No, thanks",
                        [],
                        "I'm a grown-ass man, Anabel",
                        []
                    ]
                },
                {
                    name: "ana", 
                    text: "You're right... What am I saying. It's just..."
                },
                {
                    name: "ana", 
                    text: "Everything about this day has been a nightmare. I'm probably just worrying too much."
                },
                {
                    name: "ana", 
                    text: "Well anyways, I'll see you tomorrow. Good night!", 
                    action: function() {
                        with (objPlayer)
                            face = "down";
                        with (objNPC) if (npcID == "ana") {
                            face = "down";
                            faceStart = "down";
                            directions = ["down", "down", "down", "down"];
                            action = function() {
                                debug($"party before: {global.party}", -1);
                                textbox("ANA left the party.");
                                global.party = ["andro"];
                                debug($"party after: {global.party}", -1);
                                global.events.goodbyeAna = true;
                                instance_destroy(self, false);
                            }
                            alarm_set(1, 1);

                        }
                    }
                }
            ], false, true);
            
        }
    }
}