/// @description next turn
if (state != "wait") {
	state = "wait";
	ctr = (haste and ctrAdd > 1) ? ctr + ctrAdd-1: ctr + ctrAdd;
	ctrAdd = 0;
	with objBattle { nextTurn(); }
}