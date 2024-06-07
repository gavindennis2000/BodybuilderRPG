/// @description fade after victory


	
if (fadeRoom >= 1) {
	 room_goto(roomAP);
}
else {
	fadeRoom += 0.1;
	alarm[1] = 3;
}