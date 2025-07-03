// objPlayerSpawner room start

// creates the player if he doesn't exist

if (TEST) { if (live_call()) {  // GMLive
    return live_result;
}}

if (!instance_exists(objPlayer))
	with (instance_create_layer(x, y, layer, objPlayer)) {
        if (room == rMom)
            face = "left";
    }

	
instance_destroy();