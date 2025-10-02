// item create
/*gmlive*/ if (TEST) { if (live_call()) return live_result; }

npcID = "item";
itemID = variable_instance_exists(self, "itemID") ? itemID : "item not found";
hasTalked = false;