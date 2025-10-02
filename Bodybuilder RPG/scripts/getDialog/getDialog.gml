function getDialog(npcID = "npc", hasTalked) {
    // gets dialog for npc's 
    //
    // for certain characters, they will say something different if you've already
    // talked to them
    //
    /*gmlive*/ if (TEST) { if (live_call(npcID)) return live_result; }

    switch(npcID) {
        case "test1":
            return (!hasTalked) ? [
                {
                    name: "Test Guy", 
                    text: "Hey. I'm the first test.",
                    onDelete: function() {
                        debug("on delete worked", -1);
                    }
                },
                "Is everything working okay? Is everything working okay? Is everything working okay?",
                "What about now?",
                {
                    text: "This should still have my name and a prompt.",
                    prompt: [
                        "It worked.",
                        function() {
                            debug("nothing",-1)
                        },
                        "It didn't work.",
                        function() {
                            debug("nothing",-1)
                        }
                    ]
                }
            ] : [
                {
                    text: "We've already talked..."
                }
            ];
        default:
            // npc not found
            return $"dialog not found for \"{npcID}\"";
            break;
    }
}