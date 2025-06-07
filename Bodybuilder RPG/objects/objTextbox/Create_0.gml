// objTextbox Create
if (TEST) { if (live_call()) {  // GMLive
    return live_result;
}}

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
text = sampleText;
currentTextObj = sampleText[textIndex];
drawText = "";  // the actual text drawn to the string
counter = 0;  // used to slow rate of text drawing
setNewLine = false;  // used to set new lines after a given amount of characters
checkNewLineAt = 44;  // checks if a new line should be automatically inserted
checkNewLineAtAmount = checkNewLineAt;
next = 1;  // index of character to be transferred from text object to drawText
readyForNext = false;  // lets player move on to next paragraph of text
destroy = false;  // used to fade out textbox