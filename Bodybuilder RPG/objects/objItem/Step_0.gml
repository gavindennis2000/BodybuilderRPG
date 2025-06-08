// obj
if (TEST) { if (live_call()) {  // GMLive
    return live_result;
}}

if (instance_exists(objPlayer))
    touching = (
        place_meeting(x + 32, y, objPlayer) && objPlayer.face == "left" || 
        place_meeting(x - 32, y, objPlayer) && objPlayer.face == "right" || 
        place_meeting(x, y + 32, objPlayer) && objPlayer.face == "up" || 
        place_meeting(x, y - 32, objPlayer) && objPlayer.face == "down"
    )

if (touching && !instance_exists(objTextbox)) {
    if (!instance_exists(objAction))
        instance_create_layer(x, y, layer, objAction);
    if (input_check_pressed("south") && objPlayer.canMove) {
        // get and show dialog
        var text = handleDialog(-1, itemID);
        debug(text);
        textbox(text);
    }
}