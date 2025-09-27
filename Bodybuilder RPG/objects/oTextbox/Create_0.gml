// oTextbox create
/*gmlive*/ if (TEST) { if (live_call()) return live_result; }

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
name = "";
// prompt stuff
prompt = -1;
showPrompt = false;
promptScale = 0;
promptSelection = 0;

canMove = variable_instance_exists(self, "canMove") ? canMove : true;