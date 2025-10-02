// game controller room start
// spawns player, makes other controllers, fades in/out the room
/*gmlive*/ if (TEST) { if (live_call()) return live_result; }

// spawn the player
if (global.playerSpawn.spawn) {
    var p = global.playerSpawn;
    if (variable_struct_exists(p, "doorOverride") && p.doorOverride != -1) {
        var obj = -1;
        with (oDoor) {
            debug(doorID);
            if (doorID == p.doorOverride)
                obj = self;
        }
        debug(obj)
        if (obj == -1)
            {}    
        else {
            var pX = obj.x;
            var pY = obj.y;
            switch (p.pFace) {
                case "up":
                    pY -= 32;
                    break;
                case "down":
                    pY += 32;
                    break;
                case "left":
                    pX -= 32;
                    break;
                case "right":
                    pX += 32;
                    break;
            }
            instance_create_layer(pX, pY, "Instances", oPlayer, {
                face: p.pFace,
                canMove: !changingRooms
            });
        }
    }
    else {
        instance_create_layer(p.pX, p.pY, "Instances", oPlayer, {
            face: p.pFace,
            canMove: !changingRooms
        });
    }
}

// make any other controllers
if (!instance_exists(oDevTools))
    instance_create_layer(0, 0, "Instances", oDevTools);
if (!instance_exists(oCamera))
    instance_create_layer(0, 0, "Instances", oCamera);

// fade in the room
if (fadeAmount > 0) {
    alarm_set(1, 1);
}