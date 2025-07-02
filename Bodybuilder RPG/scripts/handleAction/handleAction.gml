function handleAction(action) {
    // handles action from dialog

    /*gmlive*/ if (TEST) { if (live_call(action)) return live_result; }

    switch (action) {
        case "ana joins party 1":
            var npcX, npcY;
            with (objNPC) {
                if (npcID != "ana")
                    exit;
                npcX = x;
                npcY = y;
                instance_destroy();
            }
            instance_create_layer(npcX, npcY, "Instances", objNPC, {
                npcID: "ana",
                action: "ana joins party 2",
                directions: ["left"]
            });
            break;
        case "ana joins party 2":
            global.events.meetAna = true;
            var func = playSound(sndLevelUp);
            objPlayer.face = "down";
            with (objNPC) {
                if (npcID != "ana")
                    exit;
                instance_destroy();
            }
            textbox({
                text: "ANA has joined the party.",
                action: func
            }, true);
            if (!array_contains(global.party, "ana"))
                array_insert(global.party, array_length(global.party), "ana");
            global.cutscene = false;
            with (objMusic) {
                audio_sound_gain(global.songPlaying, 0, aTime * 4);
                alarm_set(0, aTime);
            }
            break;
        case "bbnc robbery 2":
            // handle further dialog with robber in bbnc
            var bbncFight = function() {
                global.events.bbnc = true;
                global.cutscene = false;
                startBattle(true, ["robber"], false);
            }
            with (objNPC) {
                if (npcID == "robber") {
                    faceStart = "down";
                    face = "down";
                }
                if (npcID == "ana") {
                    faceStart = "up";
                    face = "up";
                }
            }
            textbox([
                {
                    name: "enemy",
                    alias: "robber",
                    text: "Not so fast! You're not going anywhere!",
                    tone: "loud"
                },
                {
                    name: "enemy",
                    alias: "robber",
                    text: "You leave that door, and clerky here is getting the axe.",
                    tone: "loud"
                },
                {
                    name: "ana",
                    emotion: "angry",
                    text: "Guess we don't have much of a choice... Brace yourself!",
                    action: bbncFight
                }
            ], false);
            break;
        case "destroy robber":
            with (objNPC) {
                if (npcID == "robber")
                    instance_destroy();
            }
            playSound(sndDeath);
            textbox({
                text: "ROBBER blacked out."
            });
            global.cutscene = false;
            global.cutsceneSong = -1;
            with (objMusic) {
                getCurrentSong();
                audio_sound_gain(global.songPlaying, 0, aTime * 4);
                alarm_set(0, aTime);
            }
            break;
        case "enter ana":
            with (objPlayer)
                face = "right";
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
                        action: "ana joins party 1"
                    }
                ]
            })
            break;
        case "resume song":
            audio_resume_sound(global.songPlaying);
            break;
        case "meet mom":
            global.events.meetMom = true;
            break;
        case "meet jim":
            global.events.meetJim = true;
            with (objItem) {
                if (itemID == "locked door")
                    instance_destroy();
            }
            break;
    }
    debug($"action handled: {action}");

    return;
}