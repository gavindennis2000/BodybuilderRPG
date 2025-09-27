// room start

/*gmlive*/ if (TEST) { if (live_call()) return live_result; }

// spawn the player
if (global.playerSpawn.spawn) {
    var p = global.playerSpawn;
    instance_create_layer(p.pX, p.pY, "Instances", oPlayer, {
        face: p.pFace}
    );
}

// make any other controllers
if (!instance_exists(oDevTools))
    instance_create_layer(0, 0, "Instances", oDevTools);