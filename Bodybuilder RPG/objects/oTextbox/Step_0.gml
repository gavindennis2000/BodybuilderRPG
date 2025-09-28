/*gmlive*/ if (TEST) { if (live_call()) return live_result; }

var keyNext = input_check_pressed("south");
var getNextText = function () {
    // get the next object of text and reset the draw string
    // first, make sure there is text to get, otherwise destroy the textbox
    if (array_length(textArr) == 0) {
        instance_destroy();
        exit;
    }

    // get the next text object if the array is good
    textObj = variable_clone(textArr[0]);
    array_delete(textArr, 0, 1);
    if (is_string(textObj))
        textObj = { text: textObj };
    drawStr = "";
    drawStrIndex = 0;
    
    // update the name of the person speaking
    if (variable_struct_exists(textObj, "name"))
        name = textObj.name;

    // update the prompt if there is one
    prompt = (variable_struct_exists(textObj, "prompt")) ? textObj.prompt : -1;

    // update the action if there is one
    var action = (variable_struct_exists(textObj, "action")) ? textObj.action: -1;
    if (is_method(action))
        action();

    // update ondestroy function if necessary
    onDestroy = (variable_struct_exists(textObj, "onDestroy")) ? textObj.onDestroy: onDestroy;
}

if (textObj == -1) {
        getNextText();
}

// set up the final string to draw
var current = variable_clone(textObj.text);
if (drawStr != current) {
    if (keyNext)
        drawStr = current; 
    else 
        drawStr += string_char_at(current, ++drawStrIndex);
}
else if (keyNext && prompt == -1) {
    // just get the next line of text
    getNextText();
}
else if (prompt != -1) {
    // show the prompt
    showPrompt = true;

    if (promptScale == 1) {
        // navigate the prompt
        var keyUp = input_check_pressed("up");
        var keyDown = input_check_pressed("down");

        if (keyDown && promptSelection == 0 || keyUp && promptSelection == 1) {
            playSound(sndCursor);
            promptSelection = promptSelection == 0 ? 1 : 0;
        }
        else if (keyNext) {
            playSound(sndCursor);
            var answer = promptSelection == 0 ? prompt[1] : prompt[3];
            if (is_method(answer)) {
                // if the prompt is linked to a function, run the function and exit out of the prompt
                answer();
                promptScale = 0;
                showPrompt = false;
                getNextText();
            }
        }
    }
}