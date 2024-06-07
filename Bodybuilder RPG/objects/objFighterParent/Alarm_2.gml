/// @description go back after attack
if (!isEnemy and x < xstart) or (isEnemy and x > xstart) {
	x += goBack/10;
	alarm[2] = 1;
	y -= yChange/9 + 6;
}
if (!isEnemy and x > xstart - goBack/5) or (isEnemy and x < xstart - goBack/5)  {
	y += 20;	
}
if (!isEnemy and x >= xstart) or (isEnemy and x <= xstart) {
	goBack = 0;
	x = xstart;
	y = ystart;
	alarm[3] = 1;
}