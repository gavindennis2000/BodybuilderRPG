/// @description increment other index
if (alarm_get(2) <= 0) { exit; }

otherIndex++;
if (otherIndex == 2) { otherPullups++; }
if (otherIndex > sprite_get_number(otherSpr)) { otherIndex = 0; }
alarm[1] = 7;