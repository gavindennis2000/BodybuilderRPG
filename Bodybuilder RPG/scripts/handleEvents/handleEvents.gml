function handleEvents(){
    // at the start of a room, handle any events that have taken place

    /*gmlive*/ if (TEST) { if (live_call()) return live_result; }

    var func;
    
    // test
    if (TEST) {
        //
    }

    // the beginning of ch 1
    if (!global.events.startCh1 && room == rMom) {
        global.events.startCh1 = true;
        audio_pause_sound(global.songPlaying);
        textbox([
            {
                text: $"Was that all just a dream?",
            },
            {
                name: "mom",
                text: $"{string_upper(global.characterName)}!!",
                emotion: "angry"
            },
            {
                name: "mom",
                text: $"You're going to be late for your new job!!",
                emotion: "angry",
                action: "resume song"
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
                action: "enter ana",
            }
        ], false);
    }

    // catch the robbers at bbnc
    else if (!global.events.bbnc && global.events.meetAna && room == rStores && global.roomVar = "BBNC") {
        
        // set the music and cutscene curtains
        global.cutscene = true;
        global.cutsceneSong = sndDanger;

        // create the robber
        instance_create_layer(256, 128, "Instances", objNPC, {
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
        var anaFacePlayer = function() {
            with (objNPC) {
                if (npcID != "ana")
                    exit;
                faceStart = "left";
                face = "left";
            }
        }
        var bbncFight = function() {
            global.events.bbnc = true;
            global.cutscene = false;
            startBattle(true, ["robber"], false);
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
                action: anaFacePlayer
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
                            action: bbncFight
                        }
                    ],
                    "Run away",
                    [
                        {
                            name: "andro",
                            text: $"It's not safe here... We need to run and get help!",
                            emotion: "angry",
                            action: "bbnc robbery 2"
                        }
                    ]
                ]
            }
        ], false);
    }
    else if (!global.events.bbnc2 && room == rStores) {
        global.events.bbnc2 = true;
        debug("bbnc robbery2");
        global.cutscene = true;
        global.cutsceneSong = -1;
        // create the robber
        instance_create_layer(256, 128, "Instances", objNPC, {
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
                action: "destroy robber"
            },
        ]);
    }
    else if (!global.events.bbncTalkToOwner && room == rOverworld) {
        if (!global.events.bbnc2)
            exit;
        debug("skipped talking to bbnc owner");
        instance_create_layer(objPlayer.x, objPlayer.y, "Instances", objNPC, {
            directions: ["right"],
            action: function() {
                with (objNPC)
                    if (npcID == "ana")
                        face = "left";
            }
        });
        var anaTalk = function() {
            // ana comes out, talks to the player, then exits
            debug("ana talk");
            global.events.bbncTalkToOwner = true;
            with (objNPC) {
                if (npcID == "ana") {
                    directions = ["left"];
                    action = function() {
                        with (objPlayer)
                            canMove = true;
                        instance_destroy();
                    }
                    alarm_set(1, 1);
                }
            }
        }
        textbox({
            name: "ana",
            text: $"{string_upper(global.characterName)}! Let's get back to Pump Palace so we can tell Jim what happened!",
            action: anaTalk
        }, false)
    }
}