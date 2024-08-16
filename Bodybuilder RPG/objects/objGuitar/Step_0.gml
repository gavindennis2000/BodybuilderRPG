counter++;
if (rectangleY < 10) { rectangleX[rectangleY] += 40; }
if (rectangleX[rectangleY] >= room_width/2 and rectangleY < 8) { rectangleX[rectangleY+1] += 40;}
if (rectangleX[rectangleY] >= room_width and rectangleY < 9) { rectangleY++; }

if (playerMove and playerX > pFinalX) { playerX -= 8; }