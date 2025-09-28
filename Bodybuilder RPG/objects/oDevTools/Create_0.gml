// dev tools create 
// destroy if test mode is off
/*gmlive*/ if (TEST) { if (live_call()) return live_result; }

if (!TEST)
    instance_destroy();

global.showDetails = (!variable_global_exists("showDetails")) ? false : global.showDetails;