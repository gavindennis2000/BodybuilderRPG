// handle battle victory

/*gmlive*/if (TEST) { if (live_call()) return live_result; }

if (audio_is_playing(sndDeath)) {
    alarm[3] = 1;
}

else if (audio_sound_get_gain(global.battleSong) > 0) {
    audio_sound_gain(global.battleSong, 0, 500);
    alarm[3] = 40;
}

else if (turn == "win") {
    // play the fanfare
    audio_play_sound(sndFanfare, 1, true);

    // find which muscles to improve
    var improve = irandom(4);  // it's usually random
    switch (string_lower(enemy.name)) {
        // weak enemies only get one level up
        case "dyel":
            improve = 4;
            break;
        // get the best reward
        case "strongman":
            improve = 3;
            break;
    }
    var txt = [
        $"{enemy.name} has been defeated!",
    ];
    
    array_push(txt, $"{global.characterName}'s muscles have grown!");
    switch (improve) {
        case 0:  // push
            global.stats.chest++;
            global.stats.shoulders++;

            array_push(txt, 
                $"Chest: {global.stats.chest-1} -> {global.stats.chest}",
                $"Shoulders: {global.stats.shoulders-1} -> {global.stats.shoulders}",
            );

            break;
        case 1:  // pull
            global.stats.back++;
            global.stats.arms++;

            array_push(txt, 
                $"Back: {global.stats.back-1} -> {global.stats.back}",
                $"Arms: {global.stats.arms-1} -> {global.stats.arms}",
            );

            break;
        case 2:  // legs
            global.stats.legs += 2;

            array_push(txt, 
                $"Legs: {global.stats.legs-2} -> {global.stats.legs}",
            );

            break;
        case 3:  // full body
            global.stats.chest++;
            global.stats.shoulders++;
            global.stats.back++;
            global.stats.legs++;
            global.stats.arms++;

            array_push(txt, 
                "Lucky bonus: Full body growth!",
                $"Chest: {global.stats.chest-1} -> {global.stats.chest}",
                $"Shoulders: {global.stats.shoulders-1} -> {global.stats.shoulders}",
                $"Back: {global.stats.back-1} -> {global.stats.back}",
                $"Arms: {global.stats.arms-1} -> {global.stats.arms}",
                $"Legs: {global.stats.legs-1} -> {global.stats.legs}",
            );

            break;
        case 4:  // bro split
            // only improve the weakest muscle
            var muscle = global.statsMin[0];
            switch (muscle) {
                case "chest":
                    global.stats.chest++;
                    array_push(txt, $"Chest: {global.stats.chest-1} -> {global.stats.chest}");
                    break;
                case "shoulders":
                    global.stats.shoulders++;
                    array_push(txt, $"Shoulders: {global.stats.shoulders-1} -> {global.stats.shoulders}");
                    break;
                case "back":
                    global.stats.back++;
                    array_push(txt, $"Back: {global.stats.back-1} -> {global.stats.back}");
                    break;
                case "arms":
                    global.stats.arms++;
                    array_push(txt, $"Arms: {global.stats.arms-1} -> {global.stats.arms}");
                    break;
                case "legs":
                default:
                    global.stats.legs++;
                    array_push(txt, $"Legs: {global.stats.legs-1} -> {global.stats.legs}");
                    break;
            }
            break;
    }

    // tell the player what they earned
    instance_create_layer(x, y, "Instances", objTextbox, {
        text: txt,
    });

    // go back to the previous room
    alarm[0] = 1;
}