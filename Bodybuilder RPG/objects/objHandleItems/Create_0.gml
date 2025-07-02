// objItemHandler create
if (TEST) { if (live_call()) {  // GMLive
    return live_result;
}}

if (!instance_exists(objItem))
    exit;

with (objItem) {
    switch (itemIdentifier) {
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
        
        // overworld
        case inst_31A09F3:
            itemID = "sign";
            finalText = {
                text: $"Mom's House"
            };
            break;
        case inst_624F3169:
            itemID = "sign";
            finalText = {
                text: $"Harvey's House"
            };
            break;
        case inst_74DD81CD:
            itemID = "sign";
            finalText = {
                text: $"Mason's House"
            };
            break;
        case inst_410CADC5:
            itemID = "sign";
            finalText = {
                text: $"Ana's House"
            };
            break;
        case inst_1046573B:
            itemID = "sign";
            finalText = {
                text: $"Central Prairie Community College"
            };
            break;
        case inst_3AD879B1:
            itemID = "sign";
            finalText = {
                text: $"Pump Palace Bodybuilding Gym"
            };
            break;
        case inst_178CDEA8:
            itemID = "sign";
            finalText = $"Bodybuilding Nutrition Company"
            break;
        
        // stores
        // bbnc
        case inst_2F5A5C4E:
            itemID = "bbnc owner";
            break;
            
        // not found
        default:
            itemID = "item not found";
            // debug($"Item not found: {id}");
            break;
    }
}