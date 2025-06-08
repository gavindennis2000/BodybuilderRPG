// objTextbox step
if (TEST) { if (live_call()) {  // GMLive
    return live_result;
}}

if (currentTextObj == -1) {
    if (text == -1) {
        show_debug_message("no text for dialog");
        instance_destroy();
    }
    currentTextObj = (is_array(text)) ? variable_clone(text[0]) : variable_clone(text);
}
var confirm = input_check_pressed("south");
var getNextChar = function() {
    // grabs next char from currentTextObj and feeds it to drawText
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

if (confirm) {
    if (readyForNext) {
        readyForNext = false;
        next = 1;
        counter = 0;
        drawText = "";
        checkNewLineAt = checkNewLineAtAmount;
        if (++textIndex < array_length(text))
            currentTextObj = text[textIndex];
        else 
            destroy = true;
    }
    else {
        while (string_length(currentTextObj.text) >= next)
            getNextChar();
    }
}