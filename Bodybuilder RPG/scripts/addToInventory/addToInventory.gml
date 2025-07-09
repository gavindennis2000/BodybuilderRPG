function addToInventory(item, quantity = 1) {
    // adds item to inventory

    /*gmlive*/ if (TEST) { if (live_call(item, quantity)) return live_result; }

    var inv = global.inventory;
    var found = false;
    
    for (var i = 0; i < array_length(inv); i++) {
        if (inv[i].name == item) {
            found = true;
            inv[i].quantity += quantity;
            return;
        }
    }
    
    if (!found)
        array_push(global.inventory, {
            name: item, 
            quantity: quantity
        });

    return;
}