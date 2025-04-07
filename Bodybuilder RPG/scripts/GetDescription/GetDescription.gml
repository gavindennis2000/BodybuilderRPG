function GetDescription(item){
    // returns item description

    /*set up gmlive for this function*/ if (TEST) { if (live_call(item)) return live_result; }

    switch (item) {
        case "Choc. Milk":
            return "Central Prairie's flagship drink - Reduces fatigue by 50%.";
        case "Anabolic Taco":
            return "The obnoxious gas you emit will eradicate any foe.";
        default:
            return "No item description available.";
    }
}