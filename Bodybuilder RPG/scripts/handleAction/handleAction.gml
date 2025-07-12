function handleAction(action) {
    // handles action from dialog

    /*gmlive*/ if (TEST) { if (live_call(action)) return live_result; }

    debug($"action handled: {action}");

    return;
}