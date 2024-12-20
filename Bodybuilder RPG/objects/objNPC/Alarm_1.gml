/*gmlive*/if (TEST) { if (live_call()) return live_result; }

switch (npcID) {
    case "sulik":
        // move him towards the player
        if (y > targetY) { 
            y -= 1;
            image_speed = 0.1;
            alarm[1] = 2;
        } 
        // his dialog
        else if (y == targetY) { 
            targetY = -1;
            image_speed = 0; 
            text = [
                "Well, well, well. I heard there's a new fish in the pond.",
                "I'm Sulik, the #1 ranked bodybuilder in the world!",
                "I can't believe a shrimp like you is competing in  bodybuilding. What an insult!", 
                "This sport is all about mass and intensity, not some pencil neck science-based crap.",
                "I'm going to have my goons keep an eye on you. No one will ever be bigger than me!"
            ];
            action = "exit sulik";
            dialog();
        }
        break;
    
    default:
        break;
}