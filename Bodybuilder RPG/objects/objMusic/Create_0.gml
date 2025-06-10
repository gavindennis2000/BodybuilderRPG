// objMusic create
if (TEST) { if (live_call()) {  // GMLive
    return live_result;
}}

var brandonIsInRoom = false;
if (TEST && brandonIsInRoom)
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

getCurrentSong = function() {
    // get's current song at start of room

    /*gmlive*/ if (TEST) { if (live_call()) return live_result; }

    global.previousSong = global.currentSong;
    switch(global.roomVar) {
        // sorted alphabetically
        case "Anabolic Heights":
            global.currentSong = sndAnabolicHeights;
            break;
        case "Central Prairie":
        // case "Overworld":
            global.currentSong = sndCentralPrairie;
            break;
        case "Creatine Island":
            global.currentSong = sndCreatineIsland;
            break;
        case "Leangroundburg":
            global.currentSong = sndLeangroundburg;
            break;
        case "Mom's House":
            global.currentSong = sndMom;
            break;
        case "Wheyford":
            global.currentSong = sndWheyford;
            break;
        default:
            global.currentSong = -1;
            break;
    }

    return;
}