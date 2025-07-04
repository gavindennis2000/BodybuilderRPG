function useItemGlobal(item, target = -1){
	// global function for using an item (battle or pause menu)

	/*gmlive*/ if (TEST) { if (live_call(item, target)) return live_result; }

	debug($"{item} {target}");

	var itemToUse = item.name;
	item.quantity--;

	// if you used the last item, delete it
	if (item.quantity <= 0)
		for (var i = 0; i < array_length(global.inventory); i++)
			if (global.inventory[i].name == itemToUse) {
				array_delete(global.inventory, i, 1);
				debug(array_length(global.inventory));
				debug(global.inventory);
			}

	switch (itemToUse) {
		case "Choc. Milk":
			if (room == rBattle)
				playSound(sndChocMilk);
			switch (target) {
				case "andro":
					global.stats.andro.hp += 200;
					if (global.stats.andro.hp > global.stats.andro.maxhp)
						global.stats.andro.hp = global.stats.andro.maxhp;
					return;
				case "ana":
					global.stats.ana.hp += 200;
					if (global.stats.ana.hp > global.stats.ana.maxhp)
						global.stats.ana.hp = global.stats.ana.maxhp;
					return;
				case "doms":
					global.stats.doms.hp += 200;
					if (global.stats.doms.hp > global.stats.doms.maxhp)
						global.stats.doms.hp = global.stats.doms.maxhp;
					return;
				default:
					debug("error: target not specified");
					return;
			}
			break;
	}

	debug("successfully used item");

	return;
}