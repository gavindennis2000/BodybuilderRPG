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
            playSound(sndAttack);
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
            playSound(sndAttack);
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
            playSound(sndAttack);
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
                debug("draw");
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