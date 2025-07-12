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
                            name: "", 
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