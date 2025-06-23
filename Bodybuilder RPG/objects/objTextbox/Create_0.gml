// objTextbox Create
if (TEST) { if (live_call()) {  // GMLive
    return live_result;
}}

layer = layer_create(layer_get_depth(layer_get_id("Instances")) - 10, "TextBox");
fade = 1;
sampleText = [
    {
        name: "andro",
        // text: "One two three four five six seven eight nine"
        text: "It should've been me. It was you all along, wasn't it?"
    },
    {
        name: "samson",
        text: "Why yes it was. Mwahahahaha. test test test test test test test test."
    },
    {
        name: "third",
        text: "Third line of text. Why yes it was. Mwahahahaha. test test test test test test test test."
    },
]
drawText = "";  // the actual text drawn to the string
counter = 0;  // used to slow rate of text drawing
setNewLine = false;  // used to set new lines after a given amount of characters
checkNewLineAt = 44;  // checks if a new line should be automatically inserted
checkNewLineAtAmount = checkNewLineAt;
next = 1;  // index of character to be transferred from text object to drawText
readyForNext = false;  // lets player move on to next paragraph of text
destroy = false;  // used to fade out textbox
screen = -1;  // will the dialog box be on top or bottom?
selection = 0;

// where the textbox is drawn at
textboxY = CAM_HEIGHT - 96;
textboxYTop = textboxY - CAM_HEIGHT + 96;
textboxYBottom = textboxY;
textY = CAM_HEIGHT - 96 + 11;
textYBottom = textY;
textYTop = textY - CAM_HEIGHT + 96;
picY = CAM_HEIGHT - 96 + 16;
picYBottom = picY;
picYTop = picY - CAM_HEIGHT + 96;

// find out if textbox should be at top or bottom of screen
if (instance_exists(objPlayer) && objPlayer.y < camera_get_view_y(view_camera[0]) + CAM_WIDTH / 2 - 96) {
    screen = "bottom";
    textboxY = textboxYBottom;
    textY = textYBottom;
    picY = picYBottom;
}
else {
    screen = "top";
    textboxY = textboxYTop;
    textY = textYTop;
    picY = picYTop;
}