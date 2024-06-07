// status ailments
if (haste) {
	image_blend = c_red;
}
else if (brace) {
	image_blend = c_blue;	
}
else {
	image_blend = c_white;	
}

if (isEnemy and ko) {
	koFade += 0.7;
	draw_sprite_part_ext(sprite_index, image_index, 0, 0, sprite_width, sprite_height - koFade, x, y, image_xscale, image_yscale, image_blend, 1);
	draw_sprite_part_ext(sprite_index, image_index, 0, 0, sprite_width, sprite_height - koFade, x, y, image_xscale, image_yscale, c_black, koFade/30);
}
else
	draw_self();

// draw damage during attack
if (showDamage) {
	if dmgY > 0 { dmgY -= 0.25; }
	draw_set_font(fntHealth);
	fontX(fa_center);
	fontY(fa_bottom);
	var tX = target.x;
	var tY = target.y - target.sprite_height/2;
	//if (target.fighter == "npc") { tX -= 16; tY -= 16; }
	if (damage >= 0) { draw_text_border(tX , tY + dmgY, damage, c_white, 1); }
}

if (fadeRoom > 0) {
	var tempD = depth;
	depth = -100;
	var tempI = image_alpha;
	image_alpha = fadeRoom;
	draw_rectangle_color(0, 0, room_width, room_height, c_black, c_black, c_black, c_black, false);
	image_alpha = tempI;
	//depth = tempD;
}

// determine initial sprite
if (sprInit == -1) { sprInit = sprite_index; }