fadeBlack = room_height;
fadeIn = false;
countdown = 0;
countdownNum = 3;
countdownScale = 1;
drawLifters = false;
playerX = room_width + 64;
otherX = -64;
playerFinalX = room_width/4;
otherFinalX = room_width*3/4;
alarm[0] = 30;
image_speed = 0;
lastRep = image_index;

victor = "YOU LOSE.";
victoryTextScale = 0;

playerPullups = 0;
otherPullups = 0;
playerIndex = 0;
otherIndex = 0;
otherSpr = sprPullupPlayer;
highscore = global.highScores[1];
levelUpY = -1;
levelUpAlpha = 0;
timerY = room_height/2 + 20;

fadeAlpha = 0;