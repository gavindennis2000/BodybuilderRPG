// obj
if (TEST) { if (live_call()) {  // GMLive
    return live_result;
}}

if (action != -1) {
    handleAction(action);
}

if (instance_exists(objPlayer))
    objPlayer.canMove = canMove;