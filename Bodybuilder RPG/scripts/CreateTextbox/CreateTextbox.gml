// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function dialog() {
    if (variable_instance_exists(self, "text")) {
        if (!is_array(text[0])) { text = [text]; }
        instance_create_layer(x, y, layer, objTextbox, {
            text: other.text[other.textIndex], 
            prompt: other.prompt, 
            action: other.action,
            npcID: npcID 
        });
    }
}

function createTextbox(text, prompt = false, action = -1, npcID = -1) {
    // create textbox shortcut

    // convert text to array
    if (!is_array(text)) {
        text = [text];
    }
    // create the object
    instance_create_layer(0, 0, "Instances", objTextbox, {
        text: text,
        prompt: prompt,
        action: action,
        npcID: npcID,
    });
}