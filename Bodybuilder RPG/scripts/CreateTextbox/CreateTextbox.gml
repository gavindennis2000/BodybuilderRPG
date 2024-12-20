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