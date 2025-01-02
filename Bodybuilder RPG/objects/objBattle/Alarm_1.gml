// handle attacks and skills
if (live_call()) return live_result;

switch (selection) {
    case attacks[0]:
    case attacks[1]:
    case attacks[2]:
        if (aCounter < 9) {
            aCounter++;
            player.x += 150/10;
            player.y -= 5;
            alarm[1] = 1;
        }
        else if (aCounter < 10) {
            aCounter++;
            alarm[1] = 15;
        }
        else if (aCounter < 11) {
            playSound(sndAttack);
            aCounter++;
            alarm[1] = 15;
        }
        else if (aCounter < 16) {
            aCounter++;
            player.x -= 150/10;
            player.y -= 4;
            alarm[1] = 1;
        }
        else if (aCounter < 20) {
            aCounter++;
            player.x -= 150/10;
            player.y += 12;
            alarm[1] = 1;
        }
        else {
            player.x = pFinalX;
            player.y = pFinalY;
            enemyTurn();
        }
        break;
    case "Scan":
        if (instance_exists(objTextbox)) { alarm[1] = 10; }
        // enemy doesn't get a turn after scans
        else { endEnemyTurn(); }
        break;
    case "Item":
        if (instance_exists(objTextbox)) { alarm[1] = 10; }
        else { enemyTurn(); }
        break;
    }