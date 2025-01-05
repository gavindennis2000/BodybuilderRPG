// handle attacks and skills
if (live_call()) return live_result;

switch (selection) {
    // player attacks/skills
    case attacks[0]:  // push
        if (aCounter < 9) {
            // move towards the enemy
            aCounter++;
            player.x += 150/10;
            player.y -= 5;
            alarm[1] = 1;
        }
        else if (aCounter < 10) {
            // wait a little bit before the attack animation
            aCounter++;
            alarm[1] = 15;
        }
        else if (aCounter < 11) {
            // handle damage
            playSound(sndPushAttack);
            var dmg = calculateDamage("push");
            enemyDamage = dmg;
            enemy.hp -= dmg;
            global.stats.ultimate += round(dmg * 0.1);

            // go to the next
            aCounter++;
            alarm[1] = 15;
        }
        else if (aCounter < 12) {
            // jump back towards starting position ( and show the damage )
            aCounter++;
            player.x -= 150/10;
            player.y -= 4;
            alarm[1] = 1;
            alarm[2] = 1;
        }
        else if (aCounter < 16) {
            // jump back towards starting position
            aCounter++;
            player.x -= 150/10;
            player.y -= 4;
            alarm[1] = 1;
        }
        else if (aCounter < 20) {
            // fall back down
            aCounter++;
            player.x -= 150/10;
            player.y += 12;
            alarm[1] = 1;
        }
        else {
            // finalize starting position and go to enemy turn
            player.x = pFinalX;
            player.y = pFinalY;
            if (!instance_exists(objTextbox))
                enemyTurn();
            else 
                alarm[1] = 1;
        }
        break;
    case attacks[1]:  // pull
        if (aCounter < 9) {
            // move towards the enemy
            aCounter++;
            player.x += 150/10;
            player.y -= 5;
            alarm[1] = 1;
        }
        else if (aCounter < 10) {
            // wait a little bit before the attack animation
            aCounter++;
            alarm[1] = 15;
        }
        else if (aCounter < 11) {
            // handle damage
            playSound(sndPullAttack);
            var dmg = calculateDamage("pull");
            enemyDamage = dmg;
            alarm[2] = 1;
            enemy.hp -= dmg;
            global.stats.ultimate += round(dmg * 0.1);

            // go to the next
            aCounter++;
            alarm[1] = 15;
        }
        else if (aCounter < 16) {
            // jump back towards starting position
            aCounter++;
            player.x -= 150/10;
            player.y -= 4;
            alarm[1] = 1;
        }
        else if (aCounter < 20) {
            // fall back down
            aCounter++;
            player.x -= 150/10;
            player.y += 12;
            alarm[1] = 1;
        }
        else {
            // finalize starting position and go to enemy turn
            player.x = pFinalX;
            player.y = pFinalY;
            if (!instance_exists(objTextbox))
                enemyTurn();
            else 
                alarm[1] = 1;
        }
        break;
    case attacks[2]:  // legs
        if (aCounter < 9) {
            // move towards the enemy
            aCounter++;
            player.x += 150/10;
            player.y -= 5;
            alarm[1] = 1;
        }
        else if (aCounter < 10) {
            // wait a little bit before the attack animation
            aCounter++;
            alarm[1] = 15;
        }
        else if (aCounter < 11) {
            // handle damage
            playSound(sndLegAttack);
            var dmg = calculateDamage("legs");
            enemyDamage = dmg;
            alarm[2] = 1;
            enemy.hp -= dmg;
            global.stats.ultimate += round(dmg * 0.1);

            // go to the next
            aCounter++;
            alarm[1] = 15;
        }
        else if (aCounter < 16) {
            // jump back towards starting position
            aCounter++;
            player.x -= 150/10;
            player.y -= 4;
            alarm[1] = 1;
        }
        else if (aCounter < 20) {
            // fall back down
            aCounter++;
            player.x -= 150/10;
            player.y += 12;
            alarm[1] = 1;
        }
        else {
            // finalize starting position and go to enemy turn
            player.x = pFinalX;
            player.y = pFinalY;
            if (!instance_exists(objTextbox)) { enemyTurn(); }
            else { alarm[1] = 1; }
        }
        break;
    case attacks[3]:  // max out
        if (aCounter == 0) {
            global.stats.ultimate = 0;
            aCounter++;
            alarm[1] = 1;
        }
        else if (aCounter == 1) {
            aCounter++;
            ultimateAlpha += 0.01;
            alarm[1] = 90;
        }
        else if (aCounter == 2) {
            aCounter++;
            alarm[1] = 1;
            playSound(sndCriticalAttack);

            // handle damage
            var dmg = global.stats.chest;
            debug($"dmg: {dmg}");
            enemyDamage = dmg;
            enemyDamageY = -1;
            alarm[2] = 1;
            enemy.hp -= dmg;
        }
        else if (aCounter < 25) {
            // diagonal right
            aCounter++;
            alarm[1] = 1;
            player.x += 25;
            player.y -= 10;
        }
        else if (aCounter == 25) {
            // reset
            player.x = pFinalX + 300;
            player.y = pFinalY;
            alarm[1] = 1;
            aCounter++;
            playSound(sndCriticalAttack);
        
            // handle damage
            var dmg = global.stats.shoulders;
            debug($"dmg: {dmg}");
            enemyDamage = dmg;
            enemyDamageY = -1;
            alarm[2] = 1;
            enemy.hp -= dmg;
        }
        else if (aCounter < 50) {
            // diagonal left
            aCounter++;
            alarm[1] = 1;
            player.x -= 25;
            player.y -= 10;
        }
        else if (aCounter == 50) {
            // reset
            player.x = - 40;
            player.y = enemy.y;
            alarm[1] = 1;
            aCounter++;
            playSound(sndCriticalAttack);

            // handle damage
            var dmg = global.stats.back;
            debug($"dmg: {dmg}");
            enemyDamage = dmg;
            enemyDamageY = -1;
            alarm[2] = 1;
            enemy.hp -= dmg;
        }
        else if (aCounter < 75) {
            // right
            aCounter++;
            alarm[1] = 1;
            player.x += 40;
        }
        else if (aCounter == 75) {
            // reset
            player.x = 270 + 32
            player.y = enemy.y;
            alarm[1] = 1;
            aCounter++;
            playSound(sndCriticalAttack);

            // handle damage
            var dmg = global.stats.arms;
            debug($"dmg: {dmg}");
            enemyDamage = dmg;
            enemyDamageY = -1;
            alarm[2] = 1;
            enemy.hp -= dmg;
        }
        else if (aCounter < 100) {
            // left
            aCounter++;
            alarm[1] = 1;
            player.x -= 40;
        }
        else if (aCounter == 100) {
            // reset
            player.x = enemy.x;
            player.y = 270 + 32;
            alarm[1] = 1;
            aCounter++;
            playSound(sndCriticalAttack);

            // handle damage
            var dmg = global.stats.legs;
            debug($"dmg: {dmg}");
            enemyDamage = dmg;
            enemyDamageY = -1;
            alarm[2] = 1;
            enemy.hp -= dmg;
        }
        else if (aCounter < 125) {
            // up
            aCounter++;
            alarm[1] = 1;
            player.y -= 40;
        }
        else if (aCounter == 125) {
            // final reset
            player.x = pFinalX;
            player.y = -32;
            alarm[1] = 1;
            aCounter++;
        }
        else if (aCounter < 150) {
            // down
            aCounter++;
            alarm[1] = 1;
            if (player.y <= pFinalY-30) player.y += 30;
            else player.y = pFinalY;
        }
        else if (aCounter == 150) {
            // last reset
            player.x = pFinalX;
            player.y = pFinalY;
            alarm[1] = 1;
            aCounter++;
        }
        else {
            ultimateAlpha = 0;
            if (instance_exists(objTextbox)) {
                alarm[1] = 1;
            }
            else {
                enemyTurn();
            }
        }
        break;
    case "Scan":
        if (instance_exists(objTextbox)) { alarm[1] = 1; }
        // enemy doesn't get a turn after first scan
        else { 
            if (canScan) { 
                canScan = false;
                playerDamage = -1;
                enemy.attackIndex--;
                endEnemyTurn(); 
            }
            else {
                enemyTurn();
            }
        }
        break;
    case "Item":
        if (instance_exists(objTextbox)) { alarm[1] = 1; }
        else { enemyTurn(); }
        break;
    // enemy attacks/skills
    case "enemy skill":
        // generic condition for enemy skills

        if (aCounter == 0) {
            if (instance_exists(objTextbox)) { 
                alarm[1] = 1; 
                exit;
            }
            // shake the screen
            screenShake();
            instance_create_layer(x, y, "Instances", objTextbox, {
                text: [
                    textBuffer
                ]
            });

            // projectiles
            if (projectile.sprNum != -1) {
                projectile.draw = true;
            }

            alarm[1] = 1;
            aCounter++;
        }
        else {
            // wait for the textbox to go away
            if (instance_exists(objTextbox)) { alarm[1] = 1; }
            else { endEnemyTurn(); }
        }
        break;
    case "charge":
        if (instance_exists(objTextbox)) { alarm[1] = 1; }
            else { endEnemyTurn(); }
        break;
}