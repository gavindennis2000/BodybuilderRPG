// battle create
// sets up battle sequence
/*gmlive*/ if (TEST) { if (live_call()) return live_result; }

// layer = layer_exists(layer_get_id("camera")) ? layer_get_id("camera") : layer_create(-8, "camera");

startBattle = function() {
    with (global.battle) {
        init = true;
        started = false;
        battleRoom = room;
    }
    if (instance_exists(oPlayer)) {
        global.playerSpawn = {
            pX: oPlayer.x, 
            pY: oPlayer.y, 
            pFace: oPlayer.face, 
            spawn: true,
            doorOverride: -1,
            roomGoto: room
        }
        oPlayer.canMove = false;
    }
        
    oCamera.startBattle();
}