/// @description Create player if he doesn't exist
if (!instance_exists(objController)) { instance_create_layer(x, y, "Instances", objController); }
if (!instance_exists(objPlayer)) { instance_create_layer(x, y, "Instances", objPlayer); }
if (!instance_exists(objCamera)) { instance_create_layer(x, y, "Instances", objCamera); }

instance_destroy();