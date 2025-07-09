function handleItems() {
	// give id's and sometimes text to items
	
	if (!instance_exists(objItem))
	    exit;

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
				finalText = "no text";
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
	            finalText = $"Bodybuilding Nutrition Company ``(no soliciting)"
	            break;
			case inst_699C5C98:
				itemID = "sign";
				finalText = "Dangle's Bodybuilding Bargains"
				break;
			case inst_25232AF4:
				itemID = "sign";
				finalText = "Wheyford Barbell Powerlifting Gym";
				break;
        
	        // stores
	        // bbnc
	        case inst_2F5A5C4E:
	            itemID = "bbnc owner";
	            break;

			// wheyford barbell
			case inst_215F6685:
				itemID = "wfbb switch 1";
				break;
			case inst_2AFDD0A0:
				itemID = "wfbb switch 2";
				break;
			case inst_27DA2E:
				itemID = "wfbb switch 3";
				break;
			case inst_52197F6E:
				itemID = "wfbb roadblock 1";
				image_blend = c_red;
				finalText = "no text";
				break;
			case inst_243F743A:
				itemID = "wfbb roadblock 2";
				image_blend = c_red;
				finalText = "no text";
				break;
			case inst_5C6E248D:
				itemID = "chest";
				chestID = "wheyford barbell 1";
				opened = array_contains(global.openedChests, chestID);
				if (opened)
					finalText = "no text";
				break;
			case inst_457830A1:
				itemID = "wheyford barbell boss";
				break;
			case inst_192731DD:
				itemID = "chest";
				chestID = "wheyford barbell 2";
				opened = array_contains(global.openedChests, chestID);
				break;
			case inst_768EB297:
				itemID = "chest";
				chestID = "wheyford barbell 3";
				opened = array_contains(global.openedChests, chestID);
				break;
            
	        // not found
	        default:
	            itemID = "item not found";
	            // debug($"Item not found: {id}");
	            break;
	    }
	}
}