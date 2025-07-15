// objTextbox destroy - handle any actions and let the player move again

if (TEST) { if (live_call()) {  // GMLive
    return live_result;
}}

if (instance_exists(objPlayer))
    objPlayer.canMove = (canMove && !(global.cutscene));
    
if (action != -1 && is_method(action))
    action();
else if (action != -1)
    debug("Action provided but unhandled.");