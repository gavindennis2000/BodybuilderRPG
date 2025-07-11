// objController step - triggered cutscenes

/*gmlive*/ if (TEST) { if (live_call()) return live_result; }

// meet arnold terminager
if (global.chapter == 1 && room == rOverworld && global.events.endCh1 && !global.events.meetArnold && objPlayer.x == 1856 && objPlayer.y == 736 && !global.cutscene) {
    global.cutscene = true;
    
    // cutscene music
    global.cutsceneSong = sndDanger;
    // with (objMusic) 
        // alarm_set(0, 1);

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
                            text: "You thought I was Austrian? No, I am man from Australia."
                        },
                        {
                            name: "enemy",
                            alias: "large australian man", 
                            text: "The boss gave me orders to take care of you."
                        }, 
                        {
                            name: "enemy",
                            alias: "large australian man", 
                            text: "I'm in a good mood from my workout earlier. So this will just be a warning. Guess It's your lucky day.",
                        },
                        {
                            name: "", 
                            text: $"LARGE AUSTRALIAN MAN beat the bejohnson out of {string_upper(global.characterName)}.",
                            action: function() {
                                with (objPlayer)
                                    ko = true;
                            }
                        },
                        {
                            name: "enemy",
                            alias: "large australian man", 
                            text: "That is all. You better not speak a word of this. Otherwise...",
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
                                            global.cutscene = false;
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
        with (objPlayer)
            instance_destroy();
        global.chapter++;
        room_goto(rMom);
    } 
}