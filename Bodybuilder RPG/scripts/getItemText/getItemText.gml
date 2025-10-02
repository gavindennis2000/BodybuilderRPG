function getItemText(itemID = "item not found", hasTalked) {
    // gets text based on item id
    /*gmlive*/ if (TEST) { if (live_call(itemID, hasTalked)) return live_result; }
    
    switch(itemID) {
        default:
            return $"Text not found for \"{itemID}\".";
    }
}