if (!TEST) instance_destroy();

draw = false;
option = "";
depth = -100;
if (!variable_global_exists("noEncounters")) { global.noEncounters = false; }