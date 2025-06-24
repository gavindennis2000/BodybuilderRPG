function handleEvents(){
    // at the start of a room, handle any events that have taken place

    /*gmlive*/ if (TEST) { if (live_call()) return live_result; }

    // the beginning of ch 1
    if (!global.events.startCh1 && room == rMom) {
        global.events.startCh1 = true;
        audio_pause_sound(global.songPlaying);
        textbox([
            {
                text: $"Whoa... was that all just a dream?",
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
            instance_create_layer(x, y, layer, objItem, {
                itemID: "locked door",
                text: $"I have to meet with Mr. Ohner before I leave.",
            });
        }
    }

    // meet ana for the first time
    else if (!global.events.meetAna && global.events.meetJim && room == rOverworld) {
        // only introduce ana after the player has met jim
        if (!global.events.meetJim)
            exit;
        global.events.meetAna = true;
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
        // global.events.bbnc = true;
        debug("bbnc robbery");
        global.cutscene = true;
        global.cutsceneSong = sndTrouble;
        // create the robber
        instance_create_layer(256, 96, "Instances", objNPC, {
            npcID: "robber",
            faceStart: "up",
            face: "up"
        });
        textbox([
            {
                name: "enemy",
                alias: "robber",
                text: "Now! Put the CREATINE in the bag!",
                tone: "loud"
            },
            {
                name: "clerk",
                text: "Please sir! I donut sell this so-called CREATINE at me store...",
                tone: "quiet"
            },
            {
                name: "enemy",
                alias: "robber",
                text: "I've heard enough of your crap... Prepare to get MANHANDLED!"
            },
            {
                name: "clerk",
                text: "Mama mercy! Hey you there... Call the police!"
            },
            {
                name: "ana",
                text: $"He's getting robbed {string_upper(global.characterName)}!",
                tone: "quiet"
            },
            {
                name: "ana",
                text: "What should we do!?",
                tone: "quiet",
                prompt: [
                    "Stay and fight",
                    [
                        {
                            name: "andro",
                            text: $"We need to fight! It's our moral obligation to use our impressive muscles for justice!",
                            emotion: "angry"
                        },
                        {
                            name: "ana",
                            text: "I couldn't agree more. Brace yourself!",
                            emotion: "angry",
                            action: "bbnc robbery fight"
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
}