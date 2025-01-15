// go back to the room

switch (global.workout) {
    case "novice leg":
        msg = ["Squat workout complete."];
        if (reps == maxReps) { array_push(msg, "Quads have been obliterated."); }
        break;
    case "intermediate push":
        msg = ["Bench press workout complete."];
        break;
    case "advanced pull":
        msg = ["Bicep workout complete."];
        break;
}
exitMinigame();