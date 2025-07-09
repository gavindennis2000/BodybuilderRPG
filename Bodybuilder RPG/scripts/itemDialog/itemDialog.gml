function itemDialog(itemID = -1) {
    // handles dialog for items

    /*gmlive*/ if (TEST) { if (live_call(itemID)) return live_result; }
    
    text = {
        text: "No text available."
    };

    switch (itemID) {
        case "atlas stone":
            text = $"A massive atlas stone blocks your path."
            break;
        case "bbnc owner":
            var func = function() {
                global.events.bbncTalkToOwner = true;
            }
            var kickedOut = function() {
                // kicks player out of his store
                global.roomChange = {
                    x: 1248, 
                    y: 1056 + 32, 
                    face: "down", 
                    room: rOverworld, 
                    transition: "fade"
                }
                with (objPlayer)
                    canMove = false;
                with (objController)
                    goToNextRoom();
                playSound(sndError);
            }
            if (global.events.bbnc2 && !global.events.bbncTalkToOwner) {

                // npc creation and functions
                var createAna = function() {
                    instance_create_layer(objPlayer.x, objPlayer.y, "Instances", objNPC, {
                        npcID: "ana", 
                        directions: ["right"], 
                        action: function() {
                            with (objNPC) {
                                if (npcID == "ana") {
                                    faceStart = "left";
                                    face = "left";
                                }
                            }
                        }
                    });
                }

                var exitAna = function() {
                    with (objNPC) {
                        if (npcID == "ana") {
                            directions = ["left"]; 
                            action = function() {
                                global.events.bbncTalkToOwner = true;
                                with (objPlayer)
                                    canMove = true;
                                instance_destroy();
                            }
                            alarm_set(1, 1);
                        }
                    }
                }
                text = [
                    {
                        name: "clerk",
                        text: "You saved me! Thank you so much!"
                    },
                    {
                        name: "clerk",
                        text: "You have a package delivery for me? This day has really turned around! Weehee!"
                    },
                    {
                        name: "clerk",
                        text: "I see you have quite the muscles on you, boy. Please come back any time to get my top-shelf supplements!"
                    },
                    {
                        name: "clerk",
                        text: "As for the package, I'll use Western Onion to remotely pay Jim. I promise. You definitely don't need to tell him.",
                    },
                    {
                        name: "ana",
                        text: $"{string_upper(global.characterName)}!",
                        action: createAna
                    },
                    {
                        name: "ana",
                        text:  "Let's get back to Pump Palace so we can tell Jim what happened!",
                        action: exitAna
                    }
                ]
            }
            else {
                text = [
                    {
                        name: "Clerk",
                        text: $"Welcome to BBNC! Home to all your hypertrophy needs!"
                    },
                    {
                        name: "Clerk",
                        text: $"Are you looking to buy some supplements?",
                        prompt: [
                            "Yes",
                            [],
                            "No",
                            [
                                {
                                    name: "clerk",
                                    text: "Did you read the sign, meat wipe?"
                                },
                                {
                                    name: "clerk",
                                    text: "NO SOLICITING! GET OUT!",
                                    tone: "loud",
                                    action: kickedOut
                                }
                        ]
                        ]
                    }
                ];
            }
            break;
        case "chest":
            if (opened) {
                text = "no text";
                break;
            }
            else {
                array_push(global.openedChests, chestID);
                opened = true;
            }
            switch (chestID) {
                case "wheyford barbell 1":
                    text = {
                        text: "You found a key.",
                        preAction: function() {
                            playSound(sndDoor);
                            global.keyItems.wheyfordBarbellKey = true;
                            // with (objItem)
                            //     if (chestID == "wheyford barbell 1")
                            //         opened = true;
                        }
                    }
                    break;
                case "wheyford barbell 2":
                    text = {
                        text: "TODO todo put item here",
                        preAction: function() {
                            playSound(sndDoor);
                        }
                    }
                    break;
                case "wheyford barbell 3":
                    text = {
                        text: "You found a Choc. Milk.",
                        preAction: function() {
                            playSound(sndDoor);
                            addToInventory("Choc. Milk", 1);
                            debug(global.inventory, -1)
                        }
                    }
                    break;
            }
            break;
        case "gymtendo 64":
            text = [
                {
                    text: "My Gymtendo 64!"
                },
                {
                    text: "I wonder if Ocarina of Gains still works..."
                }
            ];
            break;
        case "home bed":
            if (!global.events.meetJim)
                text = $"I have to get ready for work!";
            else {
                text = $"No time for a nap right now.";
            }
            break;
        case "home bench press":
            text = [
                {
                    text: "Bench press. My favorite lift!"
                }, 
                {
                    text: "If I'm quick, I can knock out a few sets before work..."
                },
                {
                    name: "mom",
                    text: $"{string_upper(global.characterName)}!!"
                }, 
                {
                    text: "Never mind. Maybe tonight."
                }
            ]
            break;
        case "mirror":
            switch (global.character) {
                case "andro":
                    text = "Hey, big guy! Lookin large!";
                    break;
                case "ana":
                    text = "I can't believe the game developer made my arms so small!";
                    break;
                case "doms":
                    text = "My calves need some work. Very happy with the progress my lats have made, though.";
                    break;
                case "samson":
                    text = "I'm ashamed of myself. Can't believe I skipped cardio today!";
                    break;
            }
            break;
        case "wfbb switch 1":
        case "wfbb switch 3":
            var flipSwitch = function() {
                with (objItem) {
                    if (itemID == "wfbb roadblock 1") {
                        image_blend = c_blue;
                        mask_index = -1;
                        sprite_index = -1;
                    }
                    if (TEST && itemID == "wfbb roadblock 2") {
                        image_blend = c_blue;
                        mask_index = -1;
                        sprite_index = -1;
                    }
                }
            }
            text = {
                text: "It's a switch. Press it?",
                prompt: [
                    "Yes", 
                    flipSwitch,
                    "YES, IN ALL CAPS",
                    flipSwitch
                ]
            }
            break;
        case "wfbb switch 2":
            var flipSwitch = function() {
                with (objItem) {
                    if (itemID == "wfbb roadblock 2") {
                        image_blend = c_blue;
                        mask_index = -1;
                        sprite_index = -1;
                    }
                }
            }
            text = [
                {
                    text: "It's a switch. Press it?",
                    prompt: [
                        "Yes", 
                        flipSwitch,
                        "No! It's a trap!",
                        [
                            {
                                text: "Are you sure? What's the worst that could happen?",
                                prompt: [
                                    "Alright fine",
                                    flipSwitch,
                                    "I refuse",
                                    []
                                ]
                            }, 
                        ]
                    ]
                }
            ]
            break;
        case "wheyford barbell boss":
            text = (global.keyItems.wheyfordBarbellKey) ? {
                text: "", 
                preAction: function() {
                    debug("did it work?", -1);
                    with (objItem)
                        if (itemID == "wheyford barbell boss")
                            instance_destroy();
                    instance_destroy(objTextbox);
                }
            } : "The door is locked.";
            break;
        default:
            text = {
                text: $"{itemID}"
            };
            break;
    }	

    /*gmlive*/ if (TEST) { if (live_call()) return live_result; }
}