// objMusic create
if (TEST) { if (live_call()) {  // GMLive
    return live_result;
}}

if (TEST && NO_MUSIC)
    instance_destroy();

aTime = 20;

if (!variable_global_exists("currentSong"))
    global.currentSong = -1;
if (!variable_global_exists("previousSong"))
    global.previousSong = -1;
if (!variable_global_exists("songPlaying"))
    global.songPlaying = -1;
if (!variable_global_exists("trackPosition"))
    global.trackPosition = {
        name: -1,
        position: -1
    };

// music functions
death = function() {
    // fades battle music

    /*gmlive*/ if (TEST) { if (live_call()) return live_result; }

    debug("music death")
    alarm_set(1, 1);
    
    return;
}

getCurrentSong = function() {
    // get's current song at start of room

    /*gmlive*/ if (TEST) { if (live_call()) return live_result; }

    global.previousSong = global.currentSong;
    switch(global.roomVar) {
        // sorted alphabetically
        case "BBNC":
            global.currentSong = sndBBNC;
            break;
        case "Anabolic Heights":
            global.currentSong = sndAnabolicHeights;
            break;
        case "Central Prairie":
            global.currentSong = sndCentralPrairie;
            break;
        case "Creatine Cove":
            global.currentSong = sndCreatineCove;
            break;
        case "Leangroundburg":
            global.currentSong = sndLeangroundburg;
            break;
        case "Mom's House":
            global.currentSong = sndMom;
            break;
        case "Pump Palace":
            global.currentSong = sndPumpPalace;
            break;
        case "Wheyford":
            global.currentSong = sndWheyford;
            break;
        case "Wheyford Barbell":
            global.currentSong = sndDanger;
            break;
        default:
            global.currentSong = sndCreatineCove;
            break;
    }

    return;
}

playBattleMusic = function(music) {
    // pauses current music and plays battle music

    if (audio_is_playing(global.songPlaying))
        audio_pause_sound(global.songPlaying);
        
    audio_sound_gain(global.battleMusic, 1, 0);
    global.battleMusic = audio_play_sound(music, 1, true);
}