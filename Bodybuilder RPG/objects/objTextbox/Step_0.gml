// objTextbox step
if (TEST) { if (live_call()) {  // GMLive
    return live_result;
}}

var confirm = input_check_pressed("south");
var getNext = function() {
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
        show_debug_message("ready for next");
    }
}

if (fade != 0)
    exit;

if (counter % 2 == 0) {
    // keep building the current text string
    getNext();
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
        show_debug_message($"textindex {textIndex} arraylength {array_length(text)}");
        if (++textIndex < array_length(text))
            currentTextObj = text[textIndex];
        else 
            destroy = true;
    }
    else {
        show_debug_message("getting all");
        while (string_length(currentTextObj.text) >= next)
            getNext();
    }
}