// door create
// sets up id and navigation to other rooms
/*gmlive*/ if (TEST) { if (live_call()) return live_result; }

opened = false;

doorType = "door";  // used to differentiate doors, stairs, sliding doors, etcd
doorID = variable_instance_exists(self, "doorID") ? doorID : $"{room_get_name(room)} {x div 10}.{y div 10}";
doorInfo = variable_instance_exists(self, "doorInfo") ? doorInfo : {
    // struct that holds where the door leads
    spawn: true,
    doorOverride: doorID,
    roomGoto: room,
    pX: x, 
    pY: y + 32,
    pFace: "down",
};
moveX = 0;  // used for special effect on sliding doors

switch(doorID) {
    // set the proper door type and
    // get the proper destination for each door

    case "rTest 19.3":
        // test 2 door
        doorInfo.doorOverride = "rTest2 35.12";
        doorInfo.roomGoto = rTest2;
        doorInfo.pFace = "down";
        break;
    case "rTest2 35.12":
        // test 2 door
        doorInfo.doorOverride = "rTest 19.3";
        doorInfo.roomGoto = rTest;
        doorInfo.pFace = "up";
        break;
    default:
        break;
}