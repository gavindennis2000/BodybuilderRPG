// objController step - triggered cutscenes

/*gmlive*/ if (TEST) { if (live_call()) return live_result; }

// pause
if (input_check_pressed("start")) {
    if (!instance_exists(objPlayer))
        { /* do nothing */}
    else if (!objPlayer.canCertainlyMove)
        { /* do nothing */}
    else if (global.cutscene || room == rBattle)
        { /* do nothing */}
    else {
        global.paused = !global.paused;
        debug(global.paused);
    }
}

// prologue space world stuff
if (room == rSpace && global.chapter == 1) {
    if (objPlayer.spaceFog <= 0.5 && !global.events.prologueStart) {
        global.events.prologueStart = true;
        textbox([
            {
                name: "gods of gains", 
                alias: "???",
                text: $"Greetings, {string_upper(global.characterName)}."
            },
            {
                name: "gods of gains", 
                alias: "???",
                text: "Welcome to Massgard, the embodiment of swoletuism in the cosmos!"
            },
            {
                name: "gods of gains", 
                text: "We are the GODS OF GAINS, and we have chosen you to become the greatest bodybuilder in the history of mankind!"
            },
            {
                name: "gods of gains", 
                text: "This will be no easy task... Are you up for the challenge?",
                prompt: [
                    "Yes",
                    [{
                        name: "gods of gains", 
                        text: "We are impressed by your confidence, young Chadawan."
                    },
                    {
                        name: "gods of gains",
                        text: $"We bless you with a gift to assist you on your journey. Proceed forward to claim it."
                    }],
                    "No",
                    [{
                        name: "gods of gains",
                        text: $"Don't be afraid, {string_upper(global.characterName)}."
                    },
                    {
                        name: "gods of gains",
                        text: "You have the rare combination of work ethic and talent necessary to be a bodybuilding champion."
                    },
                    {
                        name: "gods of gains",
                        text: $"We bless you with a gift to assist you on your journey. Proceed forward to claim it."
                    }]
                ]
            }
        ])
    }
    else if (objPlayer.y <= 559 && !instance_exists(objTextbox) && !global.events.prologueDecision) {
        textbox([
            {
                name: "gods of gains",
                text: "Three potential gifts await you:"
            },
            {
                name: "gods of gains",
                text: "On the left, the NECTAR OF THE GODS!"
            },
            {
                name: "gods of gains", 
                text: "Providing you with nearly infinite recovery, the NECTAR OF THE GODS will protect you on your journey."
            },
            {
                name: "gods of gains", 
                text: "Choose this route if you are looking for an easier, more casual adventure."
            },
            {
                name: "gods of gains", 
                text: "The middle option is the GOLDEN DRUMSTICK!"
            },
            {
                name: "gods of gains", 
                text: "This will give you an adequately challenging journey. Choose this if you are an experienced lifter."
            },
            {
                name: "gods of gains", 
                text: "Finally, on the right you will find the TRAPEZIUS OF POWER!"
            },
            {
                name: "gods of gains",
                text: "We're not sure what the hell this thing does, honestly."
            },
            {
                name: "gods of gains",
                text: "All we know is, it will actually make your journey harder for no reason."
            },
            {
                name: "gods of gains",
                text: "We only recommend taking this if you are an absolute masochist, but you do you.",
            },
            {
                name: "gods of gains", 
                text: $"The decision is yours! Come forth now, {string_upper(global.characterName)}!",
                action: function() {
                    global.events.prologueDecision = true;
                }
            }


        ], true, true, "top");
    }
}

// meet arnold terminager
if (global.chapter == 1 && room == rOverworld && global.events.endCh1 && !global.events.meetArnold && objPlayer.x == 1856 && objPlayer.y == 736 && !global.cutscene) {
    global.cutscene = true;
    
    // cutscene music
    global.cutsceneSong = sndDanger;
    with (objMusic) 
        alarm_set(0, 1);

    with (objPlayer)
        canMove = false;
    textbox({
        name: "enemy", 
        alias: "???", 
        text: "Nice night for walk.", 
        action: function() {
            with (objPlayer)
                face = "down"

            instance_create_layer(objPlayer.x, objPlayer.y + 32 * 4, "Instances", objNPC, {
                face: "up", 
                npcID: "arnold terminager",
                faceStart: "up", 
                directions: ["up", "up", "up"], 
                action: function() {
                    textbox([
                        {
                            name: "enemy",
                            alias: "large austrian man", 
                            text: "Yes. It is me. Large Australian man from Pump Palace bodybuilding gym."
                        },
                        {
                            name: "enemy",
                            alias: "large australian man", 
                            text: "You thought I was Austrian? Nein, I am man from Australia."
                        },
                        {
                            name: "enemy",
                            alias: "large australian man", 
                            text: "The boss has given me orders to terminate you."
                        }, 
                        {
                            name: "enemy",
                            alias: "large australian man", 
                            text: "I'm in a good mood from my excellent workout earlier. So instead, I will just kick your ass as a warning. Guess It's your \"Gluckstag\" today.",
                        },
                        {
                            text: $"LARGE AUSTRALIAN MAN beats the bejesus out of {string_upper(global.characterName)}.",
                            action: function() {
                                playSound(sndHitAndro);
                                with (objPlayer)
                                    ko = true;
                            }
                        },
                        {
                            name: "enemy",
                            alias: "large australian man", 
                            text: "Das is all. You better not speak a word of this. Otherwise...",
                        },
                        {
                            name: "enemy",
                            alias: "large australian man", 
                            text: "I'LL COME BACK.",
                            action: function() {
                                with (objNPC)
                                    if (npcID == "arnold terminager") {
                                        directions = ["down", "down", "down", "down"]; 
                                        action = function() {
                                            global.cutsceneSong = -1;
                                            global.roomChange = {
                                                room: rMom, 
                                                x: 352, 
                                                y: 160, 
                                                face: "left", 
                                                transition: "fade"
                                            }
                                            global.events.meetArnold = true;
                                            audio_sound_gain(global.songPlaying, 0, 2000);
                                            instance_destroy(self, false);
                                        }
                                        alarm_set(1, 1);
                                    }

                            }
                        }
                    ]);
                }
            });
        }
    }, false);
}
else if (global.chapter == 1 && room == rOverworld && global.events.endCh1 && global.events.meetArnold) {
    if (fadeAmount < 1.5)
        fadeAmount += 0.005;
    else {
        fadeAmount = 0;
        global.cutscene = false;
        with (objPlayer)
            instance_destroy();
        global.chapter++;
        room_goto(rMom);
    } 
}