function getMoves(battleID){
    // get's move set based on battle id

    /*gmlive*/ if (TEST) { if (live_call(battleID)) return live_result; }

    var moves = [];

    switch (battleID) {
        default:
            moves = ["Attack"];
            break;
    }

    return moves;
}