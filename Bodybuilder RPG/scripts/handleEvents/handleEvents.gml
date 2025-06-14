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
    
    // meet ana for the first time
    if (!global.events.meetAna && room == rOverworld) {
        // global.events.meetAna = true;
        textbox([
            {
                name: "ana",
                alias: "???",
                text: "Hey! Wait!",
                action: "enter ana",
            }
        ], false);
    }
}