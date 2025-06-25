// objTextbox step
if (TEST) { if (live_call()) {  // GMLive
    return live_result;
}}

if (currentTextObj == -1) {
    if (text == -1) {
        debug("no text to show");
        instance_destroy();
    }
    if (is_string(text))
        currentTextObj = {
            text: text,
        }
    else
        currentTextObj = (is_array(text)) ? variable_clone(text[0]) : variable_clone(text);
    prompt = (variable_struct_exists(currentTextObj, "prompt")) ? currentTextObj.prompt : -1;
    canMove = (variable_struct_exists(currentTextObj, "canMove")) ? currentTextObj.canMove : canMove;
    action = (variable_struct_exists(currentTextObj, "action")) ? currentTextObj.action: -1;
}
var confirm = input_check_pressed("south");
var getNextChar = function() {
    // grabs next char from currentTextObj and feeds it to drawText
    if (text == -1) {
        debug("no text to show");
        instance_destroy();
    }
    if (string_length(currentTextObj.text) >= next) {
        if ((setNewLine && string_char_at(currentTextObj.text, next) == " ") || string_char_at(currentTextObj.text, next) == "`") {
            drawText = string_concat(drawText, "\n");
            setNewLine = false;
            checkNewLineAt = next + checkNewLineAtAmount;
        }
        else
            drawText = string_concat(drawText, string_char_at(currentTextObj.text, next));
        next++
        if (next >= checkNewLineAt)
            setNewLine = true;
    }
    else if (!readyForNext) {
        readyForNext = true;
    }
}

if (fade != 0)
    exit;

if (counter % 2 == 0) {
    // keep building the current text string
    getNextChar();
}

// increment counter
counter++;

if (input_check_pressed("left") && prompt != -1 && readyForNext && selection == 1) {
    playSound(sndCursor);
    selection = 0;
}
else if (input_check_pressed("right") && prompt != -1 && readyForNext && selection == 0) {
    playSound(sndCursor);
    selection = 1;
}

if (confirm) {
    if (readyForNext) {
        readyForNext = false;
        next = 1;
        counter = 0;
        drawText = "";
        checkNewLineAt = checkNewLineAtAmount;
        setNewLine = false;
        if (prompt != -1) {
                playSound(sndCursor);
                if (is_array(prompt[1 + selection * 2])) {
                    for (var i = 0; i < array_length(prompt[1 + selection * 2]); i++)
                        array_insert(text, textIndex + i + 1, prompt[1 + selection * 2][i])
                    if (++textIndex < array_length(text)) {
                        currentTextObj = variable_clone(text[textIndex]);
                        prompt = (variable_struct_exists(currentTextObj, "prompt")) ? currentTextObj.prompt : -1;
                        canMove = (variable_struct_exists(currentTextObj, "canMove")) ? currentTextObj.canMove : canMove;
                        action = (variable_struct_exists(currentTextObj, "action")) ? currentTextObj.action: -1;
                    } 
                    else
                        destroy = true;
                }
            }
        else if (++textIndex < array_length(text)) {
            currentTextObj = variable_clone(text[textIndex]);
            prompt = (variable_struct_exists(currentTextObj, "prompt")) ? currentTextObj.prompt : -1;
            canMove = (variable_struct_exists(currentTextObj, "canMove")) ? currentTextObj.canMove : canMove;
            action = (variable_struct_exists(currentTextObj, "action")) ? currentTextObj.action: -1;
        }
        else
            destroy = true;
    }
    else if (prompt == -1) {
        while (string_length(currentTextObj.text) >= next)
            getNextChar();
    }
}