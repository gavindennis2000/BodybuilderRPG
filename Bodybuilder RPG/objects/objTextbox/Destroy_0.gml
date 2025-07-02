// obj
if (TEST) { if (live_call()) {  // GMLive
    return live_result;
}}

if (instance_exists(objPlayer))
    objPlayer.canMove = canMove;
    
if (action != -1) {
    if (is_method(action))
        action();
    else
        handleAction(action);
}
// else if (prompt != -1) {
//     if (is_method(prompt[selection]))
//         prompt[selection]();
// }
