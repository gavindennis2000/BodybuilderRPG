function addToInventory(item, quantity = 1) {
    // adds item to inventory

    /*gmlive*/ if (TEST) { if (live_call(item, quantity)) return live_result; }

    var inv = global.inventory;
    var found = false;
    
    for (var i = 0; i < array_length(inv); i++) {
        if (inv[i].name == item) {
            found = true;
            inv[i].quantity += quantity;
            if (inv[i].quantity > 99)
                inv[i].quantity = 99;
            return;
        }
    }
    
    if (!found)
        if (quantity > 99)
            quantity = 99;
        array_push(global.inventory, {
            name: item, 
            quantity: quantity
        });

    return;
}