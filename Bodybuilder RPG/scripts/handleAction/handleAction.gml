function handleAction(action) {
    // handles action from dialog

    /*gmlive*/ if (TEST) { if (live_call(action)) return live_result; }

    switch (action) {
        case "ana joins party 1":
            var npcX, npcY;
            with (objNPC) {
                if (npcID != "ana")
                    exit;
                debug("found her");
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
            objPlayer.face = "down";
            with (objNPC) {
                if (npcID != "ana")
                    exit;
                instance_destroy();
            }
            textbox({
                text: "ANA has joined the party."
            }, true);
            global.party = ["andro", "ana"];
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
                                    text: $"I went through all that work putting in a good word for you at the gym and he makes you a delivery boy?",
                                    emotion: "frustrated"
                                }
                            ],
                            "None of your business",
                            [
                                {
                                    name: "ana",
                                    text: $"I can't believe you'd give me attitude after I helped you get this job.",
                                    emotion: "angry"
                                }
                            ]
                        ]
                    },
                    {
                        name: "ana",
                        text: $"Whatever. I don't have any clients to train today, so I'm gonna tag along.",
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
            break;
    }
    debug($"action handled: {action}");

    return;
}