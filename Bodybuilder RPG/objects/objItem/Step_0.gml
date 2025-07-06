// objItem step

if (TEST) { if (live_call()) {  // GMLive
    return live_result;
}}

touching = false;
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
    if (input_check_pressed("south") && objPlayer.canMove && objPlayer.targetX == 0 && objPlayer.targetY == 0) {
        // get and show dialog
        if (finalText == -1) {
            handleDialog(-1, itemID);
            if (alreadyTalked && is_array(finalText))
                array_delete(finalText, 0, textIndex);
            textbox(text);
            alreadyTalked = true;
        }
        else if (finalText == "no text")
            exit;
        else
            textbox(finalText);
    }
}