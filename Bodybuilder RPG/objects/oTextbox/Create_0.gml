// oTextbox create
/*gmlive*/ if (TEST) { if (live_call()) return live_result; }

layer = layer_exists(layer_get_id("textbox")) ? layer_get_id("textbox") : layer_create(-999, "textbox");
textArr = variable_instance_exists(self, "textArr") ? textArr : [{
    name: "name",
    text: "this is my text",
    prompt: [
        "Yes.",
        "No. Longer text to make it bigger."
    ]
}];
textObj = -1;  // object extracted from text array
drawStr = "";  // string that is drawn to the screen
drawStrIndex = 0;
newLineCounter = 0;
name = "";
textboxScale = 0;
textboxScaleChange = 0.1;
glowAmount = 0;
glowChange = 0.1;

// prompt stuff
prompt = -1;
showPrompt = false;
promptScale = 0;
promptSelection = 0;

canMove = variable_instance_exists(self, "canMove") ? canMove : true;
onDestroy = -1;  // function that executes when text ends