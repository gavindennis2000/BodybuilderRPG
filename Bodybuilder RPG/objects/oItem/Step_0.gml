// item step
// let's player talk to items and npcs
/*gmlive*/ if (TEST) { if (live_call()) return live_result; }

if (!instance_exists(oPlayer))
    exit;

var keyTalk = input_check_pressed("south");
var playerFacingLeftOrRight = ( oPlayer.face == "left" || oPlayer.face == "right" );
var playerFacingUpOrDown = ( oPlayer.face == "up" || oPlayer.face == "down" );

var contact = (
    playerFacingLeftOrRight && oPlayer.y == y && abs(oPlayer.x - x) == 32 ||
    playerFacingUpOrDown && oPlayer.x == x && abs(oPlayer.y - y) == 32
)

if (contact && keyTalk && !instance_exists(oTextbox)) {
    if (npcID != "item") {
        // set the npc to face the player
        if (variable_instance_exists(self, "face")) {
            debug("changing face")
            switch(oPlayer.face) {
                case "left":
                    face = "right";
                    break;
                case "right":
                    face = "left";
                    break;
                case "up":
                    face = "down";
                    break;
                case "down":
                    face = "up";
                    break;
            }
        }
        // set an alarm for the npc to return to it's starting face
        alarm_set(0, 30);
    }

    // stop the player's movement
    oPlayer.canMove = false;

    // get the right text and read it
    var text = (npcID == "item") ? getItemText(itemID, hasTalked) : getDialog(npcID, hasTalked);
    hasTalked = true;
    textbox(text);
}