// objItemHandler create
if (TEST) { if (live_call()) {  // GMLive
    return live_result;
}}

with (objItem) {
    switch (id) {
        // mom's house
        case inst_2D4D067D:
            itemID = "mirror";
            break;
        case inst_59F2308C:
            itemID = "gymtendo 64";
            break;
        case inst_7C5E1A9B:
            itemID = "home bench press";
            break;
        case inst_3FE4D9AC:
            itemID = "home bed";
            break;
        
        // not found
        default:
            itemID = "item not found";
            debug($"Item not found: {id}");
            break;
    }
}