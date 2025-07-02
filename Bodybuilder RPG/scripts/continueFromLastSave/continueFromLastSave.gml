function continueFromLastSave(){
    // continues from last save after battle death
    
    /*gmlive*/ if (TEST) { if (live_call()) return live_result; }

    global.stats.andro.hp = global.stats.andro.maxhp;
    global.stats.ana.hp = global.stats.ana.maxhp;
    global.stats.doms.hp = global.stats.doms.maxhp;

    objController.goToNextRoom();
}